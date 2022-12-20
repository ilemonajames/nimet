@extends('layouts.admin')
@section('page-title','')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            route('admin.academic.session')=>__lang('academic-session'),
            '#'=>isset($pageTitle)?$pageTitle:''
        ]])
@endsection

@section('content')
    <div >
        <div class="card">

            <div class="card-body">

                    <form method="post" action="{{ adminUrl(array('controller'=>'academic','action'=>$action,'id'=>$id)) }}">
                        @csrf





                <div class="form-group">
                    {{ formLabel($form->get('session_name')) }}
                    {{ formElement($form->get('session_name')) }}   <p class="help-block">{{ formElementErrors($form->get('session_name')) }}</p>

                </div>

                <div class="form-group">
                    {{ formLabel($form->get('description')) }}
                    {{ formElement($form->get('description')) }}   <p class="help-block">{{ formElementErrors($form->get('description')) }}</p>

                </div>


                <div class="form-group">
                    {{ formLabel($form->get('enabled')) }}
                    {{ formElement($form->get('enabled')) }}   <p class="help-block">{{ formElementErrors($form->get('enabled')) }}</p>

                </div>






                <div class="form-footer">
                    <button type="submit" class="btn btn-primary">{{__lang('save-changes')}}</button>
                </div>
                    </form>
            </div>
        </div><!--end .box -->
    </div><!--end .col-lg-12 -->


@endsection
