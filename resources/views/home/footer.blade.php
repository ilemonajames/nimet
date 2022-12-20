<!-- Footer section start -->
<section class="footer footer-3 pt-250" >
	<div class="footer-mid">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-sm-8 me-auto">
					<div class="widget footer-widget mb-5 mb-lg-0">
						<div class="footer-logo">
							<img src="assets/images/logo.png" alt="" class="img-fluid">
						</div>
						
						<p class="mt-4">NIMET is an online learning website in Nigeria</p>

						<div class="footer-socials mt-5">
							<span class="me-2">Connect :</span>
							<a href="#"><i class="fab fa-facebook-f"></i></a>
							<a href="#"><i class="fab fa-twitter"></i></a>
							<a href="#"><i class="fab fa-linkedin-in"></i></a>
							<a href="#"><i class="fab fa-pinterest"></i></a>
						</div>
					</div>
				</div>

				<div class="col-xl-2 col-sm-4">
					<div class="footer-widget mb-5 mb-lg-0">
						<h5 class="widget-title">Explore</h5>
						<ul class="list-unstyled footer-links">
							<li><a href="{{ url('/about') }}">About us</a></li>
							<li><a href="{{ url('/courses') }}">Courses</a></li>
							<li><a href="{{ url('/our-instructors') }}">Instructors</a></li>
							<li><a href="{{ url('/faq') }}">Faq</a></li>
						</ul>
					</div>
				</div>

				<div class="col-xl-2 col-sm-4" style="display:none;">
					<div class="footer-widget mb-5 mb-lg-0">
						<h5 class="widget-title ">Programs</h5>
						<ul class="list-unstyled footer-links">
							<li><a href="#">SEO Business</a></li>
							<li><a href="#">Digital Marketing</a></li>
							<li><a href="#">Graphic Design</a></li>
							<li><a href="#">Social Marketing</a></li>
						</ul>
					</div>
				</div>

				<div class="col-xl-2 col-sm-4">
					<div class="footer-widget mb-5 mb-lg-0">
						<h5 class="widget-title">Links</h5>
						<ul class="list-unstyled footer-links">
							<li><a href="{{ route('register') }}">Apply For Admission</a></li>
							<li><a href="{{ route('login') }}">Log In</a></li>
							<li><a href="{{ url('/contact') }}">Contact</a></li>
						</ul>
					</div>
				</div>

				<div class="col-xl-2 col-sm-4">
					<div class="footer-widget mb-5 mb-lg-0">
						<h5 class="widget-title">Address</h5>
						<ul class="list-unstyled footer-links">
							<li><a href="#">+234 813 430 5556</a></li>
							<li><a href="#">support@nimet.gov.ng</a></li>
							<li><a href="#">Abuja, Nigeria</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer-btm">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-xl-6 col-sm-12 col-lg-6">
					<p class="mb-0 copyright text-sm-center text-lg-start">© 2022 NIMET All rights reserved. </p>
				</div>

				<div class="col-xl-6 col-sm-12 col-lg-6" style="display: none;">
					<div class="footer-btm-links text-start text-sm-center text-lg-end">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="#"> Terms of Service</a></li>
							<li class="list-inline-item"><a href="#">Join Us</a></li>
							<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="fixed-btm-top">
		<a href="#top-header" class="js-scroll-trigger scroll-to-top"><i class="fa fa-angle-up"></i></a>
	</div>
	
</section>
<!-- Footer section End -->





    <!-- 
    Essential Scripts
    =====================================-->
    
    <!-- Main jQuery -->
    <script src="{{ asset('assets/vendors/jquery/jquery.js') }}"></script>
    <!-- Bootstrap 5:0 -->
    <script src="{{ asset('assets/vendors/bootstrap/popper.min.js') }}"></script>
	<script src="{{ asset('js/main.min.js') }}"></script>
	<script src="{{ asset('js/bootstrap.min.js') }}"></script>
   {{--  <script src="{{ asset('assets/vendors/bootstrap/bootstrap.js') }}"></script> --}}
	<script src="{{ asset('js/custom.js') }}"></script>
    <!-- Counterup -->
    <script src="{{ asset('assets/vendors/counterup/waypoint.js') }}"></script>
    <script src="{{ asset('assets/vendors/counterup/jquery.counterup.min.js') }}"></script>
    <!--  Owl Carousel -->
    <script src="{{ asset('assets/vendors/owl/owl.carousel.min.js') }}"></script>
    <!-- Isotope -->
    <script src="{{ asset('assets/vendors/isotope/jquery.isotope.js') }}"></script>
    <script src="{{ asset('assets/vendors/isotope/imagelaoded.min.js') }}"></script>
    <!-- Animated Headline -->
    <script src="{{ asset('assets/vendors/animated-headline/animated-headline.js') }}"></script>
    <!-- Magnific Popup -->
    <script src="{{ asset('assets/vendors/magnific-popup/jquery.magnific-popup.min.js') }}"></script>

    <script src="{{ asset('assets/js/script.js') }}"></script>


  </body>
  </html>
