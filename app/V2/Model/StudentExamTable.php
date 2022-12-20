<?php
/**
 * Created by PhpStorm.
 * User: USER PC
 * Date: 2/1/2017
 * Time: 1:37 PM
 */

namespace App\V2\Model;


use App\Lib\BaseTable;
use Laminas\Db\Sql\Expression;
use Laminas\Db\Sql\Select;
use Laminas\Paginator\Adapter\DbSelect;
use Laminas\Paginator\Paginator;

class StudentExamTable extends BaseTable {

    protected $tableName = 'student_exams';
    //protected $primary = 'student_exam_id';

    public function getAverageScore($id,$startDate=null,$endDate=null){
        $select= new Select($this->tableName);
        $select->where(['exam_id'=>$id])
                ->columns(['total'=>new Expression('avg(score)')]);

        if($startDate){
            $select->where($this->tableName.".created_at >= '{$startDate}'");
        }

        if($endDate){
            $select->where($this->tableName.".created_at <= '{$endDate}'");
        }


        $row = $this->tableGateway->selectWith($select)->current();
        return floor($row->total);
    }

    public function hasExam($id,$studentId){
        $total = $this->tableGateway->select(['exam_id'=>$id,'student_id'=>$studentId])->count();
        if(empty($total))
        {
            return false;
        }
        else{
            return true;
        }
    }

    public function getTotalForExam($id,$startDate=null,$endDate=null)
    {
        $select = new Select($this->tableName);
        $select->where(['exam_id'=>$id]);
        if($startDate){
            $select->where($this->tableName.".created_at >= '{$startDate}'");
        }

        if($endDate){
            $select->where($this->tableName.".created_at <= '{$endDate}'");
        }


        $rowset = $this->tableGateway->selectWith($select);
        $total = $rowset->count();
        return $total;
    }

    public function getTotalPassedForExam($id,$score,$startDate=null,$endDate=null)
    {

       // $total = $this->tableGateway->select(['exam_id'=>$id,'score >= '.$score])->count();
        $select = new Select($this->tableName);
        $select->where(['exam_id'=>$id,'score >= '.$score]);
        if($startDate){
            $select->where($this->tableName.".created_at >= '{$startDate}'");
        }

        if($endDate){
            $select->where($this->tableName.".created_at <= '{$endDate}'");
        }


        $rowset = $this->tableGateway->selectWith($select);

        $total = $rowset->count();
        return $total;

    }
    public function  getTotalFailedForExam($id,$score,$startDate=null,$endDate=null)
    {
          $select = new Select($this->tableName);
        $select->where(['exam_id'=>$id,'score < '.$score]);
        if($startDate){
            $select->where($this->tableName.".created_at >= '{$startDate}'");
        }

        if($endDate){
            $select->where($this->tableName.".created_at <= '{$endDate}'");
        }


        $rowset = $this->tableGateway->selectWith($select);
        $total = $rowset->count();
        return $total;

    }



    public function getTotalPassed($examId,$passmark,$startDate=null,$endDate=null){
       // $total = $this->tableGateway->select(['exam_id'=>$examId,'score >= '.$passmark])->count();

        $select = new Select($this->tableName);
        $select->where(['exam_id'=>$examId,'score >= '.$passmark]);
        if($startDate){

            $select->where($this->tableName.".created_at >= '{$startDate}'");
        }

        if($endDate){
            $select->where($this->tableName.".created_at <= '{$endDate}'");
        }


        $rowset = $this->tableGateway->selectWith($select);
        $total = $rowset->count();

        return $total;
    }

    public function passedExam($studentId,$examId){
        $ExamTable = new ExamTable();
        $testRow = $ExamTable->getRecord($examId);
        $total = $this->tableGateway->select(['exam_id'=>$examId,'score >= '.$testRow->passmark,'student_id'=>$studentId])->count();
        if(empty($total)){
            return false;
        }
        else{
            return true;
        }
    }

    public function getPaginatedRecords($paginated=false,$id=null,$filter=null,$startDate=null,$endDate=null)
    {
        $select = new Select($this->tableName);
        $select->order('score desc')
                ->where([$this->tableName.'.exam_id'=>$id])
            ->join($this->getPrefix().'students',$this->tableName.'.student_id=students.id',['mobile_number'])
            ->join($this->getPrefix().'users',$this->getPrefix().'students.user_id='.$this->getPrefix().'users.id',['first_name'=>'name','last_name','email'])
                ->join($this->getPrefix().'exams',$this->tableName.'.exam_id=exams.id',['passmark']);

        if($startDate){
            $select->where($this->tableName.".created_at >= '{$startDate}'");
        }

        if($endDate){
           $select->where($this->tableName.".created_at <= '{$endDate}'");
        }

        if(isset($filter))
        {
            $filter = addslashes($filter);
            $select->where('('.$this->getPrefix().'users.name LIKE \'%'.$filter.'%\' OR '.$this->getPrefix().'users.last_name LIKE \'%'.$filter.'%\' OR '.$this->getPrefix().'users.email LIKE \'%'.$filter.'%\')');
        }


        if($paginated)
        {
            $paginatorAdapter = new DbSelect($select,$this->tableGateway->getAdapter());
            $paginator = new Paginator($paginatorAdapter);
            return $paginator;
        }

        $resultSet = $this->tableGateway->selectWith($select);
        return $resultSet;
    }


    public function getPassedPaginatedRecords($paginated=false,$id=null,$score,$startDate=null,$endDate=null)
    {
        $select = new Select($this->tableName);
        $select->order('score desc')
            ->where([$this->tableName.'.exam_id'=>$id,'score >= '.$score])
            ->join($this->getPrefix().'students',$this->tableName.'.student_id='.$this->getPrefix().'students.id',['mobile_number'])
            ->join($this->getPrefix().'users',$this->getPrefix().'students.user_id='.$this->getPrefix().'users.id',['first_name'=>'name','last_name','email'])
            ->join($this->getPrefix().'exams',$this->tableName.'.exam_id='.$this->getPrefix().'exams.id',['passmark']);

        if($startDate){
            $select->where($this->tableName.".created_at >= '{$startDate}'");
        }

        if($endDate){
            $select->where($this->tableName.".created_at <= '{$endDate}'");
        }



        if($paginated)
        {
            $paginatorAdapter = new DbSelect($select,$this->tableGateway->getAdapter());
            $paginator = new Paginator($paginatorAdapter);
            return $paginator;
        }

        $resultSet = $this->tableGateway->selectWith($select);
        return $resultSet;
    }


    public function getFailPaginatedRecords($paginated=false,$id=null,$score,$startDate=null,$endDate=null)
    {
        $select = new Select($this->tableName);
        $select->order('score desc')
            ->where([$this->tableName.'.exam_id'=>$id,'score < '.$score])
            ->join($this->getPrefix().'students',$this->tableName.'.student_id=students.id',['mobile_number'])
            ->join($this->getPrefix().'users',$this->getPrefix().'students.user_id='.$this->getPrefix().'users.id',['first_name'=>'name','last_name','email'])
            ->join($this->getPrefix().'exams',$this->tableName.'.exam_id=exams.id',['passmark']);

        if($startDate){
            $select->where($this->tableName.".created_at >= '{$startDate}'");
        }

        if($endDate){
            $select->where($this->tableName.".created_at <= '{$endDate}'");
        }



        if($paginated)
        {
            $paginatorAdapter = new DbSelect($select,$this->tableGateway->getAdapter());
            $paginator = new Paginator($paginatorAdapter);
            return $paginator;
        }

        $resultSet = $this->tableGateway->selectWith($select);
        return $resultSet;
    }


    public function getStudentRecord($studentId,$examId){
        $select = new Select($this->tableName);
        $select->where([$this->tableName.'.student_id'=>$studentId,$this->tableName.'.exam_id'=>$examId])
        ->order('exam_id desc')
        ->join($this->getPrefix().'exams',$this->tableName.'.exam_id=exams.id',['name','passmark'])
            ->join($this->getPrefix().'students',$this->tableName.'.student_id=students.id',['mobile_number'])
            ->join($this->getPrefix().'users',$this->getPrefix().'students.user_id='.$this->getPrefix().'users.id',['first_name'=>'name','last_name','email']);
            return $this->tableGateway->selectWith($select)->current();
    }
}
