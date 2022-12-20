<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExamOption extends Model
{
    protected $fillable = ['exam_question_id','option','is_correct'];

    public function examQuestion(){
        return $this->belongsTo(ExamQuestion::class);
    }
}
