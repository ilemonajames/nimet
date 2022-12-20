<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','role_id','picture','enabled','last_seen','last_name','billing_firstname','billing_lastname','billing_country_id','billing_state','billing_city','billing_address_1','billing_address_2','billing_zip','session','semester','course_of_study','payment_status','olevel_result'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function role(){
        return $this->belongsTo(Role::class);
    }

    public function student(){
        return $this->hasOne(Student::class);
    }

    public function admin(){
        return $this->hasOne(Admin::class);
    }

    public function forumTopics(){
        return $this->hasMany(ForumTopic::class);
    }

    public function paymenthistory()
    {
        return $this->hasMany(PaymentHistory::class,'id','user_id');
    }

    public function subscription()
    {
        return $this->hasMany(Subscription::class,'id','user_id');
    }

}
