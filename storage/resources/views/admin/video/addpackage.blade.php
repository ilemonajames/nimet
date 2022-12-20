@extends('layouts.admin')
@section('page-title','')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            route('admin.video.packages')=> ('Subscription packages'),
            '#'=>isset($pageTitle)?$pageTitle:''
        ]])
@endsection

@section('content')
    <div >
        <div class="card">

            <div class="card-body">

                    <form method="post" action="{{ adminUrl(array('controller'=>'video','action'=>$action,'id'=>$id)) }}">
                        @csrf

                <div class="form-group">
                    {{ formLabel($form->get('name')) }}
                    {{ formElement($form->get('name')) }}   <p class="help-block">{{ formElementErrors($form->get('name')) }}</p>

                </div>

                <div class="form-group">
                    {{ formLabel($form->get('amount')) }}
                    {{ formElement($form->get('amount')) }}   <p class="help-block">{{ formElementErrors($form->get('amount')) }}</p>

                </div>
                <div class="form-group">
                    {{ formLabel($form->get('duration')).' (in days only)' }}
                    {{ formElement($form->get('duration')) }}   <p class="help-block">{{ formElementErrors($form->get('duration')) }}</p>

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
