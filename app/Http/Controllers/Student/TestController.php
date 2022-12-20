<?php
/**
 * Created by PhpStorm.
 * User: USER PC
 * Date: 2/2/2017
 * Time: 2:42 PM
 */

namespace App\Http\Controllers\Student;
use App\Http\Controllers\Controller;
use App\Lib\HelperTrait;
use Dompdf\Options;
use Illuminate\Http\Request;


use App\Lesson;
use App\Course;
use App\Student;
use App\StudentTest;
use App\Test;
use App\V2\Model\AttendanceTable;
use App\V2\Model\SessionLessonTable;
use App\V2\Model\SessionTable;
use App\V2\Model\StudentSessionTable;
use App\V2\Model\StudentTestOptionTable;
use App\V2\Model\StudentTestTable;
use App\V2\Model\TestGradeTable;
use App\V2\Model\TestOptionTable;
use App\V2\Model\TestQuestionTable;
use App\V2\Model\TestTable;
use Dompdf\Dompdf;
use App\Lib\UtilityFunctions;
use Illuminate\Support\Carbon;
use Laminas\EventManager\EventManagerInterface;
use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\Session\Container;
use Laminas\View\Model\JsonModel;
use Laminas\View\Model\ViewModel;
use App\User;

class TestController extends Controller {

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
        $table = new TestTable();
        $testQuestionTable = new TestQuestionTable();
        $studentTestTable = new StudentTestTable();

        $paginator = $table->getStudentRecords($this->getId());

        $paginator->setCurrentPageNumber((int)request()->get('page', 1));
        $paginator->setItemCountPerPage(30);
        return viewModel('student',__CLASS__,__FUNCTION__,array(
            'paginator'=>$paginator,
            'pageTitle'=>__lang('Tests'),
            'studentTest'=>$studentTestTable,
            'questionTable'=>$testQuestionTable,
            'id'=>$this->getId()
        ));

    }

    public function frontindex(Request $request,$id)
    {
        $find = User::find($id);
        if($find){
        // TODO Auto-generated NewsController::index(Request $request) default action
        $table = new TestTable();
        $testQuestionTable = new TestQuestionTable();
        $studentTestTable = new StudentTestTable();

        $paginator = $table->getStudentRecords($id);

        $paginator->setCurrentPageNumber((int)request()->get('page', 1));
        $paginator->setItemCountPerPage(30);
        return viewModel('aptitude',__CLASS__,__FUNCTION__,array(
            'paginator'=>$paginator,
            'pageTitle'=>__lang('Tests'),
            'studentTest'=>$studentTestTable,
            'questionTable'=>$testQuestionTable,
            'id'=>$id
        ));
    }else{
        abort(404);
    }

    }
    public function fronttaketest(Request $request,$id,$myid)
    {
        $courseTest = session('testInfo');
        if ($courseTest){
            $courseTest = unserialize($courseTest);
        }
        $output = [];
        $testTable = new TestTable();
        $testRow=$testTable->getRecord1($id);
        $output['testRow'] = $testRow;
        $questionTable = new TestQuestionTable();
        $optionTable = new TestOptionTable();
        $studentTestTable = new StudentTestTable();
        $studentTestOptionTable = new StudentTestOptionTable();
        $studentSessionTable = new StudentSessionTable();
        $output['myid'] = $myid;
        $output['pageTitle'] = __lang('Take Test').': '.$output['testRow']->name;

        if($studentTestTable->hasTest($id,$myid) && empty($output['testRow']->allow_multiple)){
            flashMessage(__lang('test-taken-msg'));
            return redirect()->route('aptitude.index');
        }


        if(!empty($testRow->private) && !isset($courseTest[$id])){

            //get records for the student
            $rowset = $testTable->getStudentTestRecords($myid,$id);
            $total = $rowset->count();


            if(empty($total)){
                flashMessage(__lang('no-test-permission'));
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

                flashMessage(__lang('test-closed'));
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
        if(isset($courseTest->testInfo)){

            if(isset($courseTest[$id])){
                 $output['message'] = __lang('class-test',['class'=>$courseTest[$id]['name']]);
            }
        }
        return view('aptitude.test.fronttaketest',$output);
    }

    public function taketest(Request $request,$id)
    {
        $courseTest = session('testInfo');
        if ($courseTest){
            $courseTest = unserialize($courseTest);
        }
        $output = [];
        $testTable = new TestTable();
        $testRow=$testTable->getRecord($id);
        $output['testRow'] = $testRow;
        $questionTable = new TestQuestionTable();
        $optionTable = new TestOptionTable();
        $studentTestTable = new StudentTestTable();
        $studentTestOptionTable = new StudentTestOptionTable();
        $studentSessionTable = new StudentSessionTable();
        $output['pageTitle'] = __lang('Take Test').': '.$output['testRow']->name;

        if($studentTestTable->hasTest($id,$this->getId()) && empty($output['testRow']->allow_multiple)){
            flashMessage(__lang('test-taken-msg'));
            return redirect()->route('student.test.index');
        }


        if(!empty($testRow->private) && !isset($courseTest[$id])){

            //get records for the student
            $rowset = $testTable->getStudentTestRecords($this->getId(),$id);
            $total = $rowset->count();


            if(empty($total)){
                flashMessage(__lang('no-test-permission'));
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

                flashMessage(__lang('test-closed'));
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
        if(isset($courseTest->testInfo)){

            if(isset($courseTest[$id])){
                 $output['message'] = __lang('class-test',['class'=>$courseTest[$id]['name']]);
            }
        }
        return view('student.test.taketest',$output);
    }

    public function processtest(Request $request,$id)
    {
        $output = [];
        $testTable = new TestTable();
        $output['testRow'] = $testTable->getRecord($id);
        $questionTable = new TestQuestionTable();
        $optionTable = new TestOptionTable();
        $studentTestTable = new StudentTestTable();
        $studentTestOptionTable = new StudentTestOptionTable();


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
            $studentTestId = $data['student_test_id'];
            $row = $studentTestTable->getRecord($studentTestId);
            $this->validateOwner($row);

            foreach($rowset as  $row)
            {
                if(!empty($data['question_'.$row->id]))
                {
                    $optionId = $data['question_'.$row->id];
                    $studentTestOptionTable->addRecord([
                        'student_test_id'=>$studentTestId,
                        'test_option_id'=>$optionId
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
            $studentTestTable->update(['score'=>$score],$studentTestId);
            //return redirect()->route('student.test.testresults',['id'=>$studentTestId]);
            return redirect()->route('student.test.index');

        }
        else{
            return redirect()->route('student.test.taketest',['id'=>$id]);
        }



    }

    public function frontprocesstest(Request $request,$id,$myid)
    {
        $output = [];
        $testTable = new TestTable();
        $output['testRow'] = $testTable->getRecord1($id);
        $questionTable = new TestQuestionTable();
        $optionTable = new TestOptionTable();
        $studentTestTable = new StudentTestTable();
        $studentTestOptionTable = new StudentTestOptionTable();


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
            $studentTestId = $data['student_test_id'];
            $row = $studentTestTable->getRecord1($studentTestId);
            //$this->validateOwner($row);

            foreach($rowset as  $row)
            {
                if(!empty($data['question_'.$row->id]))
                {
                    $optionId = $data['question_'.$row->id];
                    $studentTestOptionTable->addRecord([
                        'student_test_id'=>$studentTestId,
                        'test_option_id'=>$optionId
                    ]);
                    //check if option is correct
                    $optionRow = $optionTable->getRecord1($optionId);
                    if($optionRow->is_correct==1){
                        $correct++;
                    }

                }
            }

            //calculate score
            $score = ($correct/$totalQuestions)  * 100;
            //update
            $studentTestTable->update(['score'=>$score],$studentTestId);
            //return redirect()->route('student.test.testresults',['id'=>$studentTestId]);
            return redirect()->route('aptitude.index',['id'=>$myid]);

        }
        else{
            return redirect()->route('aptitude.taketest',['id'=>$id,'myid'=>$myid]);
        }



    }

    public function frontstarttest(Request $request,$id,$myid)
    {
        $std = Student::where('user_id',$myid)->first();
        $studentTestTable = new StudentTestTable();
        $studentTestId = $studentTestTable->addRecord([
            'student_id'=>$std->id,
            'test_id'=>$id,
            'score'=>0
        ]);

        $output = json_encode(['id'=>$studentTestId,'status'=>true, 'myid'=>$myid]);
        exit($output);
    }
    
    public function starttest(Request $request,$id)
    {
        $studentTestTable = new StudentTestTable();
        $studentTestId = $studentTestTable->addRecord([
            'student_id'=>$this->getId(),
            'test_id'=>$id,
            'score'=>0
        ]);

        $output = json_encode(['id'=>$studentTestId,'status'=>true]);
        exit($output);
    }



    public function result(Request $request,$id)
    {

        $studentTestTable = new StudentTestTable();
        $testTable = new TestTable();
        $row = $studentTestTable->getRecord($id);
        $this->validateOwner($row);
        $testRow = $testTable->getRecord($row->test_id);

        $courseTest = session('testInfo');
        if(isset($courseTest)){
            $testInfo = unserialize($courseTest);
        }
        else{
            $testInfo= [];
        }
        if(isset($testInfo[$testRow->test_id])){
            $sessionId = $testInfo[$testRow->id]['course_id'];
            $lessonId = $testInfo[$testRow->id]['lesson_id'];
            if($row->score >= $testRow->passmark){
                //set attendance for class
                $attendanceTable = new AttendanceTable();
                $attendanceTable->setAttendance([
                    'student_id'=>$this->getId(),
                    'course_id'=>$sessionId,
                    'lesson_id'=>$lessonId
                ]);

                flashMessage(__lang('class-test-complete',['score'=>$row->score]));
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
                flashMessage(__lang('low-test-score',['score'=>$row->score]));
                return redirect()->route('student.course.class',['course'=>$sessionId,'lesson'=>$lessonId]);

            }

        }

        return view('student.test.result',['row'=>$row,'pageTitle'=>__lang('Test Result').': '.$testRow->name,'testRow'=>$testRow]);
    }


    public function frontresult(Request $request,$id)
    {

        $studentTestTable = new StudentTestTable();
        $testTable = new TestTable();
        $row = $studentTestTable->getRecord1($id);
        $this->validateOwner($row);
        $testRow = $testTable->getRecord1($row->test_id);

        $courseTest = session('testInfo');
        if(isset($courseTest)){
            $testInfo = unserialize($courseTest);
        }
        else{
            $testInfo= [];
        }
        if(isset($testInfo[$testRow->test_id])){
            $sessionId = $testInfo[$testRow->id]['course_id'];
            $lessonId = $testInfo[$testRow->id]['lesson_id'];
            if($row->score >= $testRow->passmark){
                //set attendance for class
                $attendanceTable = new AttendanceTable();
                $attendanceTable->setAttendance([
                    'student_id'=>$this->getId(),
                    'course_id'=>$sessionId,
                    'lesson_id'=>$lessonId
                ]);

                flashMessage(__lang('class-test-complete',['score'=>$row->score]));
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
                flashMessage(__lang('low-test-score',['score'=>$row->score]));
                return redirect()->route('student.course.class',['course'=>$sessionId,'lesson'=>$lessonId]);

            }

        }

        return view('aptitude.test.frontresult',['row'=>$row,'pageTitle'=>__lang('Test Result').': '.$testRow->name,'testRow'=>$testRow]);
    }


    public function testresults(Request $request,$id){

        $studentTest = StudentTest::with('test')->where('test_id',$id)->first();

        $test = $studentTest->test;
        if(empty($test->show_result)){
            flashMessage(__lang('not-allowed-result'));
            return back();
        }
        //get test
        $studentId = $this->getId();
        $student = Student::find($studentId);
        $rowset = $student->studentTests()->orderBy('created_at','desc')->where('test_id',$id)->paginate(30);
        //$rowset = $student->studentTests()->orderBy('created_at','desc')->where('id',$id)->paginate(30);


        return view('student.test.testresults',['pageTitle'=>__lang('Test Results').': '.$test->name,
            'rowset'=>$rowset,
            'test'=>$test,
            'gradeTable'=>new TestGradeTable()
        ]);

    }
    public function fronttestresults(Request $request,$id,$myid){

        $studentTest = StudentTest::with('test')->where('test_id',$id)->first();

        $test = $studentTest->test;
        if(empty($test->show_result)){
            flashMessage(__lang('not-allowed-result'));
            return back();
        }
        //get test
        $studentId = $myid;
        $student = Student::find($studentId);
        $rowset = $student->studentTests()->orderBy('created_at','desc')->where('test_id',$id)->paginate(30);
        //$rowset = $student->studentTests()->orderBy('created_at','desc')->where('id',$id)->paginate(30);


        return view('aptitude.test.fronttestresults',['pageTitle'=>__lang('Test Results').': '.$test->name,
            'rowset'=>$rowset,
            'test'=>$test,
            'gradeTable'=>new TestGradeTable()
        ]);

    }

    public function reportcard(Request $request,$id){

        $sessionId = $id;
        $this->data['tests'] = $this->getSessionTestsObjects($sessionId);
        $this->data['allTests'] = $this->getSessionTests($sessionId);
        //get studentlist

        $this->data['controller'] = $this;
        $this->data['testGradeTable'] = new TestGradeTable();
        $student = $this->getStudent();
        $this->data['student'] = $student;
        $this->data['session'] = Course::find($sessionId);
        $this->data['baseUrl'] = $this->getBaseUrl();



        $html = view('admin.report.reportcard',$this->data)->toHtml();



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
        return view('student.test.statement',$this->data);
    }

    public function frontstatement(Request $request){
        $id = $this->getId();
        $student = Student::findOrFail($id);
        $this->data['sessions'] = $student->studentCourses()->orderBy('created_at','desc')->paginate();
        $this->data['pageTitle'] = __lang('Statement Of Result');
        return view('aptitude.test.frontstatement',$this->data);
    }

    private function getSessionTests($sessionId){
        $session = Course::find($sessionId);
        //create list of tests for this session
        $allTests = [];
        foreach($session->tests as $test){
            $allTests[$test->id] = $test->id;
        }

        foreach($session->lessons as $lesson){

            if( $lesson && !empty($lesson->test_id) && !empty($lesson->test_required) && Test::find($lesson->test_id)){
                $allTests[$lesson->test_id] = $lesson->test_id;
            }

        }
        return $allTests;
    }

    private function getSessionTestsObjects($sessionId){
        $testIds = $this->getSessionTests($sessionId);
        $objects = [];
        foreach($testIds as $id)
        {
            $test = Test::find($id);
            if($test){
                $objects[] = $test;
            }
        }
        return $objects;
    }

    public function getStudentTestsStats($studentId){

        $totalTaken = 0;
        $scores = 0;



        foreach($this->data['allTests'] as $testId){
            $studentTest = StudentTest::where('student_id',$studentId)->orderBy('score','desc')->where('test_id',$testId)->first();
            if($studentTest){
                $totalTaken++;
                $scores += $studentTest->score;
            }
        }



        if(!empty($totalTaken)){
            return [
                'testsTaken'=>$totalTaken,
                'average' => ($scores/$totalTaken)
            ];
        }
        else{
            return [
                'testsTaken'=>$totalTaken,
                'average' => 0
            ];
        }


    }

}
