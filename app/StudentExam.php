<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentExam extends Model
{
    protected $fillable = ['student_id','exam_id','score'];

    public function student(){
        return $this->belongsTo(Student::class);
    }

    public function exam(){
        return $this->belongsTo(Exam::class,'exam_id','id');
    }

    public function examOptions(){
        return $this->belongsToMany(ExamOption::class);
    }

}
