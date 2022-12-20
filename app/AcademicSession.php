<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AcademicSession extends Model
{
    protected $fillable = ['name','enabled','sort_order','description','parent_id'];

    

}
