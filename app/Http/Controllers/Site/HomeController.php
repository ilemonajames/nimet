<?php

namespace App\Http\Controllers\Site;

use App\Admin;
use App\Article;
use App\CourseCategory;
use App\Http\Controllers\Controller;
use App\Lib\CronJobs;
use App\Lib\HelperTrait;
use Illuminate\Http\Request;
use App\Course;

class HomeController extends Controller
{
    use HelperTrait;
    public function index(){

        //$courseCategories = CourseCategory::where('enabled',1)->get();
        $courses = Course::where('enabled',1)->get();

        return view('home.index',compact('courses'));
    }
    public function singleCourse(Request $request, $slug){

        //$courseCategories = CourseCategory::where('enabled',1)->get();
        $course = Course::where('enabled',1)->where('id',$slug)->first();
        if(!$course){
            return  abort(404);
          }

        return tview('site.new.single',compact('course'));
    }

    public function article($slug){

        $article = Article::where('slug',$slug)->where('enabled',1)->first();
        if(!$article){
          return  abort(404);
        }


        return tview('site.home.article',compact('article'));
    }
    public function courses(){

        $courses = Course::where('enabled',1)->get();
        /* if(!$article){
          return  abort(404);
        } */


        return tview('site.new.courses',compact('courses'));
    }

    public function about(){
        return tview('site.new.about');
    }

    public function ourInstructors(){
        return tview('site.new.instructors');
    }

    public function contact(){
        return tview('site.new.contact');
    }

    public function faq(){
        return tview('site.new.faq');
    }

    public function sendMail(Request $request){
        $this->validate($request,[
            'name'=>'required',
            'email'=>'required',
            'message'=>'required',
            'captcha' => 'required|captcha'
        ]);

        if(!empty(setting('general_admin_email')))
        {
            $this->sendEmail(setting('general_admin_email'),__('default.contact-form-message'),$request->message,['address'=>$request->email,'name'=>$request->name]);
        }

        return back()->with('flash_message',__('default.message-sent'));

    }

    public function privacy(){
        $title= __lang('privacy-policy');
        $content = setting('info_privacy');
        return tview('site.home.info',compact('title','content'));
    }

    public function terms(){
        $title= __lang('terms-conditions');
        $content = setting('info_terms');
        return tview('site.home.info',compact('title','content'));

    }

    public function instructors(){
        $admins = Admin::where('public',1)->whereHas('user',function($query){
            $query->orderBy('name');
        })->get();


        return tview('site.home.instructors',compact('admins'));
    }

    public function instructor(Admin $admin){
        if (empty($admin->public)){
            abort(401);
        }
        return tview('site.home.instructor',compact('admin'));
    }

    public function cron(Request $request,$method)
    {
        set_time_limit(3600);
        //protect ip
        $ip = setting('general_site_ip');
        if(!empty($ip) && trim($ip) != $_SERVER['REMOTE_ADDR']){
            exit('Unauthorized access');
        }

        //process only at 12noon in the first minute
        $hour= date('G');
        $minute = date('i');
        $cHour = setting('general_reminder_hour');
        if($hour != $cHour ){
            exit('Invalid time for cron');
        }

        $jobs= new CronJobs();
        call_user_func([$jobs,$method]);
    }
}
