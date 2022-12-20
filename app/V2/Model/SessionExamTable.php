<?php


namespace App\V2\Model;


use App\Lib\BaseTable;
use Illuminate\Support\Carbon;
use Laminas\Db\Sql\Select;

class SessionExamTable extends BaseTable {

    protected $tableName = 'course_exam';
    protected $timeStamp = false;
    //protected $primary = 'course_exam_id';

    public function getSessionRecords($id){

        $select = new Select($this->tableName);
        $select->where([$this->tableName.'.course_id'=>$id])
            ->join($this->getPrefix().'tests',$this->getPrefix().'course_exam.exam_id='.$this->getPrefix().'exams.id',['name','admin_id','test_status'=>'enabled','minutes','passmark','allow_multiple'])
            ->join($this->getPrefix().'courses',$this->getPrefix().'course_exam.course_id='.$this->getPrefix().'courses.id',['course_name'=>'name'])
            ->order($this->tableName.'.opening_date');

        $rowset = $this->tableGateway->selectWith($select);
        $rowset->buffer();
        return $rowset;

    }

    public function getExamRecords($id){
        $select = new Select($this->tableName);
        $select->where([$this->tableName.'.exam_id'=>$id])
            ->join($this->getPrefix().'exams','course_exam.exam_id=exams.id',['name'])
            ->join($this->getPrefix().'courses','course_exam.course_id='.$this->getPrefix().'courses.id',['course_name'=>'name'])
            ->order($this->tableName.'.opening_date');

        $rowset = $this->tableGateway->selectWith($select);
        $rowset->buffer();
        return $rowset;
    }


    public function getUpcomingExams($days){
        $upperLimit = strtotime('tomorrow midnight') - 1;

        $timestamp = strtotime("+$days day");

        $timeLimit = mktime(23,59,0,date('n',$timestamp),date('j',$timestamp),date('Y',$timestamp));

        $upperLimit = Carbon::createFromTimestamp($upperLimit)->toDateTimeString();
        $timeLimit = Carbon::createFromTimestamp($timeLimit)->toDateTimeString();

        $upperLimit = "'{$upperLimit}'";
        $timeLimit = "'{$timeLimit}'";

        $select = new Select($this->tableName);
        $select->where(['opening_date < '.$timeLimit,'opening_date > '.$upperLimit])
            ->where(['opening_date > 0'])
            ->join($this->getPrefix().'exams',$this->getPrefix().'course_exam.exam_id='.$this->getPrefix().'exams.id',['name','description','passmark','minutes'])
            ->join($this->getPrefix().'courses',$this->tableName.'.course_id='.$this->getPrefix().'courses.id',['course_name'=>'name'])
            ->order('opening_date');
        $rowset = $this->tableGateway->selectWith($select);
        $rowset->buffer();
        return $rowset;

    }

}
