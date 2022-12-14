@include("home/header")
  

<section class="course-page-header">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-xl-8">
          <div class="title-block">
            <h1>{{ $course->name }}</h1>
            <ul class="list-inline mb-0">
                <li class="list-inline-item">
                    <a href="#">Home</a>
                </li>
                <li class="list-inline-item">Course</li>
                <!-- <li class="list-inline-item">/</li> -->
                {{-- <li class="list-inline-item">Web Development</li>
                <!-- <li class="list-inline-item">/</li> -->
                <li class="list-inline-item">Mastering PHP from zero to hero </li> --}}
            </ul>
          </div>
        </div>
      </div>
    </div>
</section>

<section class="page-wrapper">
    <div class="tutori-course-content ">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-xl-8">               
                    <nav class="course-single-tabs learn-press-nav-tabs">
                            <div class="nav nav-tabs course-nav" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-home-tab" data-bs-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home-tab" aria-selected="true">Overview</a>
                            <a class="nav-item nav-link none" id="nav-topics-tab" data-bs-toggle="tab" href="#nav-topics" role="tab" aria-controls="nav-topics-tab" aria-selected="false">Curriculam</a>
                            <a class="nav-item nav-link none" id="nav-instructor-tab" data-bs-toggle="tab" href="#nav-instructor" role="tab" aria-controls="nav-instructor-tab" aria-selected="false">Instructor</a>
                            <a class="nav-item nav-link none" id="nav-feedback-tab" data-bs-toggle="tab" href="#nav-feedback" role="tab" aria-controls="nav-feedback-tab" aria-selected="false">Reviews</a>
                        </div>
                    </nav>


                    <div class="tab-content tutori-course-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            <div class="single-course-details ">
    <h4 class="course-title none">Description</h4>
    <p>{!! $course->description !!}</p>


    <div class="course-widget course-info none">
        <h4 class="course-title">What You will Learn?</h4>
        <ul>
            <li>
                <i class="fa fa-check"></i>
                Clean up face imperfections, improve and repair photos
            </li>
            <li>
                <i class="fa fa-check"></i>
                Remove people or objects from photos
            </li>
            <li>
                <i class="fa fa-check"></i>
                Master selections, layers, and working with the layers panel
            </li>
            <li>
                <i class="fa fa-check"></i>
                Use creative effects to design stunning text styles
            </li>
            <li>
                <i class="fa fa-check"></i>
                working with the layers panel
            </li>
            <li>
                <i class="fa fa-check"></i>
                Cut away a person from their background
            </li>
        </ul>
    </div>
</div>
                        </div>

                        <div class="tab-pane fade" id="nav-topics" role="tabpanel" aria-labelledby="nav-topics-tab">
                            <div class="tutori-course-curriculum" >
    <div class="curriculum-scrollable">
        <ul class="curriculum-sections">
            <li class="section">
                <div class="section-header">
                    <div class="section-left">
                        <h5 class="section-title">Change simplification</h5>
                        <p class="section-desc">Dacere agemusque constantius concessis elit videmusne quia stoici constructio dissimillimas audiunt homerus commendationes</p>
                    </div>
                </div>
  
                <ul class="section-content">
                    <li class="course-item has-status course-item-lp_lesson">
                      <a class="section-item-link" href="#">
                        <span class="item-name">The importance of data nowsaday</span>
                        <div class="course-item-meta">
                          <span class="item-meta duration">10.30 min</span>
                          <i class="item-meta course-item-status"></i>
                        </div>
                      </a>
                    </li>

                    <li class="course-item has-status course-item-lp_lesson">
                        <a class="section-item-link" href="#">
                            <span class="item-name">Why my organization should know about data</span>
                            <div class="course-item-meta">
                            <span class="item-meta duration">20.30 min</span>
                            <i class="item-meta course-item-status" ></i>
                            </div>
                        </a>
                    </li>

                    <li class="course-item course-item-lp_assignment course-item-lp_lesson">
                        <a class="section-item-link" href="#">
                             <span class="item-name">Assignments</span>
                             <div class="course-item-meta">
         
                                 <span class="item-meta count-questions">14 questions</span>
                                 <span class="item-meta duration">10.21 min</span><i class="fa item-meta course-item-status trans"></i>
                             </div>
                         </a>
                     </li>
                    <li class="course-item course-item-lp_quiz course-item-lp_lesson">
                       <a class="section-item-link" href="#">
                            <span class="item-name">Quiz 1</span>
                            <div class="course-item-meta">
        
                                <span class="item-meta count-questions">14 questions</span>
                                <span class="item-meta duration">5.67 min</span><i class="fa item-meta course-item-status trans"></i>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- section end -->
            <li class="section">
              <div class="section-header">
                <div class="section-left">
                      <h5 class="section-title">Key concepts </h5>
                      <p class="section-desc">Dacere agemusque constantius concessis elit videmusne quia stoici constructio dissimillimas audiunt homerus commendationes</p>
                </div>
              </div>
  
                <ul class="section-content">
                    <li class="course-item has-status course-item-lp_lesson">
                      <a class="section-item-link" href="#">
                        <span class="item-name">Basic understanding of data management concepts</span>
                        <div class="course-item-meta">
                          <span class="item-meta duration">10 min</span>
                          <i class="item-meta course-item-status"></i>
                        </div>
                      </a>
                  </li>
              </ul>
            </li>
            <!-- section end -->    
            <li class="section">
                <ul class="section-content">
                    <li class="course-item has-status course-item-lp_lesson">
                        <a class="section-item-link" href="#">
                            <span class="item-name">Apply the principles </span>
                            <div class="course-item-meta">
                                <span class="item-meta duration">10 min</span>
                                <i class="item-meta course-item-status"></i>
                            </div>
                        </a>
                    </li>

                    <li class="course-item has-status course-item-lp_lesson">
                        <a class="section-item-link" href="#">
                            <span class="item-name">Lesson 2</span>
                            <div class="course-item-meta">
                                <span class="item-meta duration">20 min</span>
                                <i class="item-meta course-item-status"></i>
                            </div>
                        </a>
                    </li>

                    <li class="course-item has-status course-item-lp_lesson">
                        <a class="section-item-link" href="#">
                            <span class="item-name">Lesson 3</span>
                            <div class="course-item-meta">
                                <span class="item-meta duration">5 min</span>
                                <i class="item-meta course-item-status"></i>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- section end -->
        </ul>
        <!-- Main ul end -->
    </div>
</div>
                        </div>
                        <div class="tab-pane fade" id="nav-instructor" role="tabpanel" aria-labelledby="nav-instructor-tab">
                             <!-- Course instructor start -->
 <div class="courses-instructor">
    <div class="single-instructor-box">
        <div class="row align-items-center">
            <div class="col-lg-4 col-md-4">
                <div class="instructor-image">
                    <img src="assets/images/blog/author.jpg" alt="" class="img-fluid">
                </div>
            </div>

            <div class="col-lg-8 col-md-8">
                <div class="instructor-content">
                    <h4><a href="#">Tutori</a></h4>
                    <span class="sub-title">Web Developer</span>
                    
					<p>Jone Smit is a celebrated photographer, author, and writer who brings passion to everything he does.</p>
					
					<div class="intructor-social-links">
                        <span class="me-2">Follow Me: </span>
                        <a href="#"> <i class="fab fa-facebook-f"></i></a>
                        <a href="#"> <i class="fab fa-twitter"></i></a>
                        <a href="#"> <i class="fab fa-linkedin-in"></i></a>
                        <a href="#"> <i class="fab fa-youtube"></i></a>
					</div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Conurse  instructor end -->
                        </div>
                        <div class="tab-pane fade" id="nav-feedback" role="tabpanel" aria-labelledby="nav-feedback-tab">
                            <div id="course-reviews">
    <ul class="course-reviews-list">
        <li>
            <div class="course-review">
                <div class="course-single-review">
                    <div class="user-image">
                        <img src="assets/images/blog/author.jpg" alt="" class="img-fluid">
                    </div>

                    <div class="user-content user-review-content">
                       <div class="review-header mb-10">
                            <h4 class="user-name">Tutori</h4>
                            <p class="review-title">Cover all topicc  </p>
                            <div class="rating review-stars-rated">
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star-half"></i></a>
                            </div>
                        </div>
                        <div class="review-text">
                            <div class="review-content">
                            The course identify things we want to change and then figure out the things that need to be done to create the desired outcome. The course helped me in clearly define problems and generate a wider variety of quality solutions. Support more structures analysis of options leading to better decisions.                                                     
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>	
        <li>
            <div class="course-review">
                <div class="course-single-review">
                    <div class="user-image">
                        <img src="assets/images/blog/author.jpg" alt="" class="img-fluid">
                    </div>

                    <div class="user-content user-review-content">
                       <div class="review-header mb-10">
                            <h4 class="user-name">Tutori</h4>
                            <p class="review-title">Cover all topicc  </p>
                            <div class="rating review-stars-rated">
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star"></i></a>
                                <a href="#"><i class="fa fa-star-half"></i></a>
                            </div>
                        </div>
                        <div class="review-text">
                            <div class="review-content">
                            The course identify things we want to change and then figure out the things that need to be done to create the desired outcome. The course helped me in clearly define problems and generate a wider variety of quality solutions. Support more structures analysis of options leading to better decisions.                                                     
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </li>			
    </ul>
</div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-5 col-xl-4">
                    <!-- Course Sidebar start -->
<div class="course-sidebar course-sidebar-2 mt-5 mt-lg-0">
    <div class="course-widget course-details-info">
        <div class="course-thumbnail">
            @if(!empty($course->picture))
            <img src="{{ url($course->picture) }}" alt="" class="img-fluid w-100">
        @else
        <img src="{{ url('/img/course.png') }}" alt="" class="img-fluid w-100">
        @endif
        </div>
        <ul class="course-sidebar-list">
            <li>
                <div class="d-flex justify-content-between align-items-center">
                    
                    {{ $course->name }}
                </div>
            </li>
        </ul>
        <ul class="course-sidebar-list none">
            <li>
                <div class="d-flex justify-content-between align-items-center">
                    <span><i class="far fa-sliders-h"></i>Level</span>
                    Beginnner
                </div>
            </li>

                <li>
                <div class="d-flex justify-content-between align-items-center">
                    <span><i class="fas fa-play-circle"></i>Lectures</span>
                    2
                </div>
            </li>
                <li>
                <div class="d-flex justify-content-between align-items-center">
                    <span><i class="far fa-user"></i>Students</span>
                    20
                </div>
            <li>
                <div class="d-flex justify-content-between align-items-center">
                    <span><i class="far fa-clock"></i>Duration</span>
                    6 hours
                </div>
            </li>
                <li>
                <div class="d-flex justify-content-between align-items-center">
                    <span><i class="far fa-globe"></i>Language</span>
                    English
                </div>
            </li>

            <li>
                <div class="d-flex justify-content-between align-items-center">
                    <span><i class="far fa-calendar"></i>Updated </span>
                    October 15, 2022
                </div>
            </li>
        </ul>
        

        <div class="course-meterial none">
            <h4 class="mb-3">Material Includes</h4>
            <ul class="course-meterial-list">
                <li><i class="fal fa-long-arrow-right"></i>Videos</li>
                <li><i class="fal fa-long-arrow-right"></i>Files For Development</li>
                <li><i class="fal fa-long-arrow-right"></i>Documentation Files</li>
            </ul>
        </div>
    </div>

    <div class="course-latest none">
        <h4 class="mb-4">Popular Courses</h4>
        <ul class="recent-posts course-popular">
            <li>
                <div class="widget-post-thumb">
                    <a href="#"><img src="{{ url('/img/course.png') }}" alt="" class="img-fluid"></a>
                </div>
                <div class="widget-post-body">
                    <h6> <a href="#">Wordpress Theme Development</a></h6>
                    
                </div>
            </li>
            <li>
                <div class="widget-post-thumb">
                    <a href="#"><img src="{{ url('/img/course.png') }}" alt="" class="img-fluid"></a>
                </div>
                <div class="widget-post-body">
                    <h6> <a href="#">mastering Photoshop for beginners</a></h6>
                    
                </div>
            </li>
            <li>
                <div class="widget-post-thumb">
                    <a href="#"><img src="{{ url('/img/course.png') }}" alt="" class="img-fluid"></a>
                </div>
                <div class="widget-post-body">
                    <h6> <a href="#">Photography mastering adobe tool</a></h6>
                    
                </div>
            </li>
        </ul>
    </div>
</div>
<!-- Course Sidebar end -->
                </div>
            </div>
        </div>
    </div>
</section>



@include("home/footer")
