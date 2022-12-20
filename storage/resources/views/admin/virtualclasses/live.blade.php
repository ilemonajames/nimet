@extends('layouts.admin')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            '#'=>__lang('courses-sessions')
        ]])
@endsection

@section('search-form')
    <form class="form-inline mr-auto" method="get" action="{{ route('admin.student.sessions') }}">
        <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
        </ul>
        <div class="search-element">
            <input value="{{ request()->get('filter') }}"   name="filter" class="form-control" type="search" placeholder="{{ __lang('search') }}" aria-label="{{ __lang('search') }}" data-width="250">
            <button class="btn" type="submit"><i class="fas fa-search"></i></button>
        </div>
    </form>
@endsection

@section('content')

    <section class="section">
        <div class="dropdown d-inline mr-2">
            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {{ __lang('add-new') }}
            </button>
            <div class="dropdown-menu wide-btn">
                <a class="dropdown-item" href="{{ route('admin.student.addvirtualclasses')  }}">{{ __lang('virtual-classes') }}</a>
            </div>
        </div>
        <button class="btn btn-success"  data-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="false" aria-controls="collapseFilter"><i class="fa fa-filter"></i> {{ __lang('filter') }}</button>
        <br> <br>
        <div class="collapse" id="collapseFilter">
            <div class="card card-body">
                <form id="filterform"   role="form"  method="get" action="{{ route('admin.student.sessions')  }}">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="sr-only" for="filter">{{ __lang('filter') }}</label>
                                {{ formElement($text) }}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="sr-only" for="group">{{ __lang('category') }}</label>
                                {{ formElement($select) }}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="sr-only" for="group">{{ __lang('sort') }}</label>
                                {{ formElement($sortSelect) }}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="sr-only" for="group">{{ __lang('type') }}</label>
                                {{ formElement($typeSelect) }}
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="sr-only" for="group">{{ __lang('payment-required') }}</label>
                                {{ formElement($paymentSelect) }}
                            </div>
                        </div>
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> {{ __lang('filter') }}</button>
                            <button type="button" onclick="$('#filterform input, #filterform select').val(''); $('#filterform').submit();" class="btn btn-success"><i class="fa fa-redo"></i> {{ __lang('clear') }}</button>

                        </div>

                    </div>
                </form>
            </div>
        </div>
    <div class="row">
        @foreach($paginator as $row)
            @php
            $course = \App\VirtualClass::find($row->id);
             @endphp
        <div class="col-12 col-md-4 col-lg-4">
            <article class="article article-style-c">
                <div class="article-header">
                    @if(!empty($row->picture))
                    <div class="article-image" data-background="{{ resizeImage($row->picture,671,480,basePath()) }}">
                    </div>
                    @else
                        <div class="article-image" data-background="{{ asset('img/17.59.18.jpeg') }}" >
                        </div>
                    @endif

                </div>
                <div class="article-details">
                    <div class="article-category"> <div class="bullet"></div> <a href="#" onclick="openModal('{{ __lang('students-for') }} {{ $row->topic}}','{{ route('admin.student.sessionenrollees',['id'=>$row->id])  }}')">{{ $studentSessionTable->getTotalForSession($row->id) }} {{ __lang('students') }}</a></div>
                    <div class="article-title">
                        <h2><a href="{{ route('admin.student.editsession',['id'=>$row->id])  }}">{{ $row->topic }}</a></h2>
                    </div>
                    
                   {{--  @if(\App\Admin::find($row->admin_id))
                    <div class="article-user">
                        <img alt="image" src="{{ profilePictureUrl(\App\Admin::find($row->admin_id)->user->picture) }}">
                        <div class="article-user-details">
                            <div class="user-detail-name">
                                <a href="#">{{ adminName($row->admin_id) }}</a>
                            </div>
                            <div class="text-job">{{ \App\Admin::find($row->admin_id)->user->role->name }}</div>
                        </div>
                    </div>
                        @endif --}}


                    <div class="article-footer">
                        <div class="row">
                            <div class="col-md-6">
                                <a target="_blank" href="{{ $row->start_url }}" class="btn btn-block btn-primary"><i class="fa fa-eye"></i> {{ __lang('start-class') }}</a>    
                                
                                <button style="display: none;" data-toggle="modal1" data-target="#infoModal-{{ $row->id }}" class="btn btn-block btn-primary"><i class="fa fa-info-circle"></i> {{ __lang('info') }}</button>
                            </div>
                            <div class="col-md-6">
                                <a target="_blank" href="{{ $row->join_url }}" class="btn btn-block btn-primary"><i class="fa fa-eye"></i> {{ __lang('join-class') }}</a>    
                                <a style="display: none;" target="_blank" href="{{ route('admin.student.startclass',['id'=>$row->meeting_id]) }}" class="btn btn-block btn-primary"><i class="fa fa-eye"></i> {{ __lang('join-class') }}</a>    
                            </div>

                        </div>
                        <br>
                        <div class="row" style="display: none;">
                            <div class="col-md-12">
                                <div class="btn-group dropup hundred-percent">
                                    <button class="btn btn-block btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-cogs"></i> {{ __lang('actions') }}
                                    </button>
                                    <div class="dropdown-menu wider-btn">
                                        
                                            <a class="dropdown-item has-icon" href="{{ route('admin.student.editsession',['id'=>$row->id]) }}"><i class="fa fa-edit"></i> {{ __lang('edit') }}</a>
                                            <a class="dropdown-item has-icon" href="{{ route('admin.session.sessionclasses',['id'=>$row->id]) }}"><i class="fa fa-desktop"></i> {{ __lang('manage-classes') }}</a>
                                        
                                        <a class="dropdown-item has-icon" href="{{ route('admin.student.sessionstudents',['id'=>$row->id]) }}"><i class="fa fa-users"></i> {{ __lang('view-enrolled') }}</a>

                                        
                                            <a class="dropdown-item has-icon" href="{{ route('admin.student.instructors',['id'=>$row->id]) }}"><i class="fa fa-user"></i> {{ __lang('manage-instructors') }}</a>
                                        
                                        <a class="dropdown-item has-icon" href="{{ route('admin.student.mailsession',['id'=>$row->id]) }}"><i class="fa fa-envelope"></i> {{ __lang('send-message-enrolled') }}</a>
                                        <a class="dropdown-item has-icon" href="{{ route('admin.student.duplicatesession',['id'=>$row->id]) }}"><i class="fa fa-copy"></i> {{ __lang('duplicate') }}</a>
                                        
                                        <a class="dropdown-item has-icon"  onclick="openModal('{{ __lang('change-type') }}: {{ addslashes($row->topic) }}','{{ route('admin.session.sessiontype',['id'=>$row->id]) }}')" href="#" ><i class="fa fa-arrows-alt-v"></i> {{ __lang('change-session-type') }}</a>
                                        
                                        <a class="dropdown-item has-icon" href="{{ route('admin.session.tests',['id'=>$row->id]) }}"><i class="fa fa-check"></i> {{ __lang('manage-tests') }}</a>
                                        <a class="dropdown-item has-icon" onclick="return confirm('{{__lang('delete-confirm')}}')" href="{{ route('admin.student.deletesession',['id'=>$row->id]) }}"   ><i class="fa fa-trash-alt"></i> {{ __lang('delete') }}</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </article>
        </div>
            @section('footer')
                @parent
            <div class="modal fade" tabindex="-1" role="dialog" id="infoModal-{{ $row->id }}">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">{{ $row->topic }}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <ul class="nav nav-pills" id="myTab3-{{ $row->id }}" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab3-{{ $row->id }}" data-toggle="tab" href="#home3-{{ $row->id }}" role="tab" aria-controls="home" aria-selected="true">{{ __lang('general') }}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab3-{{ $row->id }}" data-toggle="tab" href="#profile3-{{ $row->id }}" role="tab" aria-controls="profile" aria-selected="false">{{ __lang('totals') }}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab3-{{ $row->id }}" data-toggle="tab" href="#contact3-{{ $row->id }}" role="tab" aria-controls="contact" aria-selected="false">{{ __lang('classes') }}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab4-{{ $row->id }}" data-toggle="tab" href="#contact4-{{ $row->id }}" role="tab" aria-controls="contact4" aria-selected="false">{{ __lang('instructors') }}</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent2-{{ $row->id }}">
                                <div class="tab-pane fade show active" id="home3-{{ $row->id }}" role="tabpanel" aria-labelledby="home-tab3-{{ $row->id }}">


                                    <div class="section-title mt-0 tab-list-title">@lang('default.name')</div>
                                    <blockquote class="plain">
                                        {{ $row->topic }}
                                    </blockquote>
                                    
                                    <div class="section-title mt-0 tab-list-title">@lang('default.description')</div>
                                    <blockquote class="plain">
                                        {!! clean($row->description)  !!}
                                    </blockquote>
                                    

                                    <div class="row">

                                        <div class="col-md-6">
                                            <div class="section-title mt-0 tab-list-title">@lang('default.created-by')</div>
                                            <blockquote class="plain">
                                                {{ adminName($row->admin_id) }}
                                            </blockquote>
                                        </div>
                                        
                                        <div class="col-md-6">
                                            <div class="section-title mt-0 tab-list-title">{{ __lang('start-date') }}</div>
                                            <blockquote class="plain">
                                                {{ showDate('d/M/Y',$row->start_date) }}
                                            </blockquote>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="section-title mt-0 tab-list-title">{{ __lang('end-date') }}</div>
                                            <blockquote class="plain">
                                                {{ showDate('d/M/Y',$row->end_date) }}
                                            </blockquote>
                                        </div>
                                      
                                    </div>

                                </div>
                                <div class="tab-pane fade" id="profile3-{{ $row->id }}" role="tabpanel" aria-labelledby="profile-tab3-{{ $row->id }}">
                                    <table class="table table-bordered">
                                        

                                    </table>

                                </div>
                                
                                
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

        {{ paginationControl(
                // the paginator object
                    $paginator,
                    // the scrolling style
                    'sliding',
                    // the partial to use to render the control
                    null,
                    // the route to link to when a user clicks a control link
                    array(
                        'route' => 'admin/default',
                        'controller'=>'student',
                        'action'=>'virtualclasses'
                    )
                ) }}
</section>

@endsection
