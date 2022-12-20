@include("home/header")
  

    
<section class="page-header">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-xl-8">
          <div class="title-block">
            <h1>Contact Us</h1>
            <ul class="header-bradcrumb justify-content-center">
              <li><a href="index.html">Home</a></li>
              <li class="active" aria-current="page">Contact</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
</section>



<!-- Contact section start -->
<section class="contact section-padding">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-xl-4 col-lg-5">
               <div class="contact-info-wrapper mb-5 mb-lg-0">
                   <h3>Get in touch 
                       
                   </h3>
                   <p>One of our representative will contact you as soon as possible</p>

                    <div class="contact-item">
                        <i class="fa fa-envelope"></i>
                        <h5>support@nimet.gov.ng</h5>
                    </div>

                    <div class="contact-item">
                        <i class="fa fa-phone-alt"></i>
                        <h5>+234 900 000 0000</h5>
                    </div>

                    <div class="contact-item">
                        <i class="fa fa-map-marker"></i>
                        <h5>Abuja, Nigeria </h5>
                    </div>
               </div>
            </div>

            <div class="col-xl-7 col-lg-6">
                <form class="contact__form form-row " method="post" action="mail.php" id="contactForm">
                    <div class="row">
                       <div class="col-12">
                           <div class="alert alert-success contact__msg" style="display: none" role="alert">
                               Your message was sent successfully.
                           </div>
                       </div>
                   </div>

                   <div class="row">
                       <div class="col-lg-6">
                           <div class="form-group">
                               <input type="text" id="name" name="name" class="form-control" placeholder="Your Name">
                           </div>
                       </div>
                       
                       <div class="col-lg-6">
                           <div class="form-group">
                               <input type="text" name="email" id="email" class="form-control" placeholder="Email Address">
                           </div>
                       </div>
                       <div class="col-lg-12">
                           <div class="form-group">
                               <input type="text" name="subject" id="subject" class="form-control" placeholder="Subject">
                           </div>
                       </div>
                       
                       <div class="col-lg-12">
                           <div class="form-group">
                               <textarea id="message" name="message" cols="30" rows="6" class="form-control" placeholder="Your Message"></textarea>    
                           </div>
                       </div>
                   </div>

                   <div class="col-lg-12">
                       <div class="text-center">
                           <button class="btn btn-main w-100 rounded" type="submit">Send Message</button>
                       </div>
                   </div>
               </form> 
            </div>
        </div>
    </div>
</section>
<!-- Contact section End -->


@include("home/footer")
