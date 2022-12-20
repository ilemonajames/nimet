@extends('layouts.student')
@section('pageTitle',$pageTitle)
@section('innerTitle',$pageTitle)
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('student.dashboard')=>__lang('dashboard'),
            '#'=>$pageTitle
        ]])
@endsection

@section('content')

<div class="row">
    <div class="col-md-4"> 
    <b>Pay with bank transfer/deposit</b>
    {!! html_entity_decode($payment) !!}</div>
    <div class="col-md-8"> 
        <b>Pay with ATM card online.</b>
        <p>Please select one of radiobox below</p>
        <div class="container">
            
            <form id="payment-form">
                
               <div class="form-floating mb-3 mt-3" style="display: none;">
                  <input type="text" class="form-control" id="js-firstName" value="{{ $user->name }}" placeholder="Enter First Name" name="firstName">
                  <label for="email">First Name</label>
               </div>
               <div class="form-floating mb-3 mt-3" style="display: none;">
                  <input type="text" class="form-control" id="js-lastName" value="{{ $user->last_name }}" placeholder="Enter Last Name" name="lastName">
                  <label for="email">Last Name</label>
               </div>
               <div class="form-floating mb-3 mt-3" style="display: none;">
                  <input type="text" class="form-control" id="js-email" value="{{ $user->email }}" placeholder="Enter Email" name="email">
                  <label for="email">Email</label>
               </div>
               <div class="row"> 
               <div class="form-floating col-md-6">
                @foreach ($fees as $fee)
                <p>
                <label for="checked_amount">
                    <input style="margin-right: 5px;" type="radio" onclick="totalAmount({{ $fee->duration }})" data="{{ $fee->duration }}" name="checked_amount" class="form-control1" value="{{ $fee->amount }}"/>{{ $fee->name }} ({{ '₦'.$fee->amount }} {{ $fee->duration.' days' }})
                </label> 
            </p>
                @endforeach
                 <div style="display: none;">
                <label for="pwd">Amount</label>
                <input type="text" class="form-control" value="" id="js-amount" placeholder="Enter Amount" name="amount" required>
               
                </div>
              </div>
               <div class="form-floating col-md-6">
                <label for="pwd">Narration</label>
                  <input type="text" class="form-control" id="js-narration" placeholder="Enter Narration" name="narration" required>
                  
               </div>
            </div>
                <input style="margin-top: 30px;" type="button" onclick="payWithPaystack()" value="SUBMIT" button class="btn btn-primary btn-sm"/>
            </form>
           
         </div>
         
         <form method="POST" action="" style="display: none;" >
            @csrf
            <div class="form-floating mb-3 mt-3">
               <input type="text" class="form-control" value="" placeholder="Enter First Name" id="paymentReference" name="paymentReference" required>
               <label for="email">First Name</label>
            </div>
            <div class="form-floating mb-3 mt-3" >
               <input type="text" class="form-control" value="" placeholder="Enter Last Name" id="processorId" name="processorId">
               <label for="email">Last Name</label>
            </div>
            <div class="form-floating mb-3 mt-3" >
               <input type="text" class="form-control" value="" placeholder="Enter Email" id="transactionId" name="transactionId" required>
               <label for="email">Email</label>
            </div>
            <div class="row"> 
            <div class="form-floating col-md-6">
             <label for="pwd">Amount</label>
             <input type="text" class="form-control" value=""  placeholder="Enter Amount" id="total_amount" name="total_amount" required>
             
           </div>
           <div class="form-floating col-md-6">
            <label for="pwd">Amount</label>
            <input type="text" class="form-control" value=""  placeholder="payment_status" id="payment_status" name="payment_status" required>
            
          </div>
          <div class="form-floating col-md-6">
            <label for="pwd">Narration</label>
              <input type="text" class="form-control" id="narration1" placeholder="Enter Narration" name="narration1" required>
              <input type="text" class="form-control" value="" id="js-duration" placeholder="Enter duration" name="duration" required>
           </div>
         </div>
             <input style="margin-top: 30px;" type="submit" name="submit" value="SUBMIT" id="submitbtn" class="btn btn-primary btn-sm"/>
         </form>
         {{-- <script type="text/javascript" src="https://remitademo.net/payment/v1/remita-pay-inline.bundle.js"></script> --}}
         <script type="text/javascript" src="https://js.paystack.co/v1/inline.js"></script>
         <script type="text/javascript"> 
  //       const paymentForm = document.getElementById('payment-form');
//paymentForm.addEventListener("submit", payWithPaystack, false);
function payWithPaystack() {
  //e.preventDefault();
  const narration = document.getElementById('js-narration').value;
  const amount = document.getElementById('js-amount').value;
  if(amount === ""){
    alert("Amount is required.");
    return false;
  }else if(amount === "0"){
    alert("Please select one or more checkbox below.");
    return false;
  }else if(narration === ""){
    alert("Narration is required.");
    return false;
  }else{

  let handler = PaystackPop.setup({
    key: 'pk_test_5acb7adc7985d36bc4875e68f3987dc487db807f', // Replace with your public key
    email: document.getElementById("js-email").value,
    amount: document.getElementById("js-amount").value * 100,
    //ref: ''+Math.floor((Math.random() * 1000000000) + 1), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
    // label: "Optional string that replaces customer email"
    onClose: function(){
      //alert('Window closed.');
    },
    callback: function(response){
      let message = 'Payment complete! Reference: ' + response.reference;
      //alert(JSON.stringify(response));
      document.getElementById("paymentReference").value =response.reference;
                        document.getElementById("processorId").value =response.trxref; //transaction_reference
                        document.getElementById("transactionId").value =response.trans; 
                        document.getElementById("total_amount").value =document.getElementById("js-amount").value; 
                        document.getElementById("payment_status").value = "1"; 
                        document.getElementById("narration1").value =document.getElementById("js-narration").value; 
                        document.getElementById("submitbtn").click();
                        
                        console.log('callback Successful Response', message);
    }
  });

  handler.openIframe();
}
} 
         </script>
         <script type="text/javascript">   
         /* function setDemoData() { // Optional. This function is passed when the integration is at the demo stage and can be removed immediately for live.
            var form = document.querySelector("#payment-form");
            var obj = {
            firstName: form.querySelector('input[name="firstName"]').value,
            lastName: form.querySelector('input[name="lastName"]').value,
            email: form.querySelector('input[name="email"]').value,
            narration: form.querySelector('input[name="narration"]').value,
            amount: form.querySelector('input[name="amount"]').value
        };
        for (var propName in obj) {
            document.querySelector('#js-' + propName).setAttribute('value', obj[propName]);
        }
    }      
            function makePayment() {
               
                var form = document.querySelector("#payment-form");
                var paymentEngine = RmPaymentEngine.init({
                    key: 'QzAwMDAyNzEyNTl8MTEwNjE4NjF8OWZjOWYwNmMyZDk3MDRhYWM3YThiOThlNTNjZTE3ZjYxOTY5NDdmZWE1YzU3NDc0ZjE2ZDZjNTg1YWYxNWY3NWM4ZjMzNzZhNjNhZWZlOWQwNmJhNTFkMjIxYTRiMjYzZDkzNGQ3NTUxNDIxYWNlOGY4ZWEyODY3ZjlhNGUwYTY=',
                    //transactionId: Math.floor(Math.random()*1101233), // Replace with a reference you generated or remove the entire field for us to auto-generate a reference for you. Note that you will be able to check the status of this transaction using this transaction Id
                    customerId: form.querySelector('input[name="email"]').value,
                    firstName: form.querySelector('input[name="firstName"]').value,
                    lastName: form.querySelector('input[name="lastName"]').value,
                    email: form.querySelector('input[name="email"]').value,
                    amount: form.querySelector('input[name="amount"]').value,
                    narration: form.querySelector('input[name="narration"]').value,
                    onSuccess: function (response) {
                        //alert(JSON.stringify(response));
                        document.getElementById("paymentReference").value =response.paymentReference;
                        document.getElementById("processorId").value =response.processorId;
                        document.getElementById("transactionId").value =response.transactionId; 
                        document.getElementById("total_amount").value =response.amount; 
                        document.getElementById("payment_status").value = "1"; 
                        document.getElementById("narration1").value =document.getElementById("js-narration").value; 
                        document.getElementById("submitbtn").click();
                        
                        console.log('callback Successful Response', response);
                    },
                    onError: function (response) {
                        //alert(JSON.stringify(response));
                        document.getElementById("paymentReference").value =response.paymentReference;
                        document.getElementById("processorId").value =response.processorId;
                        document.getElementById("transactionId").value =response.transactionId; 
                        document.getElementById("total_amount").value =response.amount; 
                        document.getElementById("payment_status").value = "0"; 
                        document.getElementById("narration1").value =document.getElementById("js-narration").value;
                        document.getElementById("submitbtn").click();
                        console.log('callback Error Response', response);
                        
                    },
                    onClose: function () {
                        console.log("closed");
                    }
                });
                 paymentEngine.showPaymentWidget();
            }
           
            //window.onload = function () {
                //setDemoData();
            //}; */
        </script> 
    </div>
    <script>
        function totalAmount(input1) {
var input = document.getElementsByName("checked_amount");
//var input1 = document.getElementsByName("checked_amount").data;
//alert(input1);
var total = 0;
for (var i = 0; i < input.length; i++) {
if (input[i].checked) {
  total += parseFloat(input[i].value);
}
}
document.getElementsByName("amount")[0].value = total; //"$" + total.toFixed(2);
document.getElementsByName("duration")[0].value = input1;
}
     </script>
    <div class="card">

        <div class="card-body no-padding table-responsive">
            <table class="table table-hover table-striped no-margin">
                <thead>
                <tr>
                    <th>#</th>
                    <th>{{  __lang('Amount')  }}</th>
                    <th>{{  __lang('total_amount')  }}</th>
                    <th>{{  __lang('payment_reference')  }}</th>
                    <th>{{  __lang('narration')  }}</th>
                    <th>{{  __lang('transaction_id')  }}</th>
                    <th>{{  __lang('Status')  }}</th>
                    <th>{{  __lang('receipt')  }}</th>
                    <th>{{  ('Start Date')  }}</th>
                    <th>{{  ('End Date')  }}</th>
                    {{-- <th >{{  __lang('Actions')  }}</th> --}}
                </tr>
    
                </thead>
                <tbody>
    
    
                 
                @php $count=1;  foreach($paginator as $row):  @endphp
                    <tr>
                        <td>{{  $count++ }}</td>
                        <td>{{formatCurrency($row->amount,$row->currency->country->currency_code)}}
                            
                        </td>
                        <td>{{formatCurrency($row->total_amount,$row->currency->country->currency_code)}}
                        </td>
                        <td>
    
                            {{  $row->payment_reference }}
    
                        </td>
                        <td>{{  $row->narration }}</td>
                        <td>{{  $row->transaction_id }}</td>
                        <td>
    
                                @php  if($row->payment_status == 1):  @endphp
                                   <span class="color bg-success text-white pl-3 pr-3">{{  __lang('paid')  }}</span>
                            @php  else:  @endphp
                            <span class="color bg-danger text-white pl-3 pr-3">{{  __lang('failed')  }}</div>
                                @php  endif;  @endphp
    
                        </td>
                        <td>
                            @php  if($row->payment_status == 10):  @endphp
                               <a  target="_blank" href="{{  route('student.student.receipt',$row->id) }}" class="btn  btn-primary " data-toggle="tooltip" data-placement="top" data-original-title="{{  __lang('receipt')  }}"><i class="fa fa-money-bill"></i> {{  __lang('receipt')  }}</a>
                            @php  endif;  @endphp
                        </td>
                        <td>{{  showDate('d/M/Y',$row->start_date) }}</td>
                        <td>{{  showDate('d/M/Y',$row->end_date) }}</td>
                    </tr>
                    
                @php  endforeach;  @endphp
    
    
    
    
    
                </tbody>
            </table>
            <div>{{ $paginator->links() }}</div>
    
        </div><!--end .box-body -->
    </div><!--end .box -->
    
    
@endsection
