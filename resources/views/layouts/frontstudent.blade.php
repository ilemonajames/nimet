<!DOCTYPE html>
<html {!!  langMeta() !!}>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>@yield('pageTitle',isset($pageTitle)? $pageTitle:__('default.my-account')) - {{ setting('general_site_name') }}</title>

    @if(!empty(setting('image_icon')))
        <link rel="shortcut icon" type="image/x-icon" href="{{ asset(setting('image_icon')) }}">
    @endif

    <!-- General CSS Files -->
    <link rel="stylesheet" href="{{ asset('client/themes/admin/assets/modules/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('client/themes/admin/assets/modules/fontawesome/css/all.min.css') }}">

    <!-- CSS Libraries -->

    <!-- Template CSS -->
    <link rel="stylesheet" href="{{ asset('client/themes/admin/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('client/themes/admin/assets/css/components.css') }}">
    <link rel="stylesheet" href="{{ asset('client/themes/admin/assets/css/custom.css') }}">

    <link rel="stylesheet" href="{{ asset('client/css/admin.css') }}">
    <link href="{{ asset('client/vendor/select2/css/select2.min.css') }}" rel="stylesheet" />
    {!! setting('general_header_scripts') !!}
    @yield('header')

    <style>
        .navbar-bg{
            background-color: #006400;
        }
        .btn-primary,.btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open>.dropdown-toggle.btn-primary{
            background-color: #a9cf45 !important;
            border-color: #a9cf45 !important;
        }
        .list-group-item.active {
    background-color: #006400;
}
a,a:hover,a:active {
    color: #006400;
}
    </style>
</head>

<body class="layout-3">
<div id="app">
    <div class="main-wrapper container">
        <div class="navbar-bg"></div>
        <nav class="navbar navbar-expand-lg main-navbar">
            <a href="{{ url('/') }}" class="navbar-brand sidebar-gone-hide">{{ limitLength(setting('general_site_name'),17) }}</a>
            <a href="#" class="nav-link sidebar-gone-show" data-toggle="sidebar"><i class="fas fa-bars"></i></a>
            <div class="nav-collapse">
                <a class="sidebar-gone-show nav-collapse-toggle nav-link" href="#">
                    <i class="fas fa-ellipsis-v"></i>
                </a>
                <ul class="navbar-nav">
                    <li class="nav-item active"><a href="{{ url('/') }}" class="nav-link">{{ __lang('home') }}</a></li>
                    @if(setting('menu_show_courses')==1)
                    <li class="nav-item"><a href="{{ route('courses') }}" class="nav-link">{{ __lang('online-courses') }}</a></li>
                    @endif
                    @if(setting('menu_show_sessions')==1)
                    <li class="nav-item"><a href="{{ route('sessions') }}" class="nav-link">{{ __lang('upcoming-sessions') }}</a></li>
                    @endif
                </ul>
            </div>
            <form class="form-inline ml-auto" action="{{ route('courses') }}">
                <ul class="navbar-nav">
                    <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
                </ul>
                <div class="search-element">
                    <input name="filter" class="form-control" type="search" placeholder="{{ __lang('search-courses') }}" aria-label="Search" data-width="250">
                    <button class="btn" type="submit"><i class="fas fa-search"></i></button>

                </div>
            </form>

            
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <section class="section">
                @section('title-crumb')
                <div class="section-header">
                    @hasSection('innerTitle')
                        <h1>@yield('innerTitle')</h1>
                    @endif
                    {{-- <div class="section-header-breadcrumb">
                        @yield('breadcrumb')
                    </div> --}}
                </div>
                @show

                <div class="section-body">
                    @if (count($errors) > 0)
                        <div class="alert alert-danger alert-dismissible show fade">
                            <div class="alert-body">
                                <button class="close" data-dismiss="alert">
                                    <span>&times;</span>
                                </button>
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    @endif


                    @foreach (['danger', 'warning', 'success', 'info'] as $msg)
                        @if(Session::has('alert-' . $msg))

                            <div class="alert alert-{{ $msg }} alert-dismissible show fade">
                                <div class="alert-body">
                                    <button class="close" data-dismiss="alert">
                                        <span>&times;</span>
                                    </button>
                                    {!! clean(Session::get('alert-' . $msg)) !!}
                                </div>
                            </div>
                        @endif
                    @endforeach
                    @if(Session::has('flash_message'))
                        <div class="alert alert-success alert-dismissible show fade">
                            <div class="alert-body">
                                <button class="close" data-dismiss="alert">
                                    <span>&times;</span>
                                </button>
                                {!! clean(Session::get('flash_message')) !!}
                            </div>
                        </div>
                    @endif

                    @if(isset($flash_message))
                        <div class="alert alert-success alert-dismissible show fade">
                            <div class="alert-body">
                                <button class="close" data-dismiss="alert">
                                    <span>&times;</span>
                                </button>
                                {!! clean($flash_message) !!}
                            </div>
                        </div>
                    @endif
                    @yield('content')
                </div>
            </section>
        </div>
        <footer class="main-footer">
            <div class="footer-left">
                {{ __lang('copyright') }} &copy; {{ date('Y') }}  {{ setting('general_site_name') }}
            </div>
            <div class="footer-right">

            </div>
        </footer>
    </div>
</div>
<div class="modal fade" id="generalModal" tabindex="-1" role="dialog"  >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="generalModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"  id="genmodalinfo">
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="generalLargeModal" tabindex="-1" role="dialog"  >
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="generalLargeModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"  id="genLargemodalinfo">
            </div>

        </div>
    </div>
</div>

<!-- END SIMPLE MODAL MARKUP -->
<script>
    function openModal(title,url){
        $('#genmodalinfo').html(' <img  src="{{ asset('img/ajax-loader.gif')  }}');
        $('#generalModalLabel').text(title);
        $('#genmodalinfo').load(url);
        $('#generalModal').modal();
    }
    function openLargeModal(title,url){
        $('#genLargemodalinfo').html(' <img  src="{{ asset('img/ajax-loader.gif')  }}');
        $('#generalLargeModalLabel').text(title);
        $('#genLargemodalinfo').load(url);
        $('#generalLargeModal').modal();
    }
    function openPopup(url){
        window.open(url, "_blank", "toolbar=no,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
        return false;
    }
</script>

<!-- General JS Scripts -->
<script src="{{ asset('client/themes/admin/assets/modules/jquery.min.js') }}"></script>
<script src="{{ asset('client/themes/admin/assets/modules/popper.js') }}"></script>
<script src="{{ asset('client/themes/admin/assets/modules/tooltip.js') }}"></script>
<script src="{{ asset('client/themes/admin/assets/modules/bootstrap/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('client/themes/admin/assets/modules/nicescroll/jquery.nicescroll.min.js') }}"></script>
<script src="{{ asset('client/themes/admin/assets/modules/moment.min.js') }}"></script>
<script src="{{ asset('client/themes/admin/assets/js/stisla.js') }}"></script>

<!-- JS Libraies -->

<!-- Page Specific JS File -->

<!-- Template JS File -->
<script src="{{ asset('client/themes/admin/assets/js/scripts.js') }}"></script>
<script src="{{ asset('client/themes/admin/assets/js/custom.js') }}"></script>
<script src="{{ asset('client/vendor/select2/js/select2.min.js') }}"></script>

<script src="{{ asset('client/app/lib.js') }}"></script>
{!! setting('general_foot_scripts') !!}
@yield('footer')
</body>
</html>
