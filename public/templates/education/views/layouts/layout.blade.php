<!doctype html>
<html class="no-js" lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>@yield('page-title')</title>
    <meta name="description" content="@yield('meta-description')">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    @if (!empty(setting('image_icon')))
        <link rel="shortcut icon" type="image/x-icon" href="{{ asset(setting('image_icon')) }}">
    @endif
    <!-- CSS here -->
    <link rel="stylesheet" href="{{ tasset('assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/slicknav.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/flaticon.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/gijgo.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/animate.min.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/magnific-popup.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/fontawesome-all.min.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/themify-icons.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/slick.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/nice-select.css') }}">
    <link rel="stylesheet" href="{{ tasset('assets/css/style') }}">



    <!-- CSS here -->
    <link rel="stylesheet" href="{{ tasset('default/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/meanmenu.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/animate.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/owl-carousel.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/swiper-bundle.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/backtotop.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/magnific-popup.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/nice-select.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/font-awesome-pro.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/spacing.css') }}">
    <link rel="stylesheet" href="{{ tasset('default/css/style.css') }}">


    @yield('header')
<style>
    .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #fff;
    background-color: #006400;
}
.nav-link {
    display: block;
    padding: 0.5rem 1rem;
    color: #006400;
    text-decoration: none;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out;
}
</style>


</head>

<body>

    <!--? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    @if (!empty(setting('image_logo')))
                        <img src="{{ asset(setting('image_logo')) }}">
                    @else
                        {{ setting('general_site_name') }}
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->


    {{-- <header>
        <!-- Header Start -->
        <div class="header-area">
            <div class="main-header ">
                @if (optionActive('top-bar'))
                    <div class="header-top d-none d-lg-block">
                        <!-- Left Social -->
                        <div class="header-left-social">
                            <ul class="header-social">
                                @if (!empty(toption('top-bar', 'social_facebook')))
                                    <li><a href="{{ toption('top-bar', 'social_facebook') }}"><i
                                                class="fab fa-facebook-f"></i></a></li>
                                @endif
                                @if (!empty(toption('top-bar', 'social_twitter')))
                                    <li><a href="{{ toption('top-bar', 'social_twitter') }}"><i
                                                class="fab fa-twitter"></i></a></li>
                                @endif
                                @if (!empty(toption('top-bar', 'social_instagram')))
                                    <li><a href="{{ toption('top-bar', 'social_instagram') }}"><i
                                                class="fab fa-instagram"></i></a></li>
                                @endif
                                @if (!empty(toption('top-bar', 'social_youtube')))
                                    <li><a href="{{ toption('top-bar', 'social_youtube') }}"><i
                                                class="fab fa-youtube"></i></a></li>
                                @endif
                                @if (!empty(toption('top-bar', 'social_linkedin')))
                                    <li><a href="{{ toption('top-bar', 'social_linkedin') }}"><i
                                                class="fab fa-linkedin"></i></a></li>
                                @endif
                            </ul>
                        </div>
                        <div class="container">
                            <div class="col-xl-12">
                                <div class="row d-flex justify-content-between align-items-center">
                                    <div class="header-info-left">
                                        <ul>
                                            @if (!empty(toption('top-bar', 'email')))
                                                <li>{{ toption('top-bar', 'email') }}</li>
                                            @endif
                                            @if (!empty(toption('top-bar', 'email')))
                                                <li>{{ toption('top-bar', 'telephone') }}</li>
                                            @endif
                                        </ul>
                                    </div>
                                    <div class="header-info-right">
                                        <ul>
                                            @if (toption('top-bar', 'cart') == 1)
                                                <li><a href="{{ route('cart') }}"><i class="fa fa-cart-plus"></i>
                                                        {{ __lang('your-cart') }}@if (getCart()->getTotalItems() > 0)
                                                            ({{ getCart()->getTotalItems() }}) @endif
                                                    </a>
                                                </li>
                                            @endif
                                            @guest
                                                <li><a href="{{ route('login') }}"><i class="ti-user"></i>
                                                        @lang('default.login')</a></li>
                                                <li><a style="display:none;" href="{{ route('register') }}"><i
                                                            class="ti-lock"></i> {{ __lang('register') }}</a></li>
                                            @else
                                                <li><a href="{{ route('home') }}"><i class="fa fa-user-circle"></i>
                                                        @lang('default.my-account')</a></li>
                                                <li><a onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();"
                                                        href="{{ route('logout') }}"><i class="fa fa-sign-out-alt"></i>
                                                        {{ __lang('logout') }}</a></li>

                    @endif
                    </ul>
                </div>
            </div>
            </div>
            </div>
            </div>
            @endif

            <div class="header-bottom header-sticky">
                <!-- Logo -->
                <div class="logo d-none d-lg-block">
                    <a href="{{ url('/') }}">
                        @if (!empty(setting('image_logo')))
                            <img src="{{ asset(setting('image_logo')) }}">
                        @else
                            {{ setting('general_site_name') }}
                        @endif
                    </a>
                </div>
                <div class="container">
                    <div class="menu-wrapper">
                        <!-- Logo -->
                        <div class="logo logo2 d-block d-lg-none">
                            <a href="{{ url('/') }}">
                                @if (!empty(setting('image_logo')))
                                    <img src="{{ asset(setting('image_logo')) }}">
                                @else
                                    {{ setting('general_site_name') }}
                                @endif
                            </a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    @foreach (headerMenu() as $menu)
                                        <li>
                                            <a href="{{ $menu['url'] }}">{{ $menu['label'] }}</a>
                                            @if ($menu['children'])
                                                <ul class="submenu">
                                                    @foreach ($menu['children'] as $childMenu)
                                                        <li><a
                                                                href="{{ $childMenu['url'] }}">{{ $childMenu['label'] }}</a>
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            @endif
                                        </li>
                                    @endforeach
                                    @if (toption('top-bar', 'cart') == 1)
                                        <li class="d-md-none d-lg-none d-xl-none"><a href="{{ route('cart') }}"><i
                                                    class="fa fa-cart-plus"></i> {{ __lang('your-cart') }}@if (getCart()->getTotalItems() > 0)
                                                    ({{ getCart()->getTotalItems() }}) @endif
                                            </a></li>
                                    @endif
                                    @guest
                                        <li class="d-md-none d-lg-none d-xl-none"><a href="{{ route('login') }}"><i
                                                    class="ti-user"></i> @lang('default.login')</a></li>
                                        <li class="d-md-none d-lg-none d-xl-none"><a href="{{ route('register') }}"><i
                                                    class="ti-lock"></i> {{ __lang('register') }}</a></li>
                                    @else
                                        <li class="d-md-none d-lg-none d-xl-none"><a href="{{ route('home') }}"><i
                                                    class="fa fa-user-circle"></i> @lang('default.my-account')</a></li>
                                        <li class="d-md-none d-lg-none d-xl-none"><a
                                                onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();"
                                                href="{{ route('logout') }}"><i class="fa fa-sign-out-alt"></i>
                                                {{ __lang('logout') }}</a></li>

                                        @endif

                                    </ul>
                                </nav>
                            </div>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="int_hide  hidden">
                                @csrf
                            </form>
                            @if (toption('navigation', 'search_form') == 1)
                                <!-- Header-btn -->
                                <div class="header-search d-none d-lg-block">
                                    <form action="{{ route('courses') }}" class="form-box f-right ">
                                        <input type="text" name="filter" placeholder="{{ __lang('search-courses') }}">
                                        <div class="search-icon">
                                            <i class="fas fa-search special-tag"></i>
                                        </div>
                                    </form>
                                </div>
                            @endif

                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                <!-- Header End -->
            </header> --}}


    <!-- header area start -->
    <header>
        <div id="header-sticky" class="header__area">
            <div class="header__bottom">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xxl-8 col-xl-9 col-lg-10 col-md-6 col-6">
                            <div class="header__bottom-left d-flex align-items-center">
                                <div class="logo">
                                    <a href="{{ url('/') }}">
                                        <img src="{{ asset(setting('image_logo')) }}">
                                    </a>
                                </div>
                                <div class="main-menu main-menu-2 main-menu-border ml-30 pl-30">
                                    <nav id="mobile-menu">
                                        <ul id="navigation">
                                            @foreach (headerMenu() as $menu)
                                                <li>
                                                    <a href="{{ $menu['url'] }}">{{ $menu['label'] }}</a>
                                                    @if ($menu['children'])
                                                        <ul class="submenu">
                                                            @foreach ($menu['children'] as $childMenu)
                                                                <li><a
                                                                        href="{{ $childMenu['url'] }}">{{ $childMenu['label'] }}</a>
                                                                </li>
                                                            @endforeach
                                                        </ul>
                                                    @endif
                                                </li>
                                            @endforeach
                                            @if (toption('top-bar', 'cart') == 1)
                                                <li class="d-md-none d-lg-none d-xl-none"><a
                                                        href="{{ route('cart') }}"><i class="fa fa-cart-plus"></i>
                                                        {{ __lang('your-cart') }}@if (getCart()->getTotalItems() > 0)
                                                            ({{ getCart()->getTotalItems() }}) @endif
                                                    </a></li>
                                            @endif
                                            @guest

                                                <li class="d-md-none d-lg-none d-xl-none"><a href="{{ route('login') }}"><i
                                                            class="ti-user"></i> @lang('default.login')</a></li>
                                                <li class="d-md-none d-lg-none d-xl-none"><a
                                                        href="{{ route('register') }}"><i class="ti-lock"></i>
                                                        {{ __lang('register') }}</a></li>
                                            @else
                                                <li class="d-md-none d-lg-none d-xl-none"><a href="{{ route('home') }}"><i
                                                            class="fa fa-user-circle"></i> @lang('default.my-account')</a></li>
                                                <li class="d-md-none d-lg-none d-xl-none"><a
                                                        onclick="event.preventDefault();
                                                                         document.getElementById('logout-form').submit();"
                                                        href="{{ route('logout') }}"><i class="fa fa-sign-out-alt"></i>
                                                        {{ __lang('logout') }}</a></li>

                                                @endif

                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xxl-4 col-xl-3 col-lg-2 col-md-6 col-6">
                                {{-- <div class="header__bottom-right d-flex justify-content-end align-items-center pl-30">

                                        <div class="header__login-2 d-none d-md-flex align-items-center ml-20 pl-20">
                                            
                                            <div class="header__login-content">

                                                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="int_hide  hidden">
                                                    @csrf
                                                </form>
                                                @guest

                                                <div></div>
                                            

                                                    <li><a href="{{ route('login') }}">
                                                            @lang('default.login')</a></li>
                                                    <li><a style="display:none;" href="{{ route('register') }}"><i
                                                                class="ti-lock"></i> {{ __lang('register') }}</a></li>
                                                @else
                                                    <li><a onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();"
                                                            href="{{ route('logout') }}">
                                                            {{ __lang('logout') }}</a></li>

                                                    @endif
                                                    <p><a href="{{ route('register') }}">Register</a></p>
                                                </div>




                                            </div>



                                     
                                            <div class="header__hamburger ml-50 d-xl-none">
                                                <button type="button" data-bs-toggle="modal" data-bs-target="#offcanvasmodal"
                                                    class="hamurger-btn">
                                                    <span></span>
                                                    <span></span>
                                                    <span></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div> --}}



                                <div class="header__top-right d-flex justify-content-end align-items-center">


                                    <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                        class="int_hide  hidden">
                                        @csrf
                                    </form>
                                    @guest




                                        <div class="header__btn ml-20">
                                            <a href="{{ route('login') }}" class="header-btn">@lang('default.login')</a>
                                        </div>

                                        <div class="header__btn ml-20">
                                            <a href="{{ route('register') }}" class="header-btn">@lang('default.register')</a>
                                        </div>
                                    @else
                                    <div class="header__btn ml-20">
                                        <a onclick="event.preventDefault();
                                     document.getElementById('logout-form').submit();"
                                                href="{{ route('logout') }}">
                                                {{ __lang('logout') }}</a>
                                            
                                            </div>

                                        @endif

                                    </div>






                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- header area end -->

            <!-- offcanvas area start -->
            <div class="offcanvas__area">
                <div class="modal fade" id="offcanvasmodal" tabindex="-1" aria-labelledby="offcanvasmodal"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="offcanvas__wrapper">
                                <div class="offcanvas__content">
                                    <div class="offcanvas__top mb-40 d-flex justify-content-between align-items-center">
                                        <div class="offcanvas__logo logo">
                                            <a href="index.html">
                                                <img src="default/img/logo/logo-2.png" alt="logo">
                                            </a>
                                        </div>
                                        <div class="offcanvas__close">
                                            <button class="offcanvas__close-btn" data-bs-toggle="modal"
                                                data-bs-target="#offcanvasmodal">
                                                <i class="fal fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="offcanvas__search mb-25">
                                        <form action="#">
                                            <input type="text" placeholder="What are you searching for?">
                                            <button type="submit"><i class="far fa-search"></i></button>
                                        </form>
                                    </div>
                                    <div class="mobile-menu fix"></div>
                                    <div class="offcanvas__text d-none d-lg-block">
                                        <p>But I must explain to you how all this mistaken idea of denouncing pleasure and
                                            praising pain was born and will give you a complete account of the system and
                                            expound the actual teachings of the great explore</p>
                                    </div>
                                    <div class="offcanvas__map d-none d-lg-block mb-15">
                                        <iframe
                                            src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d29176.030811137334!2d90.3883827!3d23.924917699999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1605272373598!5m2!1sen!2sbd"></iframe>
                                    </div>
                                    <div class="offcanvas__contact mt-30 mb-20">
                                        <h4>Contact Info</h4>
                                        <ul>
                                            <li class="d-flex align-items-center">
                                                <div class="offcanvas__contact-icon mr-15">
                                                    <i class="fal fa-map-marker-alt"></i>
                                                </div>
                                                <div class="offcanvas__contact-text">
                                                    <a target="_blank" href="">Bill Clinton Dr, 900106, Abuja</a>
                                                </div>
                                            </li>
                                            <li class="d-flex align-items-center">
                                                <div class="offcanvas__contact-icon mr-15">
                                                    <i class="far fa-phone"></i>
                                                </div>
                                                <div class="offcanvas__contact-text">
                                                    <a href="mailto:support@gmail.com">(+234) 123-456</a>
                                                </div>
                                            </li>
                                            <li class="d-flex align-items-center">
                                                <div class="offcanvas__contact-icon mr-15">
                                                    <i class="fal fa-envelope"></i>
                                                </div>
                                                <div class="offcanvas__contact-text">
                                                    <a href="tel:+012-345-6789">info@nimet.gov.ng</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="offcanvas__social">
                                        <ul>
                                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                                            <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- offcanvas area end -->
            <div class="body-overlay"></div>
            <!-- offcanvas area end -->



            <main>


                @hasSection('inline-title')
                    <!-- slider Area Start-->
                    <div class="slider-area ">
                        <!-- Mobile Menu -->
                        <div class="single-slider slider-height2 d-flex align-items-center"
                            @if (!empty(toption('page-title', 'image'))) data-background="{{ asset(toption('page-title', 'image')) }}"
                 @elseif(empty(toption('page-title', 'bg_color')))
                 data-background="{{ tasset('assets/img/hero/contact_hero.jpg') }}" @endif>
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="hero-cap text-center">
                                            <h2>@yield('inline-title')</h2>
                                            @hasSection('crumb')
                                                <p class="crumb">
                                                    <span><a href="@route('homepage')">@lang('default.home')</a></span>
                                                    <span>/</span>
                                                    @yield('crumb')
                                                </p>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- slider Area End-->
                @endif

                @include('partials.flash_message')
                @yield('content')

            </main>
            <!-- footer area start -->
            <footer>
                <div class="footer__area">
                    <div class="footer__top grey-bg-4 pt-95 pb-45">
                        <div class="container">
                            <div class="row">
                                <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-7">
                                    <div class="footer__widget footer__widget-3 footer-col-3-1 mb-50">
                                        <div class="footer__logo">
                                            <div class="logo">
                                                <a href="{{ url('/') }}">
                                                    <img src="{{ asset(setting('image_logo')) }}">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="footer__widget-content">
                                            <div class="footer__widget-info">
                                                <div class="footer__subscribe footer__subscribe-3">
                                                    <p>Educal University does not discriminate on the basis of race, nationa.
                                                    </p>
                                                    <form action="#">
                                                        <div class="footer__subscribe-input">
                                                            <input type="text" placeholder="Email">
                                                            <button type="submit" class="tp-btn-subscribe">Subscribe</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-2 col-xl-2 col-lg-2 col-md-3 col-sm-5">
                                    <div class="footer__widget footer__widget-3 footer-col-3-2 mb-50">
                                        <h3 class="footer__widget-title footer__widget-title-3">Explore</h3>
                                        <div class="footer__widget-content">
                                            <ul>
                                                <li>
                                                    <a href="#">About us</a>
                                                </li>
                                                <li>
                                                    <a href="#">Courses</a>
                                                </li>

                                                <li>
                                                    <a href="#">Instructor</a>
                                                </li>
                                                <li>
                                                    <a href="#">Events</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-xl-2 col-lg-2 col-md-3 col-sm-5">
                                    <div class="footer__widget footer__widget-3 footer-col-3-3 mb-50">
                                        <h3 class="footer__widget-title footer__widget-title-3">Links</h3>
                                        <div class="footer__widget-content">
                                            <ul>
                                                <li>
                                                    <a href="#">Partners</a>
                                                </li>
                                                <li>
                                                    <a href="#">Support the canpaing</a>
                                                </li>
                                                <li>
                                                    <a href="#">News & Blogs</a>
                                                </li>
                                                <li>
                                                    <a href="#">Library</a>
                                                </li>
                                                <li>
                                                    <a href="#">Contact us</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-6 col-sm-7">
                                    <div class="footer__widget footer__widget-3 footer-col-3-4 mb-50">
                                        <h3 class="footer__widget-title footer__widget-title-3">Information</h3>

                                        <div class="footer__contact">
                                            <ul>
                                                <li>
                                                    <p> Offices:</p>
                                                    <h4><a href="https://www.google.com/search?q=nimet+abuja&rlz=1C1CHBD_enNG1004NG1004&oq=ni&aqs=chrome.0.69i59j69i57j69i59l2j69i60l4.1346j0j1&sourceid=chrome&ie=UTF-8#"
                                                            target="_blank">Bill Clinton Drive, Abuja</a></h4>
                                                </li>
                                                <li>
                                                    <p>International:</p>
                                                    <h4><a href="tel: ">+(234) 123-456</a></h4>
                                                </li>
                                                <li>
                                                    <p>International:</p>
                                                    <h4><a href="mailto:info@nimet.gov.ng">info@nimet.gov.ng</a></h4>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer__bottom grey-bg-4">
                        <div class="container">
                            <div class="footer__bottom-inner">
                                <div class="row">
                                    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6">
                                        <div class="footer__bottom-link">
                                            <ul>
                                                <li><a href="#">Disclaimer & Copyright</a></li>
                                                <li><a href="#">Accessibility</a></li>
                                                <li><a href="#">Privacy</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6">
                                        <div class="footer__social footer__social-3 text-md-end">
                                            <ul>
                                                <li><a href="#"><i class="fa-brands fa-facebook-f"></i></a></li>
                                                <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa-brands fa-linkedin-in"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- footer area end -->


            <!-- Scroll Up -->
            <div id="back-top">
                <a title="{{ __t('go-to-top') }}" href="#"> <i class="fas fa-level-up-alt"></i></a>
            </div>

            <!-- NEW DEFAULT JS here -->
            <script src="{{ tasset('default/js/vendor/jquery.js') }}"></script>
            <script src="{{ tasset('default/js/vendor/waypoints.js') }}"></script>
            <script src="{{ tasset('default/js/bootstrap-bundle.js') }}"></script>
            <script src="{{ tasset('default/js/meanmenu.js') }}"></script>
            <script src="{{ tasset('default/js/swiper-bundle.js') }}"></script>
            <script src="{{ tasset('default/js/owl-carousel.js') }}"></script>
            <script src="{{ tasset('default/js/magnific-popup.js') }}"></script>
            <script src="{{ tasset('default/js/parallax.js') }}"></script>
            <script src="{{ tasset('default/js/backtotop.js') }}"></script>
            <script src="{{ tasset('default/js/nice-select.js') }}"></script>
            <script src="{{ tasset('default/js/counterup.js') }}"></script>
            <script src="{{ tasset('default/js/wow.js') }}"></script>
            <script src="{{ tasset('default/js/isotope-pkgd.js') }}"></script>
            <script src="{{ tasset('default/js/imagesloaded-pkgd.js') }}"></script>
            <script src="{{ tasset('default/js/ajax-form.js') }}"></script>
            <script src="{{ tasset('default/js/main.js') }}"></script>




            <!-- JS here -->

            <script src="{{ tasset('assets/js/vendor/modernizr-3.5.0.min.js') }}"></script>
            <!-- Jquery, Popper, Bootstrap -->
            <script src="{{ tasset('assets/js/vendor/jquery-1.12.4.min.js') }}"></script>
            <script src="{{ tasset('assets/js/popper.min.js') }}"></script>
            <script src="{{ tasset('assets/js/bootstrap.min.js') }}"></script>
            <!-- Jquery Mobile Menu -->
            <script src="{{ tasset('assets/js/jquery.slicknav.min.js') }}"></script>

            <!-- Jquery Slick , Owl-Carousel Plugins -->
            <script src="{{ tasset('assets/js/owl.carousel.min.js') }}"></script>
            <script src="{{ tasset('assets/js/slick.min.js') }}"></script>
            <!-- One Page, Animated-HeadLin -->
            <script src="{{ tasset('assets/js/wow.min.js') }}"></script>
            <script src="{{ tasset('assets/js/animated.headline.js') }}"></script>
            <script src="{{ tasset('assets/js/jquery.magnific-popup.js') }}"></script>

            <!-- Date Picker -->
            <script src="{{ tasset('assets/js/gijgo.min.js') }}"></script>
            <!-- Nice-select, sticky -->
            <script src="{{ tasset('assets/js/jquery.nice-select.min.js') }}"></script>
            <script src="{{ tasset('assets/js/jquery.sticky.js') }}"></script>

            <!-- counter , waypoint -->
            <script src="{{ tasset('assets/js/jquery.counterup.min.js') }}"></script>
            <script src="{{ tasset('assets/js/waypoints.min.js') }}"></script>

            <!-- contact js -->
            <script src="{{ tasset('assets/js/contact.js') }}"></script>
            <script src="{{ tasset('assets/js/jquery.form.js') }}"></script>
            <script src="{{ tasset('assets/js/jquery.validate.min.js') }}"></script>
            <script src="{{ tasset('assets/js/mail-script.js') }}"></script>
            <script src="{{ tasset('assets/js/jquery.ajaxchimp.min.js') }}"></script>

            <!-- Jquery Plugins, main Jquery -->
            <script src="{{ tasset('assets/js/plugins.js') }}"></script>
            <script src="{{ tasset('assets/js/main.js') }}"></script>

            @yield('footer')
            {!! setting('general_footer_scripts') !!}

        </body>


        </html>
