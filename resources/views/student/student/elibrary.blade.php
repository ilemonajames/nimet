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
{{--    @section('search-form')
    <form class="form-inline mr-auto" method="get" action="{{ adminUrl(array('controller'=>'video','action'=>'index')) }}">
        <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
        </ul>
        <div class="search-element">
            <input value="{{ request()->get('filter') }}"   name="filter" class="form-control" type="search" placeholder="{{ __lang('search') }}" aria-label="{{ __lang('search') }}" data-width="250">
            <button class="btn" type="submit"><i class="fas fa-search"></i></button>
        </div>
    </form>
@endsection --}}
@section('content')

<div class="row">
    <div class="col-md-12"> 
        <a style="display: none;" class="btn btn-primary" href="{{ adminUrl(array('controller'=>'video','action'=>'add')) }}"><i class="fa fa-plus"></i> {{ __lang('add-video') }}</a>
        <button style="display: none;" class="btn btn-success"  data-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="false" aria-controls="collapseFilter"><i class="fa fa-filter"></i> {{ __lang('filter') }}</button>
    
        <div style="display: none;" class="collapse" id="collapseFilter">
            <div class="card card-body">
                <form id="filterform"   role="form"  method="get" action="{{ route('admin.video.index')  }}">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="sr-only" for="filter">{{ __lang('filter') }}</label>
                                {{ formElement($text) }}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="sr-only" for="group">{{ __lang('sort') }}</label>
                                {{ formElement($sortSelect) }}
                            </div>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> {{ __lang('filter') }}</button>
                            <button type="button" onclick="$('#filterform input, #filterform select').val(''); $('#filterform').submit();" class="btn btn-success"><i class="fa fa-redo"></i> {{ __lang('clear') }}</button>
    
                        </div>
                    </div>
                </form>
            </div>
        </div>
    
    
        <br><br>
    
        @if(!empty($sub->end_date))
        <div>
            <div>
                <div class="box">
                  {{-- {{ $sub->end_date.' /good work' }} --}}
                    <div class="box-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>{{  __lang('id')  }}</th>
                                <th>{{  __lang('thumbnail')  }}</th>
                                <th>{{  __lang('Name')  }}</th>
                                <th>{{  __lang('Length')  }}</th>
                                <th>{{  __lang('size')  }}</th>
                                <th>{{  __lang('type')  }}</th>
                                <th>{{  __lang('Added On')  }}</th>
                               {{--  @php  if(GLOBAL_ACCESS): @endphp --}}
                                <th>{{  __lang('Created By')  }}</th>
                                {{-- @php  endif;  @endphp --}}
                                <th>{{  __lang('Actions')  }}</th>
                            </tr>
                            </thead>
                            <tbody>
    
                                @php foreach ($paginator as $row): @endphp
                                    <tr>
                                        <td><span class="label label-success">{{$row->id}}</span></td>
                                        <td class="pt-1">
                                            @php  $thumb = 'uservideo/'.$row->id.'/'.fileName($row->file_name).'.jpg'; $video = 'uservideo/'.$row->id.'/'.$row->file_name;  @endphp
    
                                            @php  if(file_exists($thumb) && file_exists($video)):  @endphp
                                            <img class="img-thumbnail" style="max-width: 100px" src="{{ basePath() }}/uservideo/{{ $row->id  }}/{{ fileName($row->file_name) }}.jpg?rand={{ time() }}" alt="{{ $row->name }}" />
                                            @php  endif;  @endphp
    
                                            @php  if(!file_exists($video)):  @endphp
                                            <strong>{{  __lang('file-missing')  }}</strong>
                                            @php  endif;  @endphp
                                        </td>
                                        <td>{{$row->name}}</td>
                                        <td>
                                            @php  if(!empty($row->length)): @endphp
                                            {{ $row->length }}
                                            @php  endif;  @endphp
                                        </td>
                                        <td>
                                            @php  if (!empty($row->file_size)):  @endphp
                                            {{ formatSizeUnits($row->file_size) }}
                                            @php  endif;  @endphp
                                        </td>
                                        <td>
                                            {{  strtoupper(@pathinfo($row->file_name)['extension'])  }}
                                        </td>
                                        <td>
                                            {{ showDate('d/m/Y',$row->created_at) }}
                                        </td>
    
                                        {{-- @php  if(GLOBAL_ACCESS): @endphp --}}
                                        <td>{{adminName($row->admin_id)}}</td>
                                       {{--  @php  endif;  @endphp --}}
    
                                        <td>
    
                                            @if(file_exists($video))
                                            <a class="dropdown-item1" href="{{ route('student.student.play',$row->id, '')  }} " target="_blank"><i class="fa fa-play"></i> {{  __lang('Play')  }}</a>
                                            @endif
    
    
    
                                        </td>
                                    </tr>
                                @php endforeach; @endphp
    
    
                            </tbody>
                        </table>
    
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
                                'action'=>'elibrary',
                                'filter'=>$filter,
                                'sort'=>$sort
                            )
                        );
                         @endphp
                    </div><!--end .box-body -->
                </div><!--end .box -->
            </div><!--end .col-lg-12 -->
        </div>
   @else
     <div class="alert alert-danger">
        <h1>You have not subscribed to any NIMET packages yet. Please subscribe now to access all our e-libraries within your subscription period.</h1>
     </div>
   @endif
   


    </div>
    </div><!--end .box -->
    
    
@endsection
