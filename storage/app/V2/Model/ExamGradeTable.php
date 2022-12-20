<?php
/**
 * Created by PhpStorm.
 * User: USER PC
 * Date: 5/25/2018
 * Time: 4:48 PM
 */

namespace App\V2\Model;


use App\ExamGrade;
use App\Lib\BaseTable;

class ExamGradeTable extends BaseTable {
    protected $tableName = 'exam_grades';
    //protected $primary = 'test_grade_id';

    public function getGrade($score){
        if(!is_numeric($score)){
            return '';
        }

        $testGrade = ExamGrade::where('min','<=',$score)->where('max','>=',$score)->first();
        if($testGrade){
            return $testGrade->grade;
        }
        else{
            return '';
        }
    }
}
