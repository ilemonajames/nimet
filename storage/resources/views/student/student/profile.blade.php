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
<style>
    .modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 0px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-content, .modal-content img, .modal-content span{
  margin: auto;
  text-align: center;
}

.modal-image {
  display: inline-block;
}

ul:not(.list-unstyled), ol {
    line-height: 28px;
    color: #fc544b;
}
</style>
<div class="card">
<div class="card-body">
    <form   enctype="multipart/form-data" method="post" action="{{ route('student.student.profile') }}">
        @csrf

        <div class="row">
            <div class="control-group col-md-6">
                {{  formLabel($form->get('name')) }}

                <div class="controls">
                    {{  formElement($form->get('name'))  }}
                    <p class="help-block">&nbsp;</p>
                </div>
            </div>

            <div class="control-group col-md-6">
                {{  formLabel($form->get('last_name')) }}

                <div class="controls">
                    {{  formElement($form->get('last_name'))  }}
                    <p class="help-block">&nbsp;</p>
                </div>
            </div>



            <div class="control-group col-md-6">
                {{  formLabel($form->get('mobile_number')) }}

                <div class="controls">
                    {{  formElement($form->get('mobile_number'))  }}
                    <p class="help-block">&nbsp;</p>
                </div>
            </div>

            <div class="control-group col-md-6">
                {{  formLabel($form->get('email')) }}

                <div class="controls">
                    {{  formElement($form->get('email'))  }}
                    <p class="help-block">{{  __lang('provide-email')  }}</p>
                </div>
            </div>
            <div class="control-group col-md-6" style="display:none;">
                <div class="form-group">
                    <div >
                        <label for="password1" class="control-label">{{ formLabel($form->get('status')) }}</label>
                    </div>
                    <div >
                        {{ formElement($form->get('status')) }}   <p class="help-block">{{ formElementErrors($form->get('status')) }}</p>
                    </div>
                </div>
            </div>
                <div class="control-group col-md-6">
                    <div class="form-group">
                        <div >
                            <label for="password1" class="control-label">{{ formLabel($form->get('academic_session_id')) }}</label>
                        </div>
                        <div >
                         {{ formElement($form->get('academic_session_id')) }}   <p class="help-block">{{ formElementErrors($form->get('academic_session_id')) }}</p>
                        </div>
                    </div>
                </div>
                                <div class="control-group col-md-6">
                    <div class="form-group">
                        <div >
                            <label for="password1" class="control-label">{{ formLabel($form->get('semester_id')) }}</label>
                        </div>
                        <div >
                         {{ formElement($form->get('semester_id')) }}   <p class="help-block">{{ formElementErrors($form->get('semester_id')) }}</p>
                        </div>
                    </div>
                </div>
            
            


            <div class="control-group col-md-6">
                {{  formLabel($form->get('picture')) }}
                <div class="controls">

                    @php  if(!empty($row->picture) && isUrl($row->picture)): @endphp
                    <img src="{{ $row->picture }}" style="max-width: 200px" alt=""/>
                    <br> <br>
                    @php  elseif(!empty($row->picture) && isImage('public/'.$row->picture)): @endphp
                    {{-- <img src="{{  resizeImage($row->picture,200,200,url('/')) }}" alt=""/> --}}
                    <img title="Click on this image to enlarge it" id="imageBox2" src="{{ url('/').'/'.$row->picture }}" style="max-width: 200px;border: 5px solid #a9cf45;" alt="no image"/>
                    <br> <br>
                    @php  endif;  @endphp

                    @php  if(!empty($row->picture)):  @endphp
                    <a class="btn btn-danger"  onclick="return confirm('{{ __lang('confirm-remove-picture') }}')" href="{{ route('student.student.removeimage') }}"><i class="fa fa-trash"></i> {{  __lang('Remove image')  }}</a>
                    <br> <br> @php  endif;  @endphp
                    {{  formElement($form->get('picture')) }} <p class="help-block">{{  formElementErrors($form->get('picture')) }}</p>
                </div>
            </div>

            <div class="control-group col-md-6">
                {{  formLabel($form->get('olevel_result')) }}
                <div class="controls">

                    @php  if(!empty($row->olevel_result) && isUrl($row->olevel_result)): @endphp
                    <img src="{{ $row->olevel_result }}" style="max-width: 200px" alt=""/>
                    <br> <br>
                    @php  elseif(!empty($row->olevel_result) && isImage('public/'.$row->olevel_result)): @endphp
                    {{-- <img src="{{  resizeImage(url('/').'/'.$row->olevel_result,200,200,url('/')) }}" alt="no photo"/> --}}
                    <img title="Click on this O'Level result image to enlarge it" id="imageBox1" src="{{ url('/').'/'.$row->olevel_result }}" style="max-width: 200px;border: 5px solid #a9cf45;" alt="no O'Level result"/>
                    <br> <br>
                    @php  endif;  @endphp

                    @php  if(!empty($row->olevel_result)):  @endphp
                    <a class="btn btn-danger"  onclick="return confirm('{{ __lang('confirm-remove-olevel-result') }}')" href="{{ route('student.student.removeolevelresult') }}"><i class="fa fa-trash"></i> {{  __lang('remove-olevel-result')  }}</a>
                    <br> <br> @php  endif;  @endphp
                    {{  formElement($form->get('olevel_result')) }} <p class="help-block">{{  formElementErrors($form->get('olevel_result')) }}</p>
                </div>
            </div>

            @php  foreach($fields as $row): @endphp



            @php  if($row->type == 'checkbox'): @endphp
            <div class="control-group col-md-6">


                <div class="controls">
                    {{  formLabel($form->get('custom_'.$row->id)) }}  {{  formElement($form->get('custom_'.$row->id)) }} <p class="help-block">{{  formElementErrors($form->get('custom_'.$row->id)) }}</p>
                </div>
            </div>

            @php  elseif($row->type == 'radio'):  @endphp

            <div class="control-group col-md-6">
                {{  formLabel($form->get('custom_'.$row->id)) }}
                <div class="controls">
                    {{  $this->formRadio($form->get('custom_'.$row->id)) }} <p class="help-block">{{  formElementErrors($form->get('custom_'.$row->id)) }}</p>
                </div>
            </div>

            @php  elseif($row->type == 'file'):  @endphp


            <div class="control-group col-md-6">
                {{  formLabel($form->get('custom_'.$row->id)) }}
                <div class="controls">
                    @php  $valueRow = $table->getStudentFieldRecord($id,$row->id);  @endphp
                    @php  if(!empty($valueRow) && isImage('public/'.$valueRow->value)): @endphp
                    <img src="{{  resizeImage($valueRow->value,200,200,url('/')) }}" alt=""/>

                    @php  endif;  @endphp
                    {{  formElement($form->get('custom_'.$row->id)) }} <p class="help-block">{{  formElementErrors($form->get('custom_'.$row->id)) }}</p>
                </div>
            </div>

            @php  else:  @endphp
            <div class="control-group col-md-6">
                {{  formLabel($form->get('custom_'.$row->id)) }}
                <div class="controls">
                    {{  formElement($form->get('custom_'.$row->id)) }} <p class="help-block">{{  formElementErrors($form->get('custom_'.$row->id)) }}</p>
                </div>
            </div>


            @php  endif;  @endphp




            @php  endforeach;  @endphp

        </div>



        <div class="form-footer"  >
            <button type="submit" class="btn btn-primary float-right">{{  __lang('Save Changes')  }}</button>
        </div>
    </form>

    <div id="myModal" class="modal">
        <div class="modal-content">
          <span style="width: 20px;height: 20px;color: #000;font-size: 25pt;font-weight:bolder;" onclick="closeImage()" class="close">&times;</span>
          <img src="" id="modal-image" style="width: 50%;height:auto;border: 10px solid #a9cf45;" />
        </div>
      </div>

      <script>
        function closeImage(){
           // var imageBox1 = document.getElementById("close1");

// Get the modal image tag
var modal = document.getElementById("myModal");
modal.style.display = "none";
$('body').css('overflow','auto');
        }

        //function showImage(){
            // Get the gallery box
var imageBox1 = document.getElementById("imageBox1");

// Get the modal image tag
var modal = document.getElementById("myModal");

var modalImage = document.getElementById("modal-image");

// When the user clicks the big picture, set the image and open the modal
imageBox1.onclick = function (e) {
  var src = e.srcElement.src;
  modal.style.display = "block";
  modalImage.src = src;
  $('body').css('overflow','hidden');
};
        //}

//function showImage(){
            // Get the gallery box
var imageBox2 = document.getElementById("imageBox2");

// Get the modal image tag
var modal1 = document.getElementById("myModal");

var modalImage = document.getElementById("modal-image");

// When the user clicks the big picture, set the image and open the modal
imageBox2.onclick = function (e) {
  var src1 = e.srcElement.src;
  modal1.style.display = "block";
  modalImage.src = src1;
  $('body').css('overflow','hidden');
};
        //}
      </script>
</div>
</div>




<!--container ends-->
<script src="{{  url('/') }}/client/vendor/intl-tel-input/build/js/intlTelInput.js"></script>

<script>


    $("input[name=mobile_number]").intlTelInput({
        initialCountry: "auto",
        separateDialCode:true,
        hiddenInput:'fmobilenumber',
        geoIpLookup: function(callback) {
            $.get('https://ipinfo.io', function() {}, "jsonp").always(function(resp) {
                var countryCode = (resp && resp.country) ? resp.country : "";
                callback(countryCode);
            });
        },
        utilsScript: "{{  url('/') }}/client/vendor/intl-tel-input/build/js/utils.js" // just for formatting/placeholders etc
    });
</script>
@endsection


@section('header')
    <link rel="stylesheet" href="{{ asset('client/vendor/intl-tel-input/build/css/intlTelInput.css') }}">
    <style>
        .iti-flag {background-image: url("{{  url('/') }}/client/vendor/intl-tel-input/build/img/flags.png");}

        @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2 / 1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {
            .iti-flag {background-image: url("{{  url('/') }}/client/vendor/intl-tel-input/build/img/flags@2x.png");}
        }

    </style>
@endsection


@section('footer')

    <script type="text/javascript" src="{{ asset('client/vendor/intl-tel-input/build/js/utils.js') }}"></script>
    <script type="text/javascript" src="{{ asset('client/vendor/intl-tel-input/build/js/intlTelInput.js') }}"></script>


@endsection
