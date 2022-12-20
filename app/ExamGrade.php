<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExamGrade extends Model
{
    protected $fillable = ['grade','min','max'];
}
