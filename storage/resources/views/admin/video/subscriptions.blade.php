@extends('layouts.admin')
@section('page-title','')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            route('admin.video.subscriptions')=> ('Subscriptions'),
            '#'=>isset($pageTitle)?$pageTitle:''
        ]])
@endsection

@section('content')
<div class="card">
    <div class="table-responsive">
    <div class="card-body no-padding">
        <table class="table table-hover table-striped no-margin">
            <thead>
            <tr>
                <th>#</th>
                <th>{{  __lang('name')  }}</th>
                <th>{{  __lang('Amount')  }}</th>
                <th>{{  __lang('total_amount')  }}</th>
                <th>{{  __lang('payment_reference')  }}</th>
                <th>{{  __lang('narration')  }}</th>
                <th>{{  __lang('transaction_id')  }}</th>
                <th>{{  __lang('Status')  }}</th>
                <th>{{  ('Start Date')  }}</th>
                <th>{{  ('End Date')  }}</th>
                {{-- <th >{{  __lang('Actions')  }}</th> --}}
            </tr>

            </thead>
            <tbody>



            @php $count=1; foreach($paginator as $row):  @endphp
                <tr>
                    <td>{{  $count++ }}
                    </td>
                    <td>{{ $row->user->name.' '.$row->user->last_name  }}</td>
                    <td>{{  $row->amount }}
                    </td>
                    <td>
                        {{  $row->total_amount }}
                       
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
                        <span class="color bg-danger text-white pl-3 pr-3">{{  __lang('failed')  }}</span>
                            @php  endif;  @endphp

                    </td>
                    
                    <td>{{  showDate('d/M/Y',$row->start_date) }}</td>
                    <td>{{  showDate('d/M/Y',$row->end_date) }}</td>
                </tr>
                
            @php  endforeach;  @endphp





            </tbody>
        </table>
        <div>{{ $paginator->links() }}</div>
    
        @php
        /* // add at the end of the file after the table
        echo paginationControl(
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
                'action'=>'paymentHistory'
                //'filter'=>$filter
            )
        ); */
        @endphp
    </div>  
</div>  
    </div><!--end .box-body -->
@endsection
