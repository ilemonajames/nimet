@include("home/header")

@if ($enableRegistration)
       
   <section class="page-wrapper woocommerce single">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-xl-5">
                <div class="woocommerce-notices-wrapper"></div>
                <div class="login-form">
                    <div class="form-header">
                        <img src="assets/images/logo.png" alt="NIMET" style="height: 50px;" class="img-fluid" />
                        <h2 class="font-weight-bold mb-3">Login</h2>
    
                        <p class="woocommerce-register">
                            Don't have an account yet? <a href="{{ route('register') }}" class="text-decoration-underline">Sign Up for Free</a>
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
                    </div>
                    <form class="woocommerce-form woocommerce-form-login login" method="POST" action="{{ route('login') }}">
                        @csrf
                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                            <label for="username">Email Address&nbsp;<span class="required">*</span></label>
                            <input type="email" class="woocommerce-Input woocommerce-Input--text input-text form-control login-email @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}"   required autofocus id="email" autocomplete="email" placeholder="Email Address">
                        <div class="invalid-feedback">
                                {{ __lang('email-required') }}
                            </div>
                            @error('email')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </p>
                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                            <label for="password">Password&nbsp;<span class="required">*</span></label>
                            <input class="woocommerce-Input woocommerce-Input--text input-text form-control login-password @error('password') is-invalid @enderror" type="password" name="password" id="password" required autocomplete="current-password" placeholder="Password">
                       <div class="invalid-feedback">
                                {{ __lang('fill-password') }}
                            </div>
                            @error('password')
                            <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                        </span>
                            @enderror
                        </p>
                       
                       <div class="d-flex align-items-center justify-content-between py-2">
                            <p class="form-row">
                                <label class="woocommerce-form__label woocommerce-form__label-for-checkbox woocommerce-form-login__rememberme">
                                    <input class="woocommerce-form__input woocommerce-form__input-checkbox" name="remember" type="checkbox" id="rememberme" value="{{ old('remember') ? 'checked' : '' }}"> <span>Remember me</span>
                                </label>
                            </p>
    
                            <p style="display:none;" class="woocommerce-LostPassword lost_password">
                                <a href="#">Forgot password?</a>
                            </p>
                       </div>
    
                       <p class="form-row">
                            <input type="hidden" id="woocommerce-login-nonce" name="woocommerce-login-nonce" value="a414dce984"><input type="hidden" name="_wp_http_referer" value="/my-account/">
                            <button type="submit" class="woocommerce-button button woocommerce-form-login__submit" name="login" value="Log in">Log in</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

 @else
        {{ __lang('registration-is-disabled') }}
    @endif


@include("home/footer")

