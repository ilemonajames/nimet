<?php
/**
 * Created by PhpStorm.
 * User: USER PC
 * Date: 2/1/2017
 * Time: 1:37 PM
 */

namespace App\V2\Model;


use App\Lib\BaseTable;
use Laminas\Db\Sql\Select;

class StudentExamOptionTable extends BaseTable {
    protected $tableName = 'student_exam_exam_option';
    protected $timeStamp = false;
    //protected $primary = 'student_exam_option_id';

    public function getexamRecords($id)
    {
        $select = new Select($this->tableName);
        $select->where(['student_exam_id'=>$id])
                ->join($this->getPrefix().'exam_options',$this->tableName.'.exam_option_id='.$this->getPrefix().'exam_options.id')
                ->join($this->getPrefix().'exam_questions',$this->getPrefix().'exam_options.exam_question_id='.$this->getPrefix().'exam_questions.id');
        $rowset = $this->tableGateway->selectWith($select);
        return $rowset;
    }

}
