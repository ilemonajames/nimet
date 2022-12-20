@include("home/header")
  

<section class="page-header">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-xl-8">
          <div class="title-block">
            <h1>Online Courses</h1>
            <ul class="header-bradcrumb justify-content-center">
              <li><a href="{{ url('/') }}">Home</a></li>
              <li class="active" aria-current="page">Courses</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
</section>

    <!--course section start-->
    <section class="section-padding page" >
        <div class="course-top-wrap">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-8">
                        <p>Showing 1-6 of 8 results</p>
                    </div>
    
                    <div class="col-lg-4">
                        <div class="topbar-search">
                            <form method="get" action="#">
                                <input type="text"  placeholder="Search our courses" class="form-control">
                                <label><i class="fa fa-search"></i></label>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="container">
            <div class="row ">
                @foreach($courses as $course)
                <div class="course-item col-lg-3 col-md-6 col-sm-6">
                    <div class=" course-style-5 bg-white">
                        <div class="course-header">
                            <div class="course-thumb">
                                <a href="{{ route('course.single', $course->id, '') }}">
                                @if(!empty($course->picture))
                                    <img src="{{ $course->picture }}" alt="" style="height: 150px;" class="img-fluid">
                                @else
                                <img src="{{ url('/img/course.png') }}" alt="" style="height: 150px;"  class="img-fluid">
                                @endif
                                </a>
                            </div>
                        </div>
    
                        <div class="course-content">
                            <div style="display: none" class="course-meta meta-style-1">
                                <span class="lessons"><i class="far fa-play-circle me-2"></i>26 Lectures</span>
                                <span class="label">Beginner</span>
                            </div>
                            <h4> <a href="{{ route('course.single', $course->id, '') }}">{{ $course->name }}</a> </h4>
                        
                            <div class="course-footer mt-20 d-flex align-items-center justify-content-between">
                                <span class="students" style="display: none"><i class="far fa-user-alt me-2"></i>51 Students</span>
                                <a href="{{ route('course.single', $course->id, '') }}" class="rounded-btn"><i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach

            </div>
        </div>
        <!--course-->
    </section>
    <!--course section end-->


@include("home/footer")
