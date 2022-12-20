<?php


namespace App\V2\Model;


use Application\Entity\Exam;
use App\Lib\BaseTable;
use Illuminate\Support\Carbon;
use Laminas\Db\Sql\Select;
use Laminas\Paginator\Adapter\DbSelect;
use Laminas\Paginator\Paginator;

class ExamTable extends BaseTable{

    protected $tableName = 'exams';
    //protected $primary = 'exam_id';
    protected $accountId = true;


    public function getPaginatedRecords($paginated=false,$id=null,$filter=null)
    {
        $select = new Select($this->tableName);
        $select->order($this->primary.' desc');

        if($this->accountId && !GLOBAL_ACCESS){
            $select->where(['admin_id'=>ADMIN_ID]);
        }

        if(isset($filter))
        {
            $filter = addslashes($filter);
            $select->where('('.$this->getPrefix().'exams.name LIKE \'%'.$filter.'%\')');
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


    public function getActivePaginatedRecords($paginated=false)
    {
        $select = new Select($this->tableName);
        $select->order($this->primary.' desc')
                ->where(['enabled'=>1]);

        if(!GLOBAL_ACCESS){
            $select->where([$this->tableName.'.admin_id'=>ADMIN_ID]);
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

    public function getLimitedRecords($limit){
        $select = new Select($this->tableName);
        $select->order($this->primary.' desc')
            ->limit($limit);
        if(!GLOBAL_ACCESS){
            $select->where([$this->tableName.'.admin_id'=>ADMIN_ID]);
        }
        return $this->tableGateway->selectWith($select);
    }

    public function getStudentExamRecords($studentId,$examId){
        $today = time();
        $select1 = new Select('student_courses');
        $select1->join($this->getPrefix().'course_exam','student_courses.course_id=course_exam.course_id',array('opening_date','closing_date'))
            ->join($this->getPrefix().'exams','course_exam.exam_id='.$this->getPrefix().'exams.id',['exam_id'=>'id','name','enabled','minutes','allow_multiple','passmark','private'])
            ->where(['student_courses.student_id'=>$studentId])
            ->where([$this->getPrefix().'exams.enabled'=>'1'])
            ->where([$this->getPrefix().'exams.id'=>$examId])
            ->columns(['course_id'])
            ->order($this->getPrefix().'exams.created_at desc');

        $rowset = $this->tableGateway->selectWith($select1);
        $rowset->buffer();
        return $rowset;
    }

    public function getStudentRecords($studentId){

        $today = "'".Carbon::now()->toDateTimeString()."'";
        $select1 = new Select('student_courses');
        $select1->join($this->getPrefix().'course_exam',$this->getPrefix().'student_courses.course_id='.$this->getPrefix().'course_exam.course_id',array())
                ->join($this->getPrefix().'exams',$this->getPrefix().'course_exam.exam_id='.$this->getPrefix().'exams.id',['exam_id'=>'id','name','enabled','minutes','allow_multiple','passmark','private','show_result'])
                ->where([$this->getPrefix().'student_courses.student_id'=>$studentId])
                ->where([$this->getPrefix().'exams.enabled'=>'1'])
                //->where($this->getPrefix()."course_exam.opening_date < $today OR ".$this->getPrefix()."course_exam.opening_date=0")
                //->where($this->getPrefix()."course_exam.closing_date > $today OR ".$this->getPrefix()."course_exam.closing_date=0")
                ->columns([])
                ->group($this->getPrefix().'course_exam.exam_id')
            ->order($this->getPrefix().'exams.created_at desc');

        $select2 = new Select($this->tableName);
        $select2->where(['private'=>0])
               ->where([$this->getPrefix().'exams.enabled'=>'1'])
                ->columns(['exam_id'=>'id','name','enabled','minutes','allow_multiple','passmark','private','show_result']);

        $select1->combine($select2);

       // $sql = $select1->getSqlString($this->tableGateway->getAdapter()->getPlatform());
       // exit($sql);
        $paginatorAdapter = new DbSelect($select1,$this->tableGateway->getAdapter());
        $paginator = new Paginator($paginatorAdapter);
        return $paginator;



    }

    public function getStudentTotalRecords($studentId){

        $today = "'".Carbon::now()->toDateTimeString()."'";
        $select1 = new Select('student_courses');
        $select1->join($this->getPrefix().'course_exam',$this->getPrefix().'student_courses.course_id='.$this->getPrefix().'course_exam.course_id',array())
            ->join($this->getPrefix().'exams',$this->getPrefix().'course_exam.exam_id='.$this->getPrefix().'exams.id',['exam_id'=>'id','name','enabled','minutes','allow_multiple','passmark','private','show_result'])
            ->where([$this->getPrefix().'student_courses.student_id'=>$studentId])
            ->where([$this->getPrefix().'exams.enabled'=>'1'])
            ->where($this->getPrefix()."course_exam.opening_date < $today OR ".$this->getPrefix()."course_exam.opening_date=0")
            ->where($this->getPrefix()."course_exam.closing_date > $today OR ".$this->getPrefix()."course_exam.closing_date=0")
            ->columns([])
            ->group($this->getPrefix().'course_exam.exam_id')
            ->order($this->getPrefix().'exams.created_at desc');

        $select2 = new Select($this->tableName);
        $select2->where(['private'=>0])
            ->where([$this->getPrefix().'exams.enabled'=>'1'])
            ->columns(['exam_id'=>'id','name','enabled','minutes','allow_multiple','passmark','private','show_result']);

        $select1->combine($select2);

        //  $sql = $select1->getSqlString();
        //   exit($sql);

        $rowset = $this->tableGateway->selectWith($select1);
        return $rowset->count();



    }


    public function getLastSortOrder($examId){
        $row = Exam::where('id',$examId)->orderBy('sort_order','desc')->first();
        return $row->sort_order;
    }
}
