@extends('layouts.admin')
@section('page-title','')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            route('admin.student.index')=>__lang('students'),
            '#'=>isset($pageTitle)?$pageTitle:''
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
<div >
    <div class="card">
        <div class="card-header">
             {{ __lang('edit') }} &nbsp;  <strong>{{ $row->user->name }} {{ $row->user->last_name }}</strong>
        </div>
        <div class="card-body">

              <ul class="nav nav-pills" id="myTab3" role="tablist">
                                    <li class="nav-item">
                                      <a class="nav-link active" id="home-tab3" data-toggle="tab" href="#home3" role="tab" aria-controls="home" aria-selected="true">{{ __lang('student-details') }}</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" id="profile-tab3" data-toggle="tab" href="#profile3" role="tab" aria-controls="profile" aria-selected="false">{{ __lang('change-password') }}</a>
                                    </li>
                                  </ul>
                                  <div class="tab-content" id="myTabContent2">
                                    <div class="tab-pane fade show active" id="home3" role="tabpanel" aria-labelledby="home-tab3">

                                        <form enctype="multipart/form-data" method="post" action="{{ adminUrl(array('controller'=>'student','action'=>$action,'id'=>$id)) }}">
                                            @csrf
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('name')) }}</label>
                                                        </div>
                                                        <div >
                                                            {{ formElement($form->get('name')) }}   <p class="help-block">{{ formElementErrors($form->get('name')) }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('last_name')) }}</label>
                                                        </div>
                                                        <div >
                                                            {{ formElement($form->get('last_name')) }}   <p class="help-block">{{ formElementErrors($form->get('last_name')) }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>








                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('email')) }}</label>
                                                        </div>
                                                        <div >
                                                            {{ formElement($form->get('email')) }}   <p class="help-block">{{ formElementErrors($form->get('email')) }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            
                                            </div>










                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('mobile_number')) }}</label>
                                                        </div>
                                                        <div >
                                                            {{ formElement($form->get('mobile_number')) }}   <p class="help-block">{{ formElementErrors($form->get('mobile_number')) }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('status')) }}</label>
                                                        </div>
                                                        <div >
                                                            {{ formElement($form->get('status')) }}   <p class="help-block">{{ formElementErrors($form->get('status')) }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>




                                            <div class="row">



                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('picture')) }}</label>
                                                        </div>
                                                        <div >
                                                         <div>
                                                            @php if(!empty($row->user->picture) && isUrl($row->user->picture)): @endphp
                                                            <img src="{{$row->user->picture}}" style="max-width: 200px" alt=""/>
                                                            @php elseif(!empty($row->user->picture) && isImage($row->user->picture)): @endphp
                                                            {{-- <img src="{{ resizeImage($row->user->picture,200,200,basePath()) }}" alt=""/> --}}
                                                            <img title="Click on this image to enlarge it" id="imageBox2" src="{{ url('/').'/'.$row->user->picture }}" style="max-width: 200px;border: 5px solid #a9cf45;" alt="no image"/>

                                                            @php endif;  @endphp
                                                        </div>
                                                    @php if(!empty($row->user->picture)):  @endphp
                                                            <br>
                                                            <a class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to remove this display picture?')" href="{{adminUrl(['controller'=>'student','action'=>'removeimage','id'=>$row->id])}}"><i class="fa fa-trash"></i> {{ __lang('Remove image') }}</a>
                                                            <br><br>
                                                           @php endif;  @endphp
                                                            {{ formElement($form->get('picture')) }} <p class="help-block" style="color: #fc544b;">{{ formElementErrors($form->get('picture')) }}</p>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="control-group col-md-6">
                                                    {{  formLabel($form->get('olevel_result')) }}
                                                    <div class="controls">
                                    
                                                        @php  if(!empty($row->user->olevel_result) && isUrl($row->user->olevel_result)): @endphp
                                                        <img src="{{ $row->user->olevel_result }}" style="max-width: 200px" alt=""/>
                                                        <br> <br>
                                                        @php  elseif(!empty($row->user->olevel_result) && isImage('public/'.$row->user->olevel_result)): @endphp
                                                        {{-- <img src="{{  resizeImage($row->user->olevel_result,200,200,url('/')) }}" alt=""/> --}}
                                                        <img title="Click on this O'Level result image to enlarge it" id="imageBox1" src="{{ url('/').'/'.$row->user->olevel_result }}" style="max-width: 200px;border: 5px solid #a9cf45;" alt="no O'Level result"/>
                                                        <br> <br>
                                                        @php  endif;  @endphp
                                    
                                                        @php  if(!empty($row->user->olevel_result)):  @endphp
                                                       {{--  <a style="display: none;" class="btn btn-danger"  onclick="return confirm('{{ __lang('confirm-remove-olevel-result') }}')" href=""><i class="fa fa-trash"></i> {{  __lang('remove-olevel-result')  }}</a> --}}
                                                        <br> <br> @php  endif;  @endphp
                                                        {{  formElement($form->get('olevel_result')) }} <p class="help-block" style="color: #fc544b;">{{  formElementErrors($form->get('olevel_result')) }}</p>
                                                    </div>
                                                </div>




                                            </div>









                                            <div class="row">

                                                @php foreach($fields as $row): @endphp

                                                <div class="col-sm-6">
                                                    <div class="form-group">

                                                        @php if($row->type == 'checkbox'): @endphp

                                                        <div >
                                                            {{ formElement($form->get('custom_'.$row->id)) }}
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('custom_'.$row->id)) }}</label>
                                                            <p class="help-block">{{ formElementErrors($form->get('custom_'.$row->id)) }}</p>
                                                        </div>

                                                        @php elseif($row->type == 'radio'):  @endphp
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('custom_'.$row->id)) }}</label>
                                                        </div>
                                                        <div >
                                                            {{ $this->formRadio($form->get('custom_'.$row->id)) }}
                                                            <p class="help-block">{{ formElementErrors($form->get('custom_'.$row->id)) }}</p>
                                                        </div>
                                                        @php else:  @endphp

                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('custom_'.$row->id)) }}</label>
                                                        </div>
                                                        <div >
                                                            {{ formElement($form->get('custom_'.$row->id)) }}   <p class="help-block">{{ formElementErrors($form->get('custom_'.$row->id)) }}</p>
                                                        </div>

                                                        @php endif;  @endphp


                                                    </div>
                                                </div>

                                                @php endforeach;  @endphp

                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('academic_session_id')) }}</label>
                                                        </div>
                                                        <div >
                                                         {{ formElement($form->get('academic_session_id')) }}   <p class="help-block">{{ formElementErrors($form->get('academic_session_id')) }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div >
                                                            <label for="password1" class="control-label">{{ formLabel($form->get('semester_id')) }}</label>
                                                        </div>
                                                        <div >
                                                         {{ formElement($form->get('semester_id')) }}   <p class="help-block">{{ formElementErrors($form->get('semester_id')) }}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-footer col-lg-offset-1 col-md-offset-2 col-sm-offset-3">
                                                <button type="submit" class="btn btn-primary btn-block">{{__lang('save-changes')}}</button>
                                            </div>

                                        </form>





                                    </div>
                                    <div class="tab-pane fade" id="profile3" role="tabpanel" aria-labelledby="profile-tab3">


                                        <form method="post" class="form form-horizontal"
                                              action="{{ adminUrl( ['controller' => 'student', 'action' => 'changepassword', 'id' => $id]) }}">
                                            @csrf
                                            <div class="form-group">
                                                <label for="">{{ __lang('new-password') }}</label>
                                                <input required class="form-control" type="password" name="password"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="">{{ __lang('confirm-password') }}</label>
                                                <input required class="form-control" type="password" name="confirm_password"/>
                                            </div>
                                            <div class="form-group">
                                                <input type="checkbox" name="notify" value="1" checked/>
                                                <label for="">{{ __lang('send-new-password') }}</label>
                                            </div>
                                            <button class="btn btn-primary btn-block" type="submit">{{__lang('save')}}</button>
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

        </div><!--end .box -->
    </div><!--end .col-lg-12 -->


</div>
@endsection
