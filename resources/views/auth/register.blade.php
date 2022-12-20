@include("home/header")


    @if($enableRegistration)
      <section class="woocommerce single page-wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-xl-7">
                
                <div class="signup-form">
                    <div class="form-header">
                        <img src="assets/images/logo.png" alt="NIMET" style="height: 50px;" class="img-fluid" />
                        <h2 class="font-weight-bold mb-3">Apply For Admission</h2>
                        <p>Enroll for a course and start learning online</p>
                        <p class="woocommerce-register">
                            Already have an account? <a href="{{ route('login') }}" class="text-decoration-underline">Log in</a>
                        </p>
                        <p>@if($errors->any())
            @foreach ($errors->all() as $error)
                <div class="alert alert-warning" dir="rtl">
                    <ul>
                        <li>{!! $error !!}</li>
                    </ul>
                </div>
            @endforeach
        @endif</p>
                        @if (!empty(setting('regis_registration_instructions')))
                                    <div class="card-title">{!! clean(setting('regis_registration_instructions')) !!}</div>
                                @endif
                    </div>

                    <form method="POST" action="{{ route('register') }}" class="woocommerce-form woocommerce-form-register register">
                          @csrf
                        <div class="row">
                            <div class="col-xl-6">
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>First Name&nbsp;<span class="required">*</span></label>
                                    <input type="text" class="form-control" name="name" value="{{ old('name') }}" placeholder="First Name" required>
                                </p>
                            </div>
                            <div class="col-xl-6">
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>Last Name&nbsp;<span class="required">*</span></label>
                                    <input type="text" class="form-control" name="last_name"  value="{{ old('last_name') }}"  placeholder="Last Name" required>
                                </p>
                            </div>
                            <div class="col-xl-6">
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>Email Address&nbsp;<span class="required">*</span></label>
                                    <input type="email" class="form-control" name="email"  value="{{ old('email') }}" required placeholder="Email Address">
                                </p>
                            </div>

                            <div class="col-xl-6">
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>Phone Number&nbsp;<span class="required">*</span></label>
                                    <input type="number" class="form-control" name="mobile_number"  value="{{ old('mobile_number') }}" required placeholder="Phone Number">
                                </p>
                            </div>

                            <div class="col-xl-6" style="display: none">
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>Password&nbsp;<span class="required">*</span></label>
                                    <input type="password" class="form-control" name="password"  placeholder="Password">
                                </p>
                            </div>
                            <div class="col-xl-6" style="display: none">
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>Re-Enter Password&nbsp;<span class="required">*</span></label>
                                    <input type="password" class="form-control" name="password_confirmation"  placeholder="Re-Enter Password">
                                </p>
                            </div>
                            <div class="col-xl-6">
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>{{ __lang('academic-session-id') }}&nbsp;<span class="required">*</span></label>
                                    <select class="form-control" name="academic_session" required>
                                                        <option value="">Select Academic Session</option>
                                                        @foreach ($academicSessions as $academicSession)
                                                            <option value="{{ $academicSession->id }}">
                                                                {{ $academicSession->session_name }}</option>
                                                        @endforeach
                                                    </select>
                                </p>
                            </div>
                            <div class="col-xl-6">
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>{{ __lang('semester-id') }}&nbsp;<span class="required">*</span></label>
                                    <select name="semester" class="form-control" required>
                                                        <option value="">Select Semester</option>
                                                        @foreach ($semesters as $semester)
                                                            <option value="{{ $semester->id }}">
                                                                {{ $semester->semester_name }}</option>
                                                        @endforeach
                                                    </select>
                                </p>
                            </div>
                            
                            <div class="col-xl-12" >
                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                    <label>Course of study&nbsp;<span class="required">*</span></label>
                                    <select name="course_of_study" class="form-control" >
                                                        <option value="">Select Course Of Study</option>
                                                         @if(getCourseCategories())
                               @foreach(getCourseCategories() as $courseCategory)
                               <option value="{{ $courseCategory->id }}">
                               {{ $courseCategory->name }}</option>
                                @endforeach
                               @endif
                                    
                                                    </select>
                                </p>
                            </div>

                            <div class="col-xl-12">
                                <div class="d-flex align-items-center justify-content-between py-2">
                                    <p class="form-row">
                                        <label class="woocommerce-form__label woocommerce-form__label-for-checkbox woocommerce-form-login__policy">
                                            <input class="woocommerce-form__input woocommerce-form__input-checkbox" name="agree" type="checkbox" id="agree"required value="{{ old('agree')? 'checked':'' }}"> <a href="{{ route('terms') }}"><span>Accept the Terms and Privacy Policy</span></a>
                                        </label>
                                    </p>
            
                                    <p style="display:none;" class="woocommerce-LostPassword lost_password">
                                        <a href="#">Forgot password?</a>
                                    </p>
                               </div>
                            </div>
                        </div>
                      
                        <p class="woocommerce-FormRow form-row">
                            <button type="submit" class="woocommerce-button button" name="register" value="Register">Register</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--shop register end-->
    @else
        {{ __lang('registration-is-disabled') }}
    @endif


@include("home/footer")
