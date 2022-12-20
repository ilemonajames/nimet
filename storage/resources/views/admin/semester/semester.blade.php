@extends('layouts.admin')
@section('page-title','')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            '#'=>isset($pageTitle)?$pageTitle:''
        ]])
@endsection

@section('content')

    <div >
        <div class="card">
            <div class="card-header">
                <header></header>
                <a class="btn btn-primary float-right" href="{{ adminUrl(array('controller'=>'semester','action'=>'addsemester')) }}"><i class="fa fa-plus"></i> {{ __lang('add-semester') }}</a>



            </div>
            <div class="box-body">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>{{ __lang('name') }}</th>
                        <th>{{ __lang('duration') }}</th>
                        <th>{{ __lang('status') }}</th>
                        <th  >{{__lang('actions')}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @php foreach($categories as $value):  @endphp
                        <tr>
                            <td>{{ $value->semester_name }}</td>
                            <td>{{ $value->duration }}</td>
                            <td> @if ($value->enabled == 1)
                                <div class="btn btn-sm btn-success">{{__lang('enabled')}}</div>
                            @else
                            <div class="btn btn-sm btn-danger">{{__lang('disabled')}}</div> 
                            @endif
                            </td>

                            <td>
                                <a href="{{ adminUrl(array('controller'=>'semester','action'=>'editsemester','id'=>$value->id)) }}" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top" data-original-title="{{__lang('edit')}}"><i class="fa fa-edit"></i> </a>

                                <a onclick="return confirm('{{__lang('delete-confirm')}}')" href="{{ adminUrl(array('controller'=>'semester','action'=>'deletesemester','id'=>$value->id)) }}"  class="btn btn-sm  btn-danger" data-toggle="tooltip" data-placement="top" data-original-title="{{__lang('delete')}}"><i class="fa fa-trash"></i></a>

                            </td>
                        </tr>
                    @php endforeach;  @endphp

                    </tbody>
                </table>

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
                        'controller'=>'semester',
                        'action'=>'index',
                    )
                ) }}
            </div><!--end .box-body -->
        </div><!--end .box -->
    </div><!--end .col-lg-12 -->



<!-- START SIMPLE MODAL MARKUP --><!-- /.modal -->
<!-- END SIMPLE MODAL MARKUP -->


@endsection
