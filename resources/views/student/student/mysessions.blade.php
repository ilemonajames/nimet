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
@if($default == $session && $payment_status == 1)
    <div class="row">
        @foreach($paginator as $row)
            @php  if($row->type=='c'): @endphp
            @php  $type='course';  @endphp
            @php  else: @endphp
            @php  $type='session';  @endphp
            @php  endif;  @endphp
            @php
                $course = \App\Course::find($row->course_id);
            @endphp
            <div class="col-12 col-md-4 col-lg-4">
                <article class="article article-style-c">
                    <div class="article-header">
                        <a href="{{  route('student.'.$type.'-details',['id'=>$row->course_id,'slug'=>safeUrl($row->name)]) }}">
                        @if(!empty($row->picture))
                            <div class="article-image" data-background="{{ resizeImage($row->picture,671,480,basePath()) }}">
                            </div>
                        @else
                            <div class="article-image" data-background="{{ asset('img/course.png') }}" >
                            </div>
                        @endif
                        </a>
                    </div>
                    <div class="article-details">
                        <div class="article-category"><a href="{{  route('student.'.$type.'-details',['id'=>$row->course_id,'slug'=>safeUrl($row->name)]) }}">{{ courseType($row->type) }}
                            </a> <div class="bullet"></div>
                            <a href="{{  route('student.'.$type.'-details',['id'=>$row->id,'slug'=>safeUrl($row->name)]) }}">{{ $course->lessons()->count() }} {{ __lang('classes') }}</a>
                        </div>
                        <div class="article-title">
                            <h2><a href="{{  route('student.'.$type.'-details',['id'=>$row->course_id,'slug'=>safeUrl($row->name)]) }}">{{ $row->name }}</a></h2>
                        </div>
                        <div class="article-details">{{ limitLength($course->short_description,300) }}</div>

                        <div class="row pl-2">
                            @foreach($course->admins()->limit(4)->get() as $admin)

                                <div class="article-user col-md-6">
                                    <img alt="image" src="{{ profilePictureUrl($admin->user->picture) }}">
                                    <div class="article-user-details">
                                        <div class="user-detail-name">
                                            <a href="#" data-toggle="modal" data-target="#adminModal-{{ $admin->id }}">{{ limitLength(adminName($admin->id),20) }}</a>
                                        </div>
                                        <div class="text-job">{{ $admin->user->role->name }}</div>
                                    </div>
                                </div>

                                @section('footer')
                                    @parent
                                            <div class="modal fade" tabindex="-1" role="dialog" id="adminModal-{{ $admin->id }}">
                                                      <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                          <div class="modal-header">
                                                            <h5 class="modal-title">{{ $admin->user->name }} {{ $admin->user->last_name }}</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                              <span aria-hidden="true">&times;</span>
                                                            </button>
                                                          </div>
                                                          <div class="modal-body">
                                                              <div class="row">
                                                                  <div class="col-md-3">
                                                                      <figure class="avatar mr-2 avatar-xl text-center">
                                                                          <img src="{{ profilePictureUrl($admin->user->picture) }}"  >
                                                                      </figure>
                                                                  </div>
                                                                  <div class="col-md-p"><p>{!! clean($admin->about) !!}</p></div>
                                                              </div>

                                                          </div>
                                                          <div class="modal-footer bg-whitesmoke br">
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal">{{ __lang('close') }}</button>
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </div>
                                @endsection
                            @endforeach
                        </div>



                        <div class="article-footer">

                            <div class="row">
                                <div class="col-md-12">
                                    <a class="btn btn-primary btn-block" href="{{  route('student.'.$type.'-details',['id'=>$row->course_id,'slug'=>safeUrl($row->name)]) }}"><i class="fa fa-info-circle"></i> {{ __lang('details') }}</a>
                                </div>
                            </div>

                        </div>
                    </div>

                </article>
            </div>


        @endforeach

    </div>
@endif

    @if(false)
<!--breadcrumb-section ends-->
<!--container starts-->
<div class="container" style="background-color: white; min-height: 100px;   padding-bottom:50px; margin-bottom: 10px;   " >
    <!--primary starts-->

    <div class="card-body" style="padding-top: 20px">

        @php  foreach($paginator as $row):  @endphp

            @php  if($row->type=='c'): @endphp
          @php  $type='course';  @endphp
            @php  else: @endphp
                @php  $type='session';  @endphp
            @php  endif;  @endphp
            <div class="panel panel-default paper-shadow" data-z="0.5">
                <div class="panel-body">

                    <div class="media media-clearfix-xs">
                        <div class="media-left text-center">
                            <div class="cover width-150 width-100pc-xs overlay cover-image-full hover margin-v-0-10">
                                <span class="img icon-block height-130 bg-default"></span>
                            <span class="overlay overlay-full padding-none icon-block bg-default">
                        <span class="v-center">


                            @php  if(!empty($row->picture)):  @endphp

                                <a href="{{  route('student.'.$type.'-details',['id'=>$row->id,'slug'=>safeUrl($row->name)]) }}" class="thumbnail" style="border: none; margin-bottom: 0px">
                                    <img src="{{  resizeImage($row->picture,150,130,url('/')) }}" >
                                </a>
                            @php  else:  @endphp
                                <i class="fa fa-book"></i>
                            @php  endif;  @endphp
                        </span>
                    </span>
                                <a href="{{  route('student.'.$type.'-details',['id'=>$row->id,'slug'=>safeUrl($row->name)]) }}" class="overlay overlay-full overlay-hover overlay-bg-white">

                                </a>
                            </div>
                        </div>
                        <div class="media-body">
                            <h4 class="text-headline margin-v-5-0"><a href="{{  route('student.'.$type.'-details',['id'=>$row->id,'slug'=>safeUrl($row->name)]) }}">{{  $row->name  }}</a></h4>
<p><strong>@php
            switch($row->type){
                                       case 'b':
                                           echo __lang('training-online');
                                           break;
                                       case 's':
                                           echo __lang('training-session');
                                           break;
                                       case 'c':
                                           echo __lang('online-course');
                                           break;
                                   }
         @endphp</strong></p>
                            <p>{{  limitLength($row->short_description,300) }}</p>
                            <p>

                            </p>

                            @php  $session = \App\Course::find($row->id);  @endphp
                            <hr class="margin-v-8" />

                            <div class="row">
                                @php  foreach($session->admins as $instructor): @endphp
                                    <div class="col-md-4">
                                        <div class="media v-middle">
                                            <div class="media-left">
                                                <img src="{{ profilePictureUrl($instructor->user->picture,url('/')) }}" alt="{{  __lang('People')  }}" class="img-circle width-40"/>
                                            </div>
                                            <div class="media-body">
                                                <h4><a href="#"  data-toggle="modal" data-target="#instructorModal{{ $instructor->id }}">{{ $instructor->user->name }} {{ $instructor->user->last_name }}</a><br/></h4>
                                                {{  __lang('Instructor')  }}
                                            </div>
                                        </div>
                                    </div>





                                @php  endforeach;  @endphp

                            </div>
                            <a href="{{  route('student.'.$type.'-details',['id'=>$row->id,'slug'=>safeUrl($row->name)]) }}" class="btn btn-primary float-right"><i class="fa fa-info-circle"></i> {{  __lang('Details')  }}</a>



                        </div>
                    </div>

                </div>
            </div>

            @php  foreach($session->admins as $instructor): @endphp

                <div class="modal fade" id="instructorModal{{ $instructor->id }}" tabindex="-1" role="dialog" aria-labelledby="instructorModal{{ $instructor->id }}Label">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="{{  __lang('Close')  }}"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="instructorModal{{ $instructor->id }}Label">{{ $instructor->user->name }} {{ $instructor->user->last_name }}</h4>
                            </div>
                            <div class="modal-body">
                                <div class="media v-middle">
                                    <div class="media-left">
                                        <img src="{{ profilePictureUrl($instructor->user->picture,url('/')) }}" alt="People" class="img-circle width-200"/>
                                    </div>
                                    <div class="media-body">
                                        {{ $instructor->about }}
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">{{  __lang('Close')  }}</button>
                            </div>
                        </div>
                    </div>
                </div>
            @php  endforeach;  @endphp


        @php  endforeach;  @endphp

        @php
        // add at the end of the file after the table
            echo paginationControl(
            // the paginator object
                $paginator,
                // the scrolling style
                'sliding',
                // the partial to use to render the control
                null,
                // the route to link to when a user clicks a control link
                array(
                      'route' => 'student/default',
                     'controller'=>'student',
                     'action'=>'mysessions',
                )
            );

         @endphp
    </div>


</div>

<!--container ends-->
    @endif
@endsection
