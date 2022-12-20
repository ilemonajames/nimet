<?php

namespace App\Http\Controllers\Student;
use App\Http\Controllers\Controller;
use App\Lib\HelperTrait;
use Dompdf\Options;
use Illuminate\Http\Request;


use App\Lesson;
use App\Course;
use App\Student;
use App\StudentExam;
use App\Exam;
use App\V2\Model\AttendanceTable;
use App\V2\Model\SessionLessonTable;
use App\V2\Model\SessionTable;
use App\V2\Model\StudentSessionTable;
use App\V2\Model\StudentExamOptionTable;
use App\V2\Model\StudentExamTable;
use App\V2\Model\ExamGradeTable;
use App\V2\Model\ExamOptionTable;
use App\V2\Model\ExamQuestionTable;
use App\V2\Model\ExamTable;
use Dompdf\Dompdf;
use App\Lib\UtilityFunctions;
use Illuminate\Support\Carbon;
use Laminas\EventManager\EventManagerInterface;
use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\Session\Container;
use Laminas\View\Model\JsonModel;
use Laminas\View\Model\ViewModel;

class ExamController extends Controller {

    use HelperTrait;
    public function setEventManager(EventManagerInterface $events)
    {
        parent::setEventManager($events);
        $controller = $this;
        $events->attach('dispatch', function ($e) use ($controller) {
            $controller->layout('layout/student');
        }, 100);
    }
    public function index(Request $request)
    {
        // TODO Auto-generated NewsController::index(Request $request) default action
        $table = new ExamTable();
        $testQuestionTable = new ExamQuestionTable();
        $StudentExamTable = new StudentExamTable();

        $paginator = $table->getStudentRecords($this->getId());

        $paginator->setCurrentPageNumber((int)request()->get('page', 1));
        $paginator->setItemCountPerPage(30);
        return viewModel('student',__CLASS__,__FUNCTION__,array(
            'paginator'=>$paginator,
            'pageTitle'=>__lang('Exams'),
            'studentExam'=>$StudentExamTable,
            'questionTable'=>$testQuestionTable,
            'id'=>$this->getId()
        ));

    }

    public function takeexam(Request $request,$id)
    {
        $courseTest = session('examInfo');
        if ($courseTest){
            $courseTest = unserialize($courseTest);
        }
        $output = [];
        $testTable = new ExamTable();
        $examRow=$testTable->getRecord($id);
        $output['examRow'] = $examRow;
        $questionTable = new ExamQuestionTable();
        $optionTable = new ExamOptionTable();
        $StudentExamTable = new StudentExamTable();
        $StudentExamOptionTable = new StudentExamOptionTable();
        $studentSessionTable = new StudentSessionTable();
        $output['pageTitle'] = __lang('Take Exam').': '.$output['examRow']->name;

        if($StudentExamTable->hasExam($id,$this->getId()) && empty($output['examRow']->allow_multiple)){
            flashMessage(__lang('exam-taken-msg'));
            return redirect()->route('student.exam.index');
        }


        if(!empty($examRow->private) && !isset($courseTest[$id])){

            //get records for the student
            $rowset = $testTable->getStudentExamRecords($this->getId(),$id);
            $total = $rowset->count();


            if(empty($total)){
                flashMessage(__lang('no-exam-permission'));
                return back();
            }

            //now loop rowset as see if the test is opened
            $opened = false;

            foreach($rowset as $row){
                if(($row->opening_date < Carbon::now() || $row->opening_date==0)){
                    $opened=true;
                }

            }

            $closed = false;

            foreach($rowset as $row){
                if($row->closing_date > Carbon::now() || $row->closing_date==0){
                    $closed = true;
                }

            }

            if(!($opened && $closed)){

                flashMessage(__lang('exam-closed'));
               return back();
            }


        }


        $rowset = $questionTable->getPaginatedRecords(false,$id);
        $rowset->buffer();
        $questions = [];
        $correct = 0;
        $totalQuestions = $rowset->count();
        foreach($rowset as $row)
        {
            $questions[$row->id]['question'] = $row;
            $questions[$row->id]['options'] = $optionTable->getOptionRecords($row->id);
        }


        $output['totalQuestions'] = $totalQuestions;
        $output['questions'] = $questions;
        $output['optionTable']= $optionTable;
        if(isset($courseTest->examInfo)){

            if(isset($courseTest[$id])){
                 $output['message'] = __lang('class-exam',['class'=>$courseTest[$id]['name']]);
            }
        }
        return view('student.exam.takeexam',$output);
    }

    public function processexam(Request $request,$id)
    {
        $output = [];
        $testTable = new ExamTable();
        $output['examRow'] = $testTable->getRecord($id);
        $questionTable = new ExamQuestionTable();
        $optionTable = new ExamOptionTable();
        $StudentExamTable = new StudentExamTable();
        $StudentExamOptionTable = new StudentExamOptionTable();


        $rowset = $questionTable->getPaginatedRecords(false,$id);
        $rowset->buffer();
        $questions = [];
        $correct = 0;
        $totalQuestions = $rowset->count();
        foreach($rowset as $row)
        {
            $questions[$row->id]['question'] = $row;
            $questions[$row->id]['options'] = $optionTable->getOptionRecords($row->id);
        }

        if(request()->isMethod('post'))
        {
            $data = request()->all();
            $StudentExamId = $data['student_exam_id'];
            $row = $StudentExamTable->getRecord($StudentExamId);
            $this->validateOwner($row);

            foreach($rowset as  $row)
            {
                if(!empty($data['question_'.$row->id]))
                {
                    $optionId = $data['question_'.$row->id];
                    $StudentExamOptionTable->addRecord([
                        'student_exam_id'=>$StudentExamId,
                        'exam_option_id'=>$optionId
                    ]);
                    //check if option is correct
                    $optionRow = $optionTable->getRecord($optionId);
                    if($optionRow->is_correct==1){
                        $correct++;
                    }

                }
            }

            //calculate score
            $score = ($correct/$totalQuestions)  * 100;
            //update
            $StudentExamTable->update(['score'=>$score],$StudentExamId);
            //return redirect()->route('student.exam.examresults',['id'=>$StudentExamId]);
            return redirect()->route('student.exam.index');

        }
        else{
            return redirect()->route('student.exam.takeexam',['id'=>$id]);
        }



    }

    public function startexam(Request $request,$id)
    {
        $StudentExamTable = new StudentExamTable();
        $StudentExamId = $StudentExamTable->addRecord([
            'student_id'=>$this->getId(),
            'exam_id'=>$id,
            'score'=>0
        ]);

        $output = json_encode(['id'=>$StudentExamId,'status'=>true]);
        exit($output);
    }



    public function result(Request $request,$id)
    {

        $StudentExamTable = new StudentExamTable();
        $testTable = new ExamTable();
        $row = $StudentExamTable->getRecord($id);
        $this->validateOwner($row);
        $examRow = $testTable->getRecord($row->exam_id);

        $courseTest = session('examInfo');
        if(isset($courseTest)){
            $examInfo = unserialize($courseTest);
        }
        else{
            $examInfo= [];
        }
        if(isset($examInfo[$examRow->exam_id])){
            $sessionId = $examInfo[$examRow->id]['course_id'];
            $lessonId = $examInfo[$examRow->id]['lesson_id'];
            if($row->score >= $examRow->passmark){
                //set attendance for class
                $attendanceTable = new AttendanceTable();
                $attendanceTable->setAttendance([
                    'student_id'=>$this->getId(),
                    'course_id'=>$sessionId,
                    'lesson_id'=>$lessonId
                ]);

                flashMessage(__lang('class-exam-complete',['score'=>$row->score]));
                $sessionLessonTable = new SessionLessonTable();
                $nextClass = $sessionLessonTable->getNextLessonInSession($sessionId,$lessonId,'c');
                if($nextClass){
                    //forward to the next class
                    return redirect()->route('student.course.class',['course'=>$sessionId,'lesson'=>$nextClass->lesson_id]);
                }
                else{
                    //classes are over
                    flashMessage(__lang('course-complete-msg'));
                    $studentSessionTable = new StudentSessionTable();
                    $studentSessionTable->markCompleted($this->getId(),$sessionId);
                    return redirect()->route('student.catalog.course',['id'=>$sessionId]);
                }
            }
            else{
                flashMessage(__lang('low-exam-score',['score'=>$row->score]));
                return redirect()->route('student.course.class',['course'=>$sessionId,'lesson'=>$lessonId]);

            }

        }

        return view('student.exam.result',['row'=>$row,'pageTitle'=>__lang('Exam Result').': '.$examRow->name,'examRow'=>$examRow]);
    }


    public function examresults(Request $request,$id){

        $StudentExam = StudentExam::with('exam')->where('exam_id',$id)->first();

        $test = $StudentExam->exam;
        if(empty($test->show_result)){
            flashMessage(__lang('not-allowed-exam-result'));
            return back();
        }

        //get test
        $studentId = $this->getId();
        $student = Student::find($studentId);
        $rowset = $student->StudentExams()->orderBy('created_at','desc')->where('exam_id',$id)->paginate(30);
        //$rowset = $student->StudentExams()->orderBy('created_at','desc')->where('id',$id)->paginate(30);


        return view('student.exam.examresults',['pageTitle'=>__lang('Exam Results').': '.$test->name,
            'rowset'=>$rowset,
            'exam'=>$test,
            'gradeTable'=>new ExamGradeTable()
        ]);

    }

    public function reportcard(Request $request,$id){

        $sessionId = $id;
        $this->data['exams'] = $this->getSessionExamsObjects($sessionId);
        $this->data['allExams'] = $this->getSessionExams($sessionId);
        //get studentlist

        $this->data['controller'] = $this;
        $this->data['examGradeTable'] = new ExamGradeTable();
        $student = $this->getStudent();
        $this->data['student'] = $student;
        $this->data['session'] = Course::find($sessionId);
        $this->data['baseUrl'] = $this->getBaseUrl();



        $html = view('admin.report.examreportcard',$this->data)->toHtml();



        $options = new Options();
        $options->set('isRemoteEnabled', true);
        $dompdf = new Dompdf($options);

        $dompdf->loadHtml($html);
        $orientation = 'portrait';

        $dompdf->setPaper('A4', $orientation);
        // Render the HTML as PDF
        $dompdf->render();

        // Output the generated PDF to Browser
        $dompdf->stream(safeUrl($student->user->name.' '.$student->user->last_name.' report '.$this->data['session']->name).'.pdf');


        exit();

    }

    public function statement(Request $request){
        $id = $this->getId();
        $student = Student::findOrFail($id);
        $this->data['sessions'] = $student->studentCourses()->orderBy('created_at','desc')->paginate();
        $this->data['pageTitle'] = __lang('Statement Of Result');
        return view('student.exam.statement',$this->data);
    }

    private function getSessionExams($sessionId){
        $session = Course::find($sessionId);
        //create list of tests for this session
        $allTests = [];
        foreach($session->exams as $test){
            $allTests[$test->id] = $test->id;
        }

        foreach($session->lessons as $lesson){

            if( $lesson && !empty($lesson->exam_id) && !empty($lesson->test_required) && Exam::find($lesson->exam_id)){
                $allTests[$lesson->exam_id] = $lesson->exam_id;
            }

        }
        return $allTests;
    }

    private function getSessionExamsObjects($sessionId){
        $testIds = $this->getSessionExams($sessionId);
        $objects = [];
        foreach($testIds as $id)
        {
            $test = Exam::find($id);
            if($test){
                $objects[] = $test;
            }
        }
        return $objects;
    }

    public function getStudentExamsStats($studentId){

        $totalTaken = 0;
        $scores = 0;



        foreach($this->data['allExams'] as $testId){
            $StudentExam = StudentExam::where('student_id',$studentId)->orderBy('score','desc')->where('exam_id',$testId)->first();
            if($StudentExam){
                $totalTaken++;
                $scores += $StudentExam->score;
            }
        }



        if(!empty($totalTaken)){
            return [
                'examsTaken'=>$totalTaken,
                'average' => ($scores/$totalTaken)
            ];
        }
        else{
            return [
                'examsTaken'=>$totalTaken,
                'average' => 0
            ];
        }


    }

}
