<?php
/**
 * Created by PhpStorm.
 * User: USER PC
 * Date: 2/1/2017
 * Time: 1:35 PM
 */

namespace App\V2\Model;


use App\Lib\BaseTable;
use App\ExamQuestion;
use Laminas\Db\Sql\Select;
use Laminas\Paginator\Adapter\DbSelect;
use Laminas\Paginator\Paginator;

class ExamQuestionTable extends BaseTable {
    protected $tableName ='exam_questions';
    //protected $primary ='test_question_id';

    public function getPaginatedRecords($paginated=false,$id=null)
    {
        $select = new Select($this->tableName);
        $select->order('sort_order')
                ->where(['exam_id'=>$id]);


        if($paginated)
        {
            $paginatorAdapter = new DbSelect($select,$this->tableGateway->getAdapter());
            $paginator = new Paginator($paginatorAdapter);
            return $paginator;
        }

        $resultSet = $this->tableGateway->selectWith($select);
        return $resultSet;
    }

    public function getTotalQuestions($id){
        $total = $this->tableGateway->select(['exam_id'=>$id])->count();
        return $total;
    }

    public function getLastSortOrder($testId){
        $row = ExamQuestion::where('exam_id',$testId)->orderBy('sort_order','desc')->first();
        if($row){
            return $row->sort_order;
        }
        else{
            return 0;
        }
    }

}
