<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExamQuestion extends Model
{
    protected $fillable = ['exam_id','question','sort_order'];

    public function test(){
        return $this->belongsTo(Exam::class);
    }

    public function testOptions(){
        return $this->hasMany(ExamOption::class);
    }

}
