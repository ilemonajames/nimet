<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VirtualClass extends Model
{
    use HasFactory, SoftDeletes;
	protected $table = 'virtual_class';

/**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'start_at',
    ];

    /**
     * The attributes that are need.
     *
     * @var array
     */
    protected $fillable = ['meeting_id', 'topic', 'description', 'start_date', 'end_date', 'picture', 'duration', 'password', 'student_limit', 'start_url', 'join_url'];


}

