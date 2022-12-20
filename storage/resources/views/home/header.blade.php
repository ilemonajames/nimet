<!DOCTYPE html>
<html lang="zxx">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Edumel- Education Html Template by dreambuzz">
  <meta name="keywords" content="education,edumel,instructor,lms,online,instructor,dreambuzz,bootstrap,kindergarten,tutor,e learning">
  <meta name="author" content="dreambuzz">

  <title>NIMET - Online learning portal</title>

  <!-- Mobile Specific Meta-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="{{ asset('assets/vendors/bootstrap/bootstrap.css') }}">
  <!-- Iconfont Css -->
  <link rel="stylesheet" href="{{ asset('assets/vendors/awesome/css/fontawesome-all.min.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/vendors/flaticon/flaticon.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/fonts/gilroy/font-gilroy.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/vendors/magnific-popup/magnific-popup.css') }}">
  <!-- animate.css -->
  <link rel="stylesheet" href="{{ asset('assets/vendors/animate-css/animate.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/vendors/animated-headline/animated-headline.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/vendors/owl/assets/owl.carousel.min.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/vendors/owl/assets/owl.theme.default.min.css') }}">


  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="{{ asset('assets/css/woocomerce.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/style.css?v1.0.1') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/responsive.css') }}">
<style>
    .none{
        display: none;
    }
    .carousel {
     position: relative;
}
 .carousel-inner {
     position: relative;
     width: 100%;
     overflow: hidden;
}
 .carousel-inner > .item {
     position: relative;
     display: none;
     -webkit-transition: .6s ease-in-out left;
     -o-transition: .6s ease-in-out left;
     transition: .6s ease-in-out left;
}
 .carousel-inner > .item > img, .carousel-inner > .item > a > img {
     line-height: 1;
}
 @media all and (transform-3d), (-webkit-transform-3d) {
     .carousel-inner > .item {
         -webkit-transition: -webkit-transform .6s ease-in-out;
         -o-transition: -o-transform .6s ease-in-out;
         transition: transform .6s ease-in-out;
         -webkit-backface-visibility: hidden;
         backface-visibility: hidden;
         -webkit-perspective: 1000px;
         perspective: 1000px;
    }
     .carousel-inner > .item.next, .carousel-inner > .item.active.right {
         left: 0;
         -webkit-transform: translate3d(100%, 0, 0);
         transform: translate3d(100%, 0, 0);
    }
     .carousel-inner > .item.prev, .carousel-inner > .item.active.left {
         left: 0;
         -webkit-transform: translate3d(-100%, 0, 0);
         transform: translate3d(-100%, 0, 0);
    }
     .carousel-inner > .item.next.left, .carousel-inner > .item.prev.right, .carousel-inner > .item.active {
         left: 0;
         -webkit-transform: translate3d(0, 0, 0);
         transform: translate3d(0, 0, 0);
    }
}
 .carousel-inner > .active, .carousel-inner > .next, .carousel-inner > .prev {
     display: block;
}
 .carousel-inner > .active {
     left: 0;
}
 .carousel-inner > .next, .carousel-inner > .prev {
     position: absolute;
     top: 0;
     width: 100%;
}
 .carousel-inner > .next {
     left: 100%;
}
 .carousel-inner > .prev {
     left: -100%;
}
 .carousel-inner > .next.left, .carousel-inner > .prev.right {
     left: 0;
}
 .carousel-inner > .active.left {
     left: -100%;
}
 .carousel-inner > .active.right {
     left: 100%;
}
 .carousel-control {
     position: absolute;
     top: 0;
     bottom: 0;
     left: 0;
     width: 15%;
     font-size: 20px;
     color: #fff;
     text-align: center;
     text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
     background-color: rgba(0, 0, 0, 0);
     filter: alpha(opacity=50);
     opacity: .5;
}
 .carousel-control.left {
     background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .5) 0%, rgba(0, 0, 0, .0001) 100%);
     background-image: -o-linear-gradient(left, rgba(0, 0, 0, .5) 0%, rgba(0, 0, 0, .0001) 100%);
     background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .5)), to(rgba(0, 0, 0, .0001)));
     background-image: linear-gradient(to right, rgba(0, 0, 0, .5) 0%, rgba(0, 0, 0, .0001) 100%);
     filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
     background-repeat: repeat-x;
}
 .carousel-control.right {
     right: 0;
     left: auto;
     background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, .5) 100%);
     background-image: -o-linear-gradient(left, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, .5) 100%);
     background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .0001)), to(rgba(0, 0, 0, .5)));
     background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, .5) 100%);
     filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
     background-repeat: repeat-x;
}
 .carousel-control:hover, .carousel-control:focus {
     color: #fff;
     text-decoration: none;
     filter: alpha(opacity=90);
     outline: 0;
     opacity: .9;
}
 .carousel-control .icon-prev, .carousel-control .icon-next, .carousel-control .glyphicon-chevron-left, .carousel-control .glyphicon-chevron-right {
     position: absolute;
     top: 50%;
     z-index: 5;
     display: inline-block;
     margin-top: -10px;
}
 .carousel-control .icon-prev, .carousel-control .glyphicon-chevron-left {
     left: 50%;
     margin-left: -10px;
}
 .carousel-control .icon-next, .carousel-control .glyphicon-chevron-right {
     right: 50%;
     margin-right: -10px;
}
 .carousel-control .icon-prev, .carousel-control .icon-next {
     width: 20px;
     height: 20px;
     font-family: serif;
     line-height: 1;
}
 .carousel-control .icon-prev:before {
     content: '\2039';
}
 .carousel-control .icon-next:before {
     content: '\203a';
}
 .carousel-indicators {
     position: absolute;
     bottom: 10px;
     left: 50%;
     z-index: 15;
     width: 60%;
     padding-left: 0;
     margin-left: -30%;
     text-align: center;
     list-style: none;
}
 .carousel-indicators li {
     display: inline-block;
     width: 10px;
     height: 10px;
     margin: 1px;
     text-indent: -999px;
     cursor: pointer;
     background-color: #000 \9;
     background-color: rgba(0, 0, 0, 0);
     border: 1px solid #fff;
     border-radius: 10px;
}
 .carousel-indicators .active {
     width: 12px;
     height: 12px;
     margin: 0;
     background-color: #fff;
}
 .carousel-caption {
     position: absolute;
     right: 15%;
     top: 22%;
     left: 15%;
     z-index: 10;
     padding-top: 20px;
     padding-bottom: 20px;
     color: #fff;
     text-align: center;
}
 .carousel-caption .btn {
     text-shadow: none;
}
 @media screen and (min-width: 768px) {
     .carousel-control .glyphicon-chevron-left, .carousel-control .glyphicon-chevron-right, .carousel-control .icon-prev, .carousel-control .icon-next {
         width: 30px;
         height: 30px;
         margin-top: -10px;
         font-size: 30px;
    }
     .carousel-control .glyphicon-chevron-left, .carousel-control .icon-prev {
         margin-left: -10px;
    }
     .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next {
         margin-right: -10px;
    }
     .carousel-caption {
         right: 20%;
         left: 20%;
         padding-bottom: 30px;
    }
     .carousel-indicators {
         bottom: 20px;
    }
}
 .clearfix:before, .clearfix:after, .dl-horizontal dd:before, .dl-horizontal dd:after, .container:before, .container:after, .container-fluid:before, .container-fluid:after, .row:before, .row:after, .form-horizontal .form-group:before, .form-horizontal .form-group:after, .btn-toolbar:before, .btn-toolbar:after, .btn-group-vertical > .btn-group:before, .btn-group-vertical > .btn-group:after, .nav:before, .nav:after, .navbar:before, .navbar:after, .navbar-header:before, .navbar-header:after, .navbar-collapse:before, .navbar-collapse:after, .pager:before, .pager:after, .panel-body:before, .panel-body:after, .modal-header:before, .modal-header:after, .modal-footer:before, .modal-footer:after {
     display: table;
     content: " ";
}
 .clearfix:after, .dl-horizontal dd:after, .container:after, .container-fluid:after, .row:after, .form-horizontal .form-group:after, .btn-toolbar:after, .btn-group-vertical > .btn-group:after, .nav:after, .navbar:after, .navbar-header:after, .navbar-collapse:after, .pager:after, .panel-body:after, .modal-header:after, .modal-footer:after {
     clear: both;
}
 .center-block {
     display: block;
     margin-right: auto;
     margin-left: auto;
}
 .pull-right {
     float: right !important;
}
 .pull-left {
     float: left !important;
}
 .hide {
     display: none !important;
}
 .show {
     display: block !important;
}
 .invisible {
     visibility: hidden;
}
 .text-hide {
     font: 0/0 a;
     color: transparent;
     text-shadow: none;
     background-color: transparent;
     border: 0;
}
 .hidden {
     display: none !important;
}
</style>

<link href="{{ asset('css/style.css') }}" rel="stylesheet" />
<!-- RESPONSIVE.CSS ONLY FOR MOBILE AND TABLET VIEWS -->
<link href="{{ asset('css/style-mob.css') }}" rel="stylesheet" />
</head>

<body id="top-header">



<header class="header-style-1"> 
    <div class="header-topbar topbar-style-2">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-xl-7 col-lg-6 col-md-12">
                   <div class="header-contact text-center text-lg-start d-none d-sm-block">
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <span class="text-color me-2"><i class="fa fa-phone-alt"></i></span><a href="tel:+(354) 6800 37849"> +234 813 430 5556</a>
                            </li>

                            <li class="list-inline-item">
                                <span class="text-color me-2"><i class="fa fa-envelope"></i></span><a href="malito:hello@piratech.com"> info@nimet.gov.ng</a>
                            </li>
                        </ul>
                   </div>
                </div>

                <div class="col-xl-5 col-lg-6 col-md-12">
                   <div class="d-sm-flex justify-content-center justify-content-lg-end">
                        <div class="header-socials text-center text-lg-end">
                            <ul class="list-inline">
                                <li class="list-inline-item"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li class="list-inline-item"><a href="#"><i class="fab fa-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                <li class="list-inline-item"><a href="#"><i class="fab fa-pinterest"></i></a></li>
                                <li class="list-inline-item"><a href="#"><i class="fab fa-youtube"></i></a></li>
                            </ul>
                        </div>

                        <div class="header-btn text-center text-lg-end">
                           <a href="{{ route('login') }}"> <i class="fa fa-user-alt"></i> Login</a>
                        </div>
                        <div class="header-btn text-center text-lg-end">
                           <a href="{{ route('register') }}"> <i class="fa fa-user-alt"></i> Register</a>
                        </div>
                   </div>
                </div>
            </div>
        </div>
    </div>

    <div class="header-navbar navbar-sticky">
        <div class="container">
            <div class="d-flex align-items-center justify-content-between">
                <div class="site-logo">
                    <a href="{{ url('/') }}">
                        <img src="{{ url('/assets/images/logo.png') }}" alt="" class="img-fluid" />
                    </a>
                </div>

                <div class="offcanvas-icon d-block d-lg-none">
                    <a href="#" class="nav-toggler"><i class="fal fa-bars"></i></a> 
                </div>

                <div class="header-category-menu d-none d-xl-block">
                    <ul>
                        <li class="has-submenu">
                            <a href="#"><i class="fa fa-th me-2"></i>Categories</a>
                            <ul class="submenu">
                               @if(getCourseCategories())
                               @foreach(getCourseCategories() as $courseCategory)
                               <li><a href="#">{{ $courseCategory->name }}</a></li>
                               @endforeach
                               @endif
                                
                            </ul>
                        </li>
                    </ul>
                </div>

                
        
                <nav class="site-navbar ms-auto">

                    <ul class="primary-menu">
                        <li class="current">
                            <a href="{{ url('/') }}">Home</a>
                            
                        </li>
                        <li><a href="{{ url('/about') }}">About</a></li>

                        <li>
                            <a href="{{ url('/courses') }}">Courses</a>
                            
                        </li>
                        <li>
                            <a href="{{ url('/our-instructors') }}">Instructors</a>
                            
                        </li>

                        <li>
                            <a href="{{ url('/faq') }}">Faq</a>
                            
                        </li>
                        

                        <li style="display: none;">
                            <a href="/blog">Blog</a>
                            
                        </li>
                        <li>
                            <a href="{{ url('/contact') }}">Contact</a>
                        </li>
                    </ul>

                    <a href="#" class="nav-close"><i class="fal fa-times"></i></a>
                </nav>
            </div>
        </div>
    </div>
</header>