<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Lib\BaseForm;
use App\Lib\HelperTrait;
use App\Exam;
use App\ExamOption;
use App\ExamQuestion;
use App\V2\Form\ExamFilter;
use App\V2\Form\ExamForm;
use App\V2\Form\ExamQuestionFilter;
use App\V2\Form\ExamQuestionForm;
use App\V2\Model\SessionInstructorTable;
use App\V2\Model\SessionTable;
use App\V2\Model\SessionExamTable;
use App\V2\Model\StudentExamOptionTable;
use App\V2\Model\StudentExamTable;
use App\V2\Model\ExamOptionTable;
use App\V2\Model\ExamQuestionTable;
use App\V2\Model\ExamTable;
use Illuminate\Http\Request;
use Laminas\Form\Element\Select;
use Laminas\Form\Element\Text;
use Laminas\InputFilter\InputFilter;

class ExamController extends Controller
{
    use HelperTrait;

    public function index(Request $request){

        $table = new ExamTable();
        $questionTable = new ExamQuestionTable();
        $studentExamTable = new StudentExamTable();
        $filter = request()->get('filter');



        if (empty($filter)) {
            $filter=null;
        }
        $paginator = $table->getPaginatedRecords(true,null,$filter);

        $paginator->setCurrentPageNumber((int)request()->get('page', 1));
        $paginator->setItemCountPerPage(30);
        return viewModel('admin',__CLASS__,__FUNCTION__,array(
            'paginator'=>$paginator,
            'pageTitle'=>__lang('Exams'),
            'questionTable'=>$questionTable,
            'studentExamTable'=>$studentExamTable
        ));
    }


    public function add(Request $request)
    {
        $output = array();
        $table = new ExamTable();
        $form = new ExamForm(null,$this->getServiceLocator());
        $filter = new ExamFilter();

        if (request()->isMethod('post')) {

            $form->setInputFilter($filter);
            $data = request()->all();

            $form->setData($data);
            if ($form->isValid()) {

                $array = removeNull($form->getData());

                $array[$table->getPrimary()]=0;
                $id= $table->saveRecord($array);
                //    flashMessage(__lang('Changes Saved!'));
                $output['flash_message'] = __lang('Record Added!');
                session()->flash('flash_message',__lang('exam-added'));
                return adminRedirect(['controller'=>'exam','action'=>'questions','id'=>$id]);
            }
            else{
                $output['flash_message'] = __lang('save-failed-msg');

            }

        }

        $output['form'] = $form;
        $output['pageTitle']= __lang('Add Exam');
        $output['action']='add';
        $output['id']=null;
        return viewModel('admin',__CLASS__,__FUNCTION__,$output);
    }

    public function edit(Request $request,$id){
        $output = array();
        $table = new ExamTable();
        $form = new ExamForm(null,$this->getServiceLocator());
        $filter = new ExamFilter();

        $row = $table->getRecord($id);
        if (request()->isMethod('post')) {

            $form->setInputFilter($filter);
            $data = request()->all();
            $form->setData($data);
            if ($form->isValid()) {



                $array = removeNull($form->getData());
                $array[$table->getPrimary()]=$id;
                $table->saveRecord($array);
                //    flashMessage(__lang('Changes Saved!'));
                $output['flash_message'] = __lang('Changes Saved!');
                flashMessage(__lang('Changes Saved!'));
                $row = $table->getRecord($id);
                return redirect()->route('admin.exam.index');
            }
            else{
                $output['flash_message'] = __lang('save-failed-msg');
            }

        }
        else {

            $data = getObjectProperties($row);

            $form->setData($data);

        }


        $output['form'] = $form;
        $output['id'] = $id;
        $output['pageTitle']= __lang('Edit Exam');
        $output['row']= $row;
        $output['action']='edit';

        $viewModel = viewModel('admin',__CLASS__,'add',$output);
        return $viewModel ;

    }

    public function delete(Request $request,$id)
    {
        $table = new ExamTable();
        try{
            $table->deleteRecord($id);
            flashMessage(__lang('Record deleted'));
        }
        catch(\Exception $ex){
            $this->deleteError();
        }

        return adminRedirect(array('controller'=>'exam','action'=>'index'));
    }


    public function questions(Request $request,$id){
        $ExamTable = new ExamTable();

        $table = new ExamQuestionTable();
        $optionTable = new ExamOptionTable();
        $row = $ExamTable->getRecord($id);
        $paginator = $table->getPaginatedRecords(true,$id);

        $paginator->setCurrentPageNumber((int)request()->get('page', 1));
        $paginator->setItemCountPerPage(30);
        return viewModel('admin',__CLASS__,__FUNCTION__,array(
            'paginator'=>$paginator,
            'pageTitle'=>__lang('Exam Questions').': '.$row->name,
            'id'=>$id,
            'optionTable'=>$optionTable,
            'page'=>(int)request()->get('page', 1)
        ));
    }


    public function addquestion(Request $request,$id)
    {
        $ExamQuestionTable = new ExamQuestionTable();
        $ExamOptionTable = new ExamOptionTable();
        if(request()->isMethod('post'))
        {
            $data = request()->all();
            if(!empty($data['question'])){

                $dbData= [
                    'exam_id'=>$id,
                    'question'=>$data['question'],
                    'sort_order'=>$data['sort_order']
                ];

                $questionId = $ExamQuestionTable->addRecord($dbData);
                session()->flash('flash_message',__lang('Question added'));
                //correct answer
                $correct = $data['correct_option'];
                for($i=1;$i<=5;$i++){

                    if(!empty($data['option_'.$i])){

                        $optionData = [
                            'Exam_question_id'=>$questionId,
                            'option'=> trim($data['option_'.$i])
                        ];

                        if($i==$correct){
                            $optionData['is_correct'] = 1;
                        }
                        else{
                            $optionData['is_correct'] = 0;
                        }

                        $ExamOptionTable->addRecord($optionData);
                    }


                }


            }
        }

        return back();
        // return adminRedirect(['controller'=>'exam','action'=>'questions','id'=>$id]);
    }

    public function editquestion(Request $request,$id){

        $output = [];
        $questionTable = new ExamQuestionTable();
        $optionTable = new ExamOptionTable();
        $form = new ExamQuestionForm();
        $filter = new ExamQuestionFilter();
        $form->setInputFilter($filter);
        $row = $questionTable->getRecord($id);
        $rowset = $optionTable->getOptionRecords($id);



        if(request()->isMethod('post'))
        {
            $formData = request()->all();
            $form->setData($formData);
            if($form->isValid()){
                $data = $form->getData();
                $questionTable->update($data,$id);
                session()->flash('flash_message',__lang('Changes Saved!'));
                return adminRedirect(['controller'=>'exam','action'=>'questions','id'=>$row->exam_id]);
            }
            else{
                $output['flash_message'] = __lang('save-failed-msg');
            }
        }
        else{
            $form->setData(getObjectProperties($row));
        }


        $output['row'] = $row;
        $output['rowset']= $rowset;
        $output['form'] = $form;
        $output['id'] = $id;
        $output['pageTitle'] = __lang('Edit Question/Options');
        $output['customCrumbs'] = [
            route('admin.dashboard')=>__('default.dashboard'),
            adminUrl(['controller'=>'exam','action'=>'index'])=>__lang('Exams'),
            adminUrl(['controller'=>'exam','action'=>'questions','id'=>$row->exam_id])=>__lang('Exam Questions'),
            '#'=>__lang('Edit Question')
        ];
        return view('admin.exam.editquestion',$output);
    }

    public function addoptions(Request $request)
    {
        $id= request()->get('id');
        $ExamOptionTable = new ExamOptionTable();
        if(request()->isMethod('post'))
        {
            $data = request()->all();


            //correct answer
            $correct = $data['correct_option'];
            if(!empty($correct)){
                $ExamOptionTable->clearIsCorrect($id);
            }
            $count = 0;
            for($i=1;$i<=5;$i++){

                if(!empty($data['option_'.$i])){

                    $optionData = [
                        'Exam_question_id'=>$id,
                        'option'=> trim($data['option_'.$i])
                    ];

                    if($i==$correct){
                        $optionData['is_correct'] = 1;
                    }
                    else{
                        $optionData['is_correct'] = 0;
                    }

                    $ExamOptionTable->addRecord($optionData);
                    $count++;

                }


            }
            session()->flash('flash_message',$count.' '.__lang('options added'));


        }

        return adminRedirect(['controller'=>'exam','action'=>'editquestion','id'=>$id]);

    }

    public function editoption(Request $request,$id){

        $ExamOptionTable = new ExamOptionTable();
        $row = $ExamOptionTable->getRecord($id);
        $questionId = $row->Exam_question_id;

        if(request()->isMethod('post'))
        {
            $data = request()->all();
            if(!empty($data['option'])) {

                $dbData = [];
                if (!empty($data['is_correct']))
                {
                    $ExamOptionTable->clearIsCorrect($questionId);
                    $dbData['is_correct']=$data['is_correct'];
                }
                $dbData['option']=$data['option'];
                $ExamOptionTable->update($dbData,$id);
                session()->flash('flash_message',__lang('Option saved'));
            }
            else{
                session()->flash('flash_message',__lang('survey-save-failed'));
            }
            return adminRedirect(['controller'=>'exam','action'=>'editquestion','id'=>$questionId]);
        }

        $option = new Text('option');
        $option->setAttributes(['class'=>'form-control']);
        $option->setValue($row->option);

        $select = new Select('is_correct');
        $select->setAttribute('class','form-control');
        $select->setValueOptions([1=>'Yes',0=>'No']);
        $select->setValue($row->is_correct);

        $viewModel = viewModel('admin',__CLASS__,__FUNCTION__,['row'=>$row,'option'=>$option,'select'=>$select,'id'=>$id]);

        return $viewModel;
    }

    public function deletequestion(Request $request,$id)
    {
        $table = new ExamQuestionTable();
        $row = $table->getRecord($id);
        $ExamId = $row->exam_id;
        try{
            $table->deleteRecord($id);
            flashMessage(__lang('Record deleted'));
        }
        catch(\Exception $ex){
            $this->deleteError();
        }

        return adminRedirect(array('controller'=>'exam','action'=>'questions','id'=>$ExamId));
    }

    public function deleteoption(Request $request)
    {
        $table = new ExamOptionTable();
        $id = request()->get('id');
        $row = $table->getRecord($id);
        $questionId = $row->Exam_question_id;
        try{
            $table->deleteRecord($id);
            flashMessage(__lang('Record deleted'));
        }
        catch(\Exception $ex){
            $this->deleteError();
        }

        return adminRedirect(array('controller'=>'exam','action'=>'editquestion','id'=>$questionId));
    }

    public function duplicate(Request $request,$id)
    {
        $ExamTable = new ExamTable();
        $ExamQuestionTable = new ExamQuestionTable();
        $ExamOptionTable = new ExamOptionTable();

        //get all questions
        $Exam = $ExamTable->getRecord($id);
        $questions = $ExamQuestionTable->getPaginatedRecords(false,$Exam->id)->toArray();
        $options = [];
        foreach($questions as $question){
            $options[$question['id']] = $ExamOptionTable->getOptionRecords($question['id'])->toArray();
        }


        $ExamData = getObjectProperties($Exam);
        unset($ExamData['id']);

        $newId = $ExamTable->addRecord($ExamData);

        foreach($questions as $question)
        {
            $oldQuestionId=$question['id'];
            $question['exam_id']= $newId;
            unset($question['id']);
            $questionId=  $ExamQuestionTable->addRecord($question);
            foreach($options[$oldQuestionId] as $option){
                $option['Exam_question_id'] = $questionId;
                unset($option['id']);
                $ExamOptionTable->addRecord($option);
            }

        }

        session()->flash('flash_message',__lang('Exam duplicated'));
        return adminRedirect(['controller'=>'exam','action'=>'index']);



    }


    public function results(Request $request,$id)
    {
        $ExamTable = new ExamTable();
        $table = new StudentExamTable();

        $filter = request()->get('filter');
        $startDate = request()->get('start', null) ? getDateString(request()->get('start', null)):null;
        $endDate = request()->get('end', null) ? getDateString(request()->get('end', null)):null ;

        if (empty($filter)) {
            $filter=null;
        }


        $row= $ExamTable->getRecord($id);
        $paginator = $table->getPaginatedRecords(true,$id,$filter,$startDate,$endDate);

        $ExamTotal = $table->getTotalForExam($id,$startDate,$endDate);
        $totalPassed = $table->getTotalPassed($id,$row->passmark,$startDate,$endDate);
        $totalFailed= $ExamTotal - $totalPassed;
        $average = $table->getAverageScore($id,$startDate,$endDate);

        $paginator->setCurrentPageNumber((int)request()->get('page', 1));
        $paginator->setItemCountPerPage(30);

        return viewModel('admin',__CLASS__,__FUNCTION__,array(
            'paginator'=>$paginator,
            'pageTitle'=>__lang('Exam results').': '.$row->name,
            'row'=>$row,
            'passed'=>$totalPassed,
            'failed'=>$totalFailed,
            'average'=>$average,
            'start'=>request()->get('start', null),
            'end'=>request()->get('end', null)
        ));
    }

    public function deleteresult(Request $request,$id)
    {
        $studentExamTable = new StudentExamTable();

        $row = $studentExamTable->getRecord($id);
        $ExamId = $row->exam_id;
        try{
            $studentExamTable->deleteRecord($id);
            flashMessage(__lang('Record deleted'));
        }
        catch(\Exception $ex){
            $this->deleteError();
        }

        return adminRedirect(array('controller'=>'exam','action'=>'results','id'=>$ExamId));
    }

    public function examresult(Request $request,$id)
    {
        $studentExamTable = new StudentExamTable();
        $studentOptionTable = new StudentExamOptionTable();
        $row = $studentExamTable->getRecord($id);
        $rowset = $studentOptionTable->getExamRecords($id);
        $data = ['row'=>$row,'rowset'=>$rowset];
        $viewModel = viewModel('admin',__CLASS__,__FUNCTION__,$data);

        return $viewModel;

    }

    public function exportresult(Request $request,$id){

        $type = $_GET['type'];
        $studentExamTable = new StudentExamTable();
        $ExamTable = new ExamTable();
        $file = "export.txt";
        if (file_exists($file)) {
            unlink($file);
        }

        $startDate = request()->get('start', null) ? getDateString(request()->get('start', null)):null;
        $endDate = request()->get('end', null) ? getDateString(request()->get('end', null)):null ;


        $myfile = fopen($file, "w") or die("Unable to open file!");

        $ExamRow = $ExamTable->getRecord($id);

        if($type=='pass')
        {
            $totalRecords = $studentExamTable->getTotalPassedForExam($id,$ExamRow->passmark,$startDate,$endDate);

        }
        else{
            $totalRecords = $studentExamTable->getTotalFailedForExam($id,$ExamRow->passmark,$startDate,$endDate);
        }



        $rowsPerPage = 3000;
        $totalPages = ceil($totalRecords/$rowsPerPage);
        fputcsv($myfile, array(__lang('First Name'),__lang('Last Name'),__lang('Score').'%'));
        for($i=1;$i<=$totalPages;$i++){
            if($type=='pass') {
                $paginator = $studentExamTable->getPassedPaginatedRecords(true, $id,$ExamRow->passmark,$startDate,$endDate);
            }
            else{
                $paginator = $studentExamTable->getFailPaginatedRecords(true, $id,$ExamRow->passmark,$startDate,$endDate);
            }

            $paginator->setCurrentPageNumber($i);
            $paginator->setItemCountPerPage($rowsPerPage);

            foreach ($paginator as $row){

                fputcsv($myfile, array($row->first_name,$row->last_name,$row->score));

            }



        }
        $paginator = array();
        fclose($myfile);
        header('Content-type: text/csv');
        // It will be called downloaded.pdf
        header('Content-Disposition: attachment; filename="'.$type.'_student_Exam_export_'.date('d/M/Y').'.csv"');

        // The PDF source is in original.pdf
        readfile($file);
        unlink($file);
        exit();
    }


    public function sessions(Request $request,$id){

        $sessionExamTable = new SessionExamTable();
        $ExamTable = new  ExamTable();
        $ExamRow = $ExamTable->getRecord($id);

        $rowset = $sessionExamTable->getExamRecords($id);
        return view('admin.exam.sessions',[
            'pageTitle'=>__lang('exam-sessions-courses').': '.$ExamRow->name,
            'rowset'=>$rowset,
            'id'=>$id
        ]);

    }

    public function addsession(Request $request,$id){

        $sessionExamTable = new SessionExamTable();
        $ExamTable = new ExamTable();
        $ExamRow = $ExamTable->getRecord($id);
        $form = $this->getSessionExamForm();
        $output = [];
        if(request()->isMethod('post')){
            $formData = request()->all();
            $form->setData($formData);
            if($form->isValid()){

                $data = $form->getData();
                $data['exam_id'] = $id;
                $data['opening_date']= getDateString($data['opening_date']);
                $data['closing_date']= getDateString($data['closing_date']);
                $sessionExamTable->addRecord($data);
                session()->flash('flash_message',__lang('course-added-succ'));
                return adminRedirect(['controller'=>'exam','action'=>'sessions','id'=>$id]);


            }
            else{
                $output['flash_message']= $this->getFormErrors($form);
            }
        }

        $output['form'] = $form;
        $output['pageTitle'] = __lang('add-course-to').' '.$ExamRow->name;
        $output['id']=$id;
        $output['customCrumbs'] = [

            route('admin.dashboard')=>__('default.dashboard'),
            adminUrl(['controller'=>'exam','action'=>'index'])=>__lang('Exams'),
            adminUrl(['controller'=>'exam','action'=>'sessions','id'=>$id])=>__lang('Sessions/Courses'),
            '#'=>__lang('add').' '.__lang('sessions-courses')
        ];
        return view('admin.exam.addsession',$output);
    }

    public function editsession(Request $request,$id){

        $sessionExamTable = new SessionExamTable();
        $row = $sessionExamTable->getRecord($id);
        $ExamTable = new ExamTable();
        $ExamRow = $ExamTable->getRecord($row->exam_id);
        $form = $this->getSessionExamForm();
        $output = [];
        if(request()->isMethod('post')){
            $formData = request()->all();
            $form->setData($formData);
            if($form->isValid()){

                $data = $form->getData();

                $data['opening_date']= getDateString($data['opening_date']);
                $data['closing_date']=getDateString($data['closing_date']);
                $sessionExamTable->update($data,$id);
                session()->flash('flash_message',__lang('course-saved'));
                return adminRedirect(['controller'=>'exam','action'=>'sessions','id'=>$ExamRow->id]);


            }
            else{
                $output['flash_message']= $this->getFormErrors($form);
            }
        }
        else{
            $data = getObjectProperties($row);
            if(!empty($data['opening_date']))
                $data['opening_date'] = showDate('Y-m-d',$row->opening_date);

            if(!empty($data['closing_date']))
                $data['closing_date'] = showDate('Y-m-d',$row->closing_date);

            $form->setData($data);

        }

        $output['form'] = $form;
        $output['id'] = $id;
        $output['pageTitle'] = __lang('edit-course-for').' '.$ExamRow->name;
        $output['customCrumbs'] = [

            route('admin.dashboard')=>__('default.dashboard'),
            adminUrl(['controller'=>'exam','action'=>'index'])=>__lang('Exams'),
            adminUrl(['controller'=>'exam','action'=>'sessions','id'=>$id])=>__lang('Sessions/Courses'),
            '#'=>__lang('edit').' '.__lang('sessions-courses')
        ];
        $viewModel = viewModel('admin',__CLASS__,'editsession',$output);

        return $viewModel;
    }

    public function deletesession(Request $request,$id){

        $ExamTable = new ExamTable();
        $sessionExamTable= new SessionExamTable();
        $row = $sessionExamTable->getRecord($id);
        $ExamRow = $ExamTable->getRecord($row->exam_id);
        if($ExamRow->admin_id==$this->getAdminId() || GLOBAL_ACCESS){
            $sessionExamTable->deleteRecord($id);
            session()->flash('flash_message',__lang('Record deleted'));
        }
        else{
            session()->flash('flash_message',__lang('no-permission'));
        }

       return back();

    }

    private function getSessionExamForm(){
        $form = new BaseForm();

        //get all sessions for user
        $sessionTable = new SessionTable();
        $sessions = $sessionTable->getPaginatedRecords(true);
        $sessions->setCurrentPageNumber(1);
        $sessions->setItemCountPerPage(500);
        $options=array();
        foreach ($sessions as $row)
        {
            $options[$row->id]=$row->name;
        }

        $sessionInstructorTable = new SessionInstructorTable();
        $rowset = $sessionInstructorTable->getAccountRecords(ADMIN_ID);
        foreach($rowset as $row){
            $options[$row->course_id] = $row->name;
        }

        $form->createSelect('course_id', 'Session/Course', $options);
        $form->get('course_id')->setAttribute('class','form-control select2');


        $form->createText('opening_date','Opening Date (Optional)',false,'form-control date',null,'Opening Date');
        $form->createText('closing_date','Closing Date (Optional)',false,'form-control date',null,'Closing Date');

        $form->setInputFilter($this->getSessionExamFilter());
        return $form;


    }

    private function getSessionExamFilter(){
        $filter = new InputFilter();
        $filter->add([
            'name'=>'course_id',
            'required'=>true,
            'validators'=>[
                [
                    'name'=>'NotEmpty'
                ]
            ]
        ]);

        $filter->add([
            'name'=>'opening_date',
            'required'=>false
        ]);

        $filter->add([
            'name'=>'closing_date',
            'required'=>false
        ]);

        return $filter;

    }


    public function importquestions(Request $request,$id){


        $ExamQuestionTable = new ExamQuestionTable();

        $lastSortOrder = $ExamQuestionTable->getLastSortOrder($id);

        if(request()->isMethod('post')){

            $data = $_FILES['file'];
            $file = $data['tmp_name'];
            $file = fopen($file,"r");

            $all_rows = array();
            $header = null;
            while ($row = fgetcsv($file)) {
                if ($header === null) {
                    $header = $row;
                    continue;
                }
                $all_rows[] = array_combine($header, $row);
            }
            $imported=0;
            foreach($all_rows as $value){


                $question = $value['Question'];

                if(empty($question)){
                    continue;
                }
                $options = $value['Options'];
                $correctOption = intval($value['Correct_Option_Number']);


                //create new question
                $ExamQuestion = new ExamQuestion();
                $ExamQuestion->question = trim($question);
                if(!empty($lastSortOrder)){
                    $lastSortOrder++;
                    $ExamQuestion->sort_order = $lastSortOrder;
                }
                else{
                    $ExamQuestion->sort_order = 0 ;
                }

                $ExamQuestion->exam_id = $id;
                $ExamQuestion->save();
                $imported++;
                //get options
                $optionEntries= explode(',',$options);
                $count =0;
                foreach ($optionEntries as $optionValue){

                    if(!empty($optionValue)){
                        $count++;
                        $ExamOption=new ExamOption();
                        $ExamOption->Exam_question_id= $ExamQuestion->id;
                        $ExamOption->option = trim($optionValue);
                        if($count == $correctOption){
                            $ExamOption->is_correct = 1;
                        }
                        $ExamOption->save();
                    }

                }


            }

            session()->flash('flash_message',__lang('questions-imported',['count'=>$imported]));
            return back();

        }



    }

    public function exportquestions(Request $request,$id){

        $Exam =  Exam::find($id);

        $file = "export.txt";
        if (file_exists($file)) {
            unlink($file);
        }

        $myfile = fopen($file, "w") or die(__lang('unable-to-open'));

        $columns = array(__lang('Question'),__lang('Options'),__lang('correct-option-number'));
        fputcsv($myfile,$columns);

        foreach ($Exam->ExamQuestions()->orderBy('sort_order')->get() as $ExamQuestion){

            $data = [];
            $data[0] = strip_tags($ExamQuestion->question);

            $optionCount = 0;
            $correct = 0;
            $optionArray = [];
            foreach ($ExamQuestion->ExamOptions as $ExamOption){
                $optionCount++;
                $optionArray[] = $ExamOption->option;
                if($ExamOption->is_correct==1){
                    $correct = $optionCount;
                }
            }
            $data[1] = implode(',',$optionArray);
            $data[2] = $correct;
            fputcsv($myfile,$data);
        }

        fclose($myfile);
        header('Content-type: text/csv');
        // It will be called downloaded.pdf
        header('Content-Disposition: attachment; filename="'.safeUrl($Exam->name).'_questions_'.date('d/M/Y').'.csv"');

        // The PDF source is in original.pdf
        readfile($file);
        unlink($file);
        exit();

    }
}
