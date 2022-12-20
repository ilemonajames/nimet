<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    protected $fillable = ['user_id','amount','narration','payment_reference','processor_id','transaction_id','message','total_amount','package_id','start_date','end_date'];

    
    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function currency(){
        return $this->belongsTo(Currency::class);
    }
}
