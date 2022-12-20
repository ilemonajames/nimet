@extends("home.app")


@section("content")
<style>
    .counter-inner:after {
    position: absolute;
    content: "";
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    background: white;
    background-size: cover;
    background-repeat: no-repeat;
    opacity: .9;
    z-index: -1;
}
.counter-item .counter {
    color: var(--theme-text-color);
}
.counter-item .count {
    color: var(--theme-text-color);
}
.counter-item p {
    color: var(--theme-text-color);
    margin-bottom: 0px;
}
.color{
    color: var(--theme-secondary-color);
}
.bg{
   background-color:  var(--theme-secondary-color);
}
.bann-btn-1 {
    background: var(--theme-secondary-color);
    background: -webkit-linear-gradient(to top, var(--theme-primary-color), var(--theme-secondary-color));
    background: linear-gradient(to top, var(--theme-primary-color), var(--theme-secondary-color));
    color: #fff;
    border: 1px solid var(--theme-secondary-color);
}
</style>
<!-- Banner Section Start -->
{{-- <section class="banner-style-4 banner-padding">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-md-12 col-xl-6 col-lg-6">
                <div class="banner-content ">
                    <span class="subheading">Over 3000 Course Available</span>
                    <h1>Enjoy a Personalized
                        Learning Experience</h1>
                    <p class="mb-40"> Advance your career in business analytics, statistics, economic management and more.</p>

                    <div class="btn-container">
                        <a href="{{ url('/courses') }}" class="btn btn-main rounded">Find Courses</a>
                        <a href="{{ url('/register') }}" class="btn btn-white rounded ms-2">Get started </a>
                    </div>
                </div>
            </div>

            <div class="col-md-12 col-xl-6 col-lg-6">
                <div class="banner-img-round mt-5 mt-lg-0 ps-5">
                    <img src="{{ url('/img/b.png') }}" alt="" class="img-fluid">
                </div>
            </div>
        </div> <!-- / .row -->
    </div> <!-- / .container -->
</section> --}}

 <!-- SLIDER -->
 <section>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item slider1 active">
                <img src="slider/1.jpg" alt="">
                <div class="carousel-caption slider-con">
                    <h3 style="color: white">Over  <span class="color">3000 Courses</span> Available </h3>
                    <p>Advance your career in business analytics, statistics, economic management and more.</p>
                    <a href="{{ url('/courses') }}" class="bann-btn-1 bg">All Courses</a><a href="{{ url('/register') }}" class="bann-btn-2">Register</a>
                </div>
            </div>
            <div class="item">
                <img src="slider/2.jpg" alt="">
                <div class="carousel-caption slider-con">
                    <h3 style="color: white">Enjoy a Personalized <span class="color">Learning Experience</span> </h3>
                    <p>Advance your career in business analytics, statistics, economic management and more.</p>
                    <a href="{{ url('/about') }}" class="bann-btn-1 bg">About Us</a><a href="{{ url('/our-instructors') }}" class="bann-btn-2">Instructors</a>
                </div>
            </div>
            {{-- <div class="item">
                <img src="slider/3.jpg" alt="">
                <div class="carousel-caption slider-con">
                    <h2>Education <span>Master</span></h2>
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form</p>
                    <a href="#" class="bann-btn-1">All Courses</a><a href="#" class="bann-btn-2">Read More</a>
                </div>
            </div> --}}
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <i class="fa fa-chevron-left slider-arr"></i>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <i class="fa fa-chevron-right slider-arr"></i>
        </a>
    </div>
</section>
<!-- Banner Section End -->

<!-- Counter Section start -->
<section class="counter-section4">
    <div class="container">
        <div class="row justify-content-center" >
            <div class="col-xl-12 counter-inner">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="counter-item mb-5 mb-lg-0">
                            <div class="count">
                                <span class="counter h2">2000</span><span>+</span>
                            </div>
                            <p>Students</p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="counter-item mb-5 mb-lg-0">
                            <div class="count">
                                <span class="counter h2">1200</span>
                            </div>
                            <p>Online Courses</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="counter-item mb-5 mb-lg-0">
                            <div class="count">
                                <span class="counter h2">2256</span>
                            </div>
                            <p>Finished Seasons</p>     
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <div class="counter-item">
                            <div class="count">
                                <span class="counter h2">100</span><span>%</span>
                            </div>
                            <p>Satisfaction</p>     
                        </div>
                    </div>
                </div>
            </div>
       </div>
    </div>
</section>
<!-- COunter Section End -->




<!--  Course style 1 -->

<section class="course-wrapper section-padding ">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-8">
                <div class="section-heading mb-70 text-center">
                    <h2 class="font-lg">Popular Courses</h2>
                    <p>Discover Your Perfect Program In Our Courses.</p>
                </div>
            </div>
        </div>

        <div class="row justify-content-lg-center">
            @foreach($courses as $course)

            <div class="col-xl-4 col-lg-4 col-md-6">
                <div class="course-grid bg-shadow tooltip-style">
                    <div class="course-header">
                        <div class="course-thumb">
                            <a href="{{ route('course.single', $course->id, '') }}">
                            @if(!empty($course->picture))
                            <img src="{{ $course->picture }}" alt="" style="height: 200px;" class="img-fluid">
                        @else
                        <img src="{{ url('/img/course.png') }}" alt="" style="height: 200px;" class="img-fluid">
                        @endif
                            </a>
                            <div style="display: none" class="course-price none">300</div>
                        </div>
                    </div>
    
                    <div class="course-content">
                        <div class="rating mb-10 none">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                            <span>3.9 (30 reviews)</span>
                        </div>

                        <h3 class="course-title mb-20"> <a href="{{ route('course.single', $course->id, '') }}">{{ $course->name }}</a> </h3>
                        <div class="course-footer mt-20 d-flex align-items-center justify-content-between none">
                            <span class="duration none"><i class="far fa-clock me-2"></i>6.5 hr</span>
                            <span class="students none"><i class="far fa-user-alt me-2"></i>51 Students</span>
                            <span class="lessons none"><i class="far fa-play-circle me-2"></i>26 Lessons</span>
                        </div>
                    </div>
    
                    <div class="course-hover-content none">
                        <div style="display: none" class="price">300</div>
                        <h3 class="course-title mb-20 mt-30"> <a href="{{ route('course.single', $course->id, '') }}">{{ $course->name }} </a> </h3>
                        <div class="course-meta d-flex align-items-center mb-20">
                            <div class="author me-4">
                                @if(!empty($course->picture))
                                <img src="{{ $course->picture }}" alt="" class="img-fluid">
                            @else
                            <img src="{{ url('/img/course.png') }}" alt="" class="img-fluid">
                            @endif
                                <a href="#">Sarah</a>
                            </div>
                            <span class="lesson"> <i class="far fa-file-alt"></i> 20 lessons</span>
                        </div>
                        <p class="mb-20">{{ $course->short_description }}</p>
                        <a href="{{ route('course.single', $course->id, '') }}" class="btn btn-grey btn-sm rounded">Apply Now <i class="fal fa-angle-right"></i></a>
                    </div>
                </div>
             </div>
            <!-- COURSE END -->
            @endforeach
            
           
        </div>
    </div>
</section>

<!--  Course style 1 End -->




<!--  Course category -->
<section class="course-category-3 section-padding" style="display: none">
    <div class="container">
        <div class="row mb-70 justify-content-center">
            <div class="col-xl-8">
                <div class="section-heading text-center">
                    <h2 class="font-lg">Categories you want to learn</h2>
                    <p>Select your favourite categories from list</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl col-lg-4 col-sm-6">
                <div class="single-course-category style-3 bg-1">
                    <div class="course-cat-icon">
                        <img src="assets/images/icon/icon1.png" alt="" class="img-fluid">
                    </div>
                    <div class="course-cat-content">
                        <h4 class="course-cat-title">
                            <a href="#">Data Science & Analytics</a>
                        </h4>
                    </div>
                </div>
            </div>

            <div class="col-xl col-lg-4 col-sm-6">
                <div class="single-course-category style-3 bg-2">
                    <div class="course-cat-icon">
                        <img src="assets/images/icon/icon2.png" alt="" class="img-fluid">
                    </div>
                    <div class="course-cat-content">
                        <h4 class="course-cat-title">
                            <a href="#">Artificial Intellegence</a>
                        </h4>
                    </div>
                </div>
            </div>

            <div class="col-xl col-lg-4 col-sm-6">
                <div class="single-course-category style-3 bg-3">
                    <div class="course-cat-icon">
                        <img src="assets/images/icon/icon3.png" alt="" class="img-fluid">
                    </div>
                    <div class="course-cat-content">
                        <h4 class="course-cat-title">
                            <a href="#">Business Automation</a>
                        </h4>
                    </div>
                </div>
            </div>

            <div class="col-xl col-lg-4 col-sm-6">
                <div class="single-course-category style-3 bg-4">
                    <div class="course-cat-icon">
                        <img src="assets/images/icon/icon4.png" alt="" class="img-fluid">
                    </div>
                    <div class="course-cat-content">
                        <h4 class="course-cat-title">
                            <a href="#">Web Development</a>
                        </h4>
                    </div>
                </div>
            </div>

            <div class="col-xl col-lg-4 col-sm-6">
                <div class="single-course-category style-3 bg-5">
                    <div class="course-cat-icon">
                        <img src="assets/images/icon/icon6.png" alt="" class="img-fluid">
                    </div>
                    <div class="course-cat-content">
                        <h4 class="course-cat-title">
                            <a href="#">Digital Marketing & SEO</a>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  Course category End -->
<!-- Work Process Section Start -->
<section class="work-process section-padding">
    <div class="container">
        <div class="row mb-40">
            <div class="col-xl-8">
                <div class="section-heading ">
                    <h2 class="font-lg">Start your journey With us</h2>
                    <p>We are the best learning portal</p>
                </div>
            </div>
        </div>

        <div class="row align-items-center">
            <div class="col-xl-7 pe-xl-5 col-lg-12">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="step-item ">
                            <div class="step-number bg-1">01</div>
                            <div class="step-text">
                                <h5>Signup with all info</h5>
                                <p>Become our student</p>
                            </div>
                        </div>
                    </div>
        
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="step-item">
                            <div class="step-number bg-2">02</div>
                            <div class="step-text">
                                <h5>Pay for courses</h5>
                                <p>Our courses are affordable</p>
                            </div>
                        </div>
                    </div>
        
                    <div class="col-xl-6 col-lg-6 col-md-6 ">
                        <div class="step-item">
                            <div class="step-number bg-3">03</div>
                            <div class="step-text">
                                <h5>Learn from online </h5>
                                <p>start learning from your home with ease</p>
                            </div>
                        </div>
                    </div>
        
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="step-item">
                            <div class="step-number bg-1">04</div>
                            <div class="step-text">
                                <h5>Get certificate</h5>
                                <p>certificate will be given to every students.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-5">
                <div  class="banner-img-round ps-5 video-section1 mt-3 mt-xl-0">
                    <div class="video-content">
                        <img src="{{ url('/img/c.png') }}" alt="" class="img-fluid">
                        <a style="display:none;"href="#" class="video-icon1 video-popup1"><i class="fa fa-play"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Work Process Section End -->
<!--  Course style 1 -->

<section class="course-wrapper section-padding  bg-gray" style="display: none">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-8">
                <div class="section-heading mb-70 text-center">
                    <h2 class="font-lg">Popular Courses</h2>
                    <p>Discover Your Perfect Program In Our Courses.</p>
                </div>
            </div>
        </div>

        <div class="row justify-content-lg-center">
            <div class="col-xl-3 col-lg-6 col-md-6">
                <div class="course-grid tooltip-style bg-white hover-shadow">
                    <div class="course-header">
                        <div class="course-thumb">
                            <img src="assets/images/course/img_01.jpg" alt="" class="img-fluid">
                            <div style="display: none" class="course-price">300</div>
                        </div>
                    </div>
    
                    <div class="course-content">
                        <div class="rating mb-10">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                            <span>3.9 (30 reviews)</span>
                        </div>
                        <h3 class="course-title mb-20"> <a href="#">SQL-Data Analysis: Crash Course</a> </h3>
                        <div class="course-footer mt-20 d-flex align-items-center justify-content-between ">
                            <span class="duration"><i class="far fa-clock me-2"></i>6.5 hr</span>
                            <span class="lessons"><i class="far fa-play-circle me-2"></i>26 Lessons</span>
                        </div>
                    </div>
                </div>
             </div>
            <!-- COURSE END -->

            <div class="col-xl-3 col-lg-6 col-md-6">
                <div class="course-grid tooltip-style bg-white hover-shadow">
                    <div class="course-header">
                        <div class="course-thumb">
                            <img src="assets/images/course/img_05.jpg" alt="" class="img-fluid">
                            <div style="display: none" class="course-price">300</div>
                        </div>
                    </div>
    
                    <div class="course-content">
                        <div class="rating mb-10">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                            <span>3.9 (30 reviews)</span>
                        </div>
                        <h3 class="course-title mb-20"> <a href="#">Learn How to Start an Amazon FBA Store</a> </h3>
                        <div class="course-footer mt-20 d-flex align-items-center justify-content-between ">
                            <span class="duration"><i class="far fa-clock me-2"></i>6.5 hr</span>
                            <span class="lessons"><i class="far fa-play-circle me-2"></i>26 Lessons</span>
                        </div>
                    </div>
                </div>
             </div>
            <!-- COURSE END -->

            <div class="col-xl-3 col-lg-6 col-md-6">
                <div class="course-grid tooltip-style bg-white hover-shadow">
                    <div class="course-header">
                        <div class="course-thumb">
                            <img src="assets/images/course/img_02.jpg" alt="" class="img-fluid">
                            <div style="display: none" class="course-price">300</div>
                        </div>
                    </div>
    
                    <div class="course-content">
                        <div class="rating mb-10">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                            <span>3.9 (30 reviews)</span>
                        </div>
                    
                        <h3 class="course-title mb-20"> <a href="#">Emotional Intelligence at Work: Learn Emotions</a> </h3>
                       
                        <div class="course-footer mt-20 d-flex align-items-center justify-content-between ">
                            <span class="duration"><i class="far fa-clock me-2"></i>6.5 hr</span>
                            <span class="lessons"><i class="far fa-play-circle me-2"></i>26 Lessons</span>
                        </div>
                    </div>
                </div>
             </div>
            <!-- COURSE END -->
            
            <div class="col-xl-3 col-lg-6 col-md-6">
                <div class="course-grid tooltip-style bg-white hover-shadow">
                    <div class="course-header">
                        <div class="course-thumb">
                            <img src="assets/images/course/img_03.jpg" alt="" class="img-fluid">
                            <div style="display: none" class="course-price">300</div>
                        </div>
                    </div>
    
                    <div class="course-content">
                        <div class="rating mb-10">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>

                            <span>3.9 (30 reviews)</span>
                        </div>
                    
                        <h3 class="course-title mb-20"> <a href="#">Competitive Strategy law & Organization </a> </h3>
                      
                        <div class="course-footer mt-20 d-flex align-items-center justify-content-between ">
                            <span class="duration"><i class="far fa-clock me-2"></i>6.5 hr</span>
                            <span class="lessons"><i class="far fa-play-circle me-2"></i>26 Lessons</span>
                        </div>
                    </div>
                </div>
             </div>
            <!-- COURSE END -->
        </div>
    </div>
</section>

<!--  Course style 1 End -->



<!-- Feature section start -->
<section class="features-3 section-padding-top ">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-8">
                <div class="section-heading mb-50 text-center">
                    <h2 class="font-lg">Transform Your Life </h2>
                    <p>Discover Your Perfect Program In Our Courses.</p>
                </div>
            </div>
        </div>

        <div class="row ">
            <div class="col-lg-3 col-md-6 col-xl-3 col-sm-6">
                <div class="feature-item feature-style-top hover-shadow rounded border-0">
                    <div class="feature-icon">
                        <i class="flaticon-teacher"></i>
                    </div>
                    <div class="feature-text">
                        <h4>Expert Teacher</h4>
                        <p>Develop skills for career of various majors including computer</p>
                    </div>
                </div>
            </div>
             <div class="col-lg-3 col-md-6 col-xl-3 col-sm-6">
                <div class="feature-item feature-style-top hover-shadow rounded border-0">
                    <div class="feature-icon">
                        <i class="flaticon-layer"></i>
                    </div>
                    <div class="feature-text">
                        <h4>Self Development</h4>
                        <p>Develop skills for career of various majors including computer.</p>
                    </div>
                </div>
            </div>
             <div class="col-lg-3 col-md-6 col-xl-3 col-sm-6">
                <div class="feature-item feature-style-top hover-shadow rounded border-0">
                    <div class="feature-icon">
                        <i class="flaticon-video-camera"></i>
                    </div>
                    <div class="feature-text">
                        <h4>Remote Learning</h4>
                        <p>Develop skills for career of various majors including language</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xl-3 col-sm-6">
                <div class="feature-item feature-style-top hover-shadow rounded border-0">
                    <div class="feature-icon">
                        <i class="flaticon-lifesaver"></i>
                    </div>
                    <div class="feature-text">
                        <h4>Life Time Support</h4>
                        <p>Develop skills for career of various majors including language  </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Feature section End -->
<!-- Team section start -->
<section class="team section-padding" style="display: none">
    <div class="container">
        <div class="row  mb-100">
            <div class="col-lg-8 col-xl-8">
                <div class="section-heading text-center text-lg-start">
                    <h2 class="font-lg">Top Rated Instructors</h2>
                    <p>Discover Your Perfect Program In Our Courses.</p>
                </div>
            </div>

             <div style="display: none;" class="col-xl-4 col-lg-4">
                <div class="text-center text-lg-end">
                    <a href="#" class="btn btn-main-outline rounded">All Instructors <i class="fa fa-angle-right"></i></a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl-3 col-lg-4 col-sm-6">
                <div class="team-item team-item-4 mb-70 mb-xl-0">
                    <div class="team-img">
                        <img style="display:none" src="assets/images/team/no-image.png" alt="" class="img-fluid">

                        <ul class="team-socials list-inline">
                            <li class="list-inline-item"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                        </ul>
                    </div>
                    <div class="team-content">
                        <div class="team-info">
                            <h4>Samuel Adewale</h4>
                            <p>SEO Expert</p>
                        </div>

                        <div class="course-meta">
                            <span class="duration"><i class="far fa-user-alt"></i>20 Students</span>
                            <span class="lessons"><i class="far fa-play-circle me-2"></i>23 Courses</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-xl-3 col-lg-4 col-sm-6">
                <div class="team-item team-item-4 mb-70 mb-xl-0">
                    <div class="team-img">
                        <img style="display:none" src="assets/images/team/no-image.png" alt="" class="img-fluid">
                        <ul class="team-socials list-inline">
                            <li class="list-inline-item"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                        </ul>
                    </div>
                    <div class="team-content">
                        <div class="team-info">
                            <h4>James IIemona</h4>
                            <p>CEO, Developer</p>
                        </div>
                        <div class="course-meta">
                            <span class="duration"><i class="far fa-user-alt"></i>20 Students</span>
                            <span class="lessons"><i class="far fa-play-circle me-2"></i>12 Courses</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-sm-6">
                <div class="team-item team-item-4 mb-70 mb-xl-0">
                    <div class="team-img">
                        <img style="display:none" src="assets/images/team/no-image.png" alt="" class="img-fluid">

                        <ul class="team-socials list-inline">
                            <li class="list-inline-item"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                        </ul>
                    </div>
                    <div class="team-content">
                        <div class="team-info">
                            <h4>Omeiza Alabi</h4>
                            <p>Web eveloper</p>
                        </div>
                        <div class="course-meta">
                            <span class="duration"><i class="far fa-user-alt"></i>20 Students</span>
                            <span class="lessons"><i class="far fa-play-circle me-2"></i>18 Courses</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-4 col-sm-6">
                <div class="team-item team-item-4">
                    <div class="team-img">
                        <img style="display:none" src="assets/images/team/no-image.png" alt="" class="img-fluid">

                        <ul class="team-socials list-inline">
                            <li class="list-inline-item"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                        </ul>
                    </div>
                    <div class="team-content">
                        <div class="team-info">
                            <h4>Victoria Ugwu</h4>
                            <p>UI/UX designer</p>
                        </div>

                        <div class="course-meta">
                            <span class="duration"><i class="far fa-user-alt"></i>20 Students</span>
                            <span class="lessons"><i class="far fa-play-circle me-2"></i>8 Courses</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Team section End -->

<!-- Testimonial section start -->
<section class="testimonial-4 section-padding bg-gray" style="display: none">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6">
                <div class="section-heading text-center mb-50">
                    <h2 class="font-lg">Our Students Says</h2>
                    <p>Discover Your Perfect Program In Our Courses.</p>
                </div>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-lg-12 col-xl-12">
                <div class="testimonials-slides owl-carousel owl-theme">
                    <div class="testimonial-item">
                       <div class="testimonial-inner">
                           <div class="quote-icon"><i class="flaticon-left-quote"></i></div>
                           
                            <div class="testimonial-text mb-30">
                               Piratech is the right choice for software development
                            </div>

                            <div class="client-info d-flex align-items-center">
                                <div class="client-img">
                                    <img src="assets/images/team/no-image.png" alt="" class="img-fluid">
                                </div>
                                <div class="testimonial-author">
                                    <h4>David Abraham</h4>
                                    <span class="meta">Marketing Specialist</span>
                                </div>
                            </div>
                       </div>
                    </div>

                    <div class="testimonial-item">
                        <div class="testimonial-inner">
                            <div class="quote-icon"><i class="flaticon-left-quote"></i></div>
                           
                            <div class="testimonial-text  mb-30">
                                good job
                            </div>

                            <div class="client-info d-flex align-items-center">
                                <div class="client-img">
                                    <img src="assets/images/team/no-image.png" alt="" class="img-fluid">
                                </div>
                                <div class="testimonial-author">
                                    <h4>Jackie Appiah</h4>
                                    <span class="meta">Marketing Manager</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="testimonial-item">
                        <div class="testimonial-inner">
                            <div class="quote-icon"><i class="flaticon-left-quote"></i></div>
                          
                            <div class="testimonial-text  mb-30">
                                we are impressed
                            </div>

                            <div class="client-info d-flex align-items-center">
                                <div class="client-img">
                                    <img src="assets/images/team/no-image.png" alt="" class="img-fluid">
                                </div>
                                <div class="testimonial-author">
                                    <h4>Nikolas Nelson</h4>
                                    <span class="meta">Sales Manager</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="testimonial-item">
                        <div class="testimonial-inner">
                            <div class="quote-icon"><i class="flaticon-left-quote"></i></div>
                            
                            <div class="testimonial-text mb-30">
                                They don't dissapoint
                            </div>

                            <div class="client-info d-flex align-items-center">
                                <div class="client-img">
                                    <img src="assets/images/team/no-image.png" alt="" class="img-fluid">
                                </div>
                                <div class="testimonial-author">
                                    <h4>Jocob Anabel</h4>
                                    <span class="meta">Marketing Manager</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="testimonial-item">
                        <div class="testimonial-inner">
                            <div class="quote-icon"><i class="flaticon-left-quote"></i></div>
                            
                            <div class="testimonial-text mb-30">
                                nice work
                            </div>

                            <div class="client-info d-flex align-items-center">
                                <div class="client-img">
                                    <img src="assets/images/team/no-image.png" alt="" class="img-fluid">
                                </div>
                                <div class="testimonial-author">
                                    <h4>Elizabeth Eze</h4>
                                    <span class="meta">Sales Manager</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Testimonial section End -->
<!-- CTA Sidebar start -->
<section class="cta-5 mb--120 bg-gray">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-12">
                <div class="cta-inner4">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-4 col-lg-5">
                           <div class="cta-img mb-4 mb-lg-0">
                               <img src="{{ url('/img/a.png') }}" alt="" class="img-fluid">
                           </div>
                        </div>
                        <div class="col-xl-6 col-lg-6">
                            <div class="cta-content ps-lg-4">
                                <span class="subheading mb-10">Not sure where to start?</span>
                                <h2 class="mb-20"> Want to know Special Offers & Updates of new courses?</h2>
                                <a href="{{ url('/register') }}" class="btn btn-main rounded"> Join Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection