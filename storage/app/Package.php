<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    protected $fillable = ['name','enabled','sort_order','description','parent_id','amount','duration'];

    

}
