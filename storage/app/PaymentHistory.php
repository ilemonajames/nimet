<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaymentHistory extends Model
{
    protected $fillable = ['user_id','amount','narration','payment_reference','processor_id','transaction_id','message','total_amount'];

    
    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function currency(){
        return $this->belongsTo(Currency::class);
    }
}
