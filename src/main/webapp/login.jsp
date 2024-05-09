<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Nurse Login | Batch-11</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex justify-content-between">

      <div class="logo">
        <h1><a href="index.html">Batch-11 HBMS</a></h1>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="index.html#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#main">About</a></li>
          <li><a class="nav-link scrollto" href="index.html#services">Services</a></li>
          <li><a class="nav-link scrollto" href="index.html#team">Team</a></li>
          
          <li><a class="nav-link scrollto" href="index.html#footer">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <style>
        @font-face {
      font-family: "Muli-Regular";
      src: url("../fonts/muli/Muli-Regular.ttf"); }
    @font-face {
      font-family: "Muli-SemiBold";
      src: url("../fonts/muli/Muli-SemiBold.ttf"); }
    * {
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box; }
    
    body {
      font-family: "Muli-Regular";
      font-size: 14px;
      margin: 0;
      color: #999;
       }
    
    input, textarea, select, button {
      font-family: "Muli-Regular";
    }
    
    p, h1, h2, h3, h4, h5, h6, ul {
      margin: 0; }
    
    img {
      max-width: 100%; }
    
    ul {
      padding-left: 0;
      margin-bottom: 0; }
    
    a {
      text-decoration: none; }
    
    :focus {
      outline: none; }
    
    .wrapper {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background-image: url(assets/img/home.jpg); }
    
    .inner {
      position: relative;
      width: 435px; }
    
    .image-1 {
      position: absolute;
      bottom: -12px;
      left: -165px;
      z-index: 99; 
      height:485px}
    
    .image-2 {
      position: absolute;
      bottom: 0;
      right: -129px; }
    
    form {
      width: 100%;
      position: relative;
      z-index: 9;
      padding: 77px 61px 66px;
      background: #fff;
      box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
      -webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
      -moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
      -ms-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
      -o-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2); }
    
    h3 {
      text-transform: uppercase;
      font-size: 25px;
      font-family: "Muli-SemiBold";
      color: #333;
      letter-spacing: 3px;
      text-align: center;
      margin-bottom: 33px; }
    
    .form-holder {
      position: relative;
      margin-bottom: 21px; }
      .form-holder span {
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        font-size: 15px;
        color: #333; }
        .form-holder span.lnr-lock {
          left: 2px; }
    
    .form-control {
      border: none;
      border-bottom: 1px solid #e6e6e6;
      display: block;
      width: 100%;
      height: 38px;
      background: none;
      padding: 3px 42px 0px;
      color: #666;
      font-family: "Muli-SemiBold";
      font-size: 16px; }
      .form-control::-webkit-input-placeholder {
        font-size: 14px;
        font-family: "Muli-Regular";
        color: #999;
        transform: translateY(1px); }
      .form-control::-moz-placeholder {
        font-size: 14px;
        font-family: "Muli-Regular";
        color: #999;
        transform: translateY(1px); }
      .form-control:-ms-input-placeholder {
        font-size: 14px;
        font-family: "Muli-Regular";
        color: #999;
        transform: translateY(1px); }
      .form-control:-moz-placeholder {
        font-size: 14px;
        font-family: "Muli-Regular";
        color: #999;
        transform: translateY(1px); }
      .form-control:focus {
        border-bottom: 1px solid #accffe; }
    
    button {
      border: none;
      width: 100%;
      height: 49px;
      margin-top: 50px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 0;
      background: #99ccff;
      color: #fff;
      text-transform: uppercase;
      font-family: "Muli-SemiBold";
      font-size: 15px;
      letter-spacing: 2px;
      transition: all 0.5s;
      position: relative;
      overflow: hidden; }
      button span {
        position: relative;
        z-index: 2; }
      button:before, button:after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 1;
        background-color: rgba(52, 152, 253, 0.25);
        -webkit-transition: all 0.3s;
        -moz-transition: all 0.3s;
        -o-transition: all 0.3s;
        transition: all 0.3s;
        -webkit-transform: translate(-100%, 0);
        transform: translate(-100%, 0);
        -webkit-transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
        transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1); }
      button:after {
        -webkit-transition-delay: 0.2s;
        transition-delay: 0.2s; }
      button:hover:before, button:hover:after {
        -webkit-transform: translate(0, 0);
        transform: translate(0, 0); }
    
    @media (max-width: 991px) {
      .inner {
        width: 400px;
        left: 4%; } }
    @media (max-width: 767px) {
      .inner {
        width: 100%;
        left: 0; }
    
      .image-1, .image-2 {
        display: none; }
    
      form {
        padding: 35px;
        box-shadow: none;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        -ms-box-shadow: none;
        -o-box-shadow: none; }
    
      .wrapper {
        background: none; } 
        }
        .form-holder p {
      margin: 10px 0;
      font-size: 14px;
      text-align: center;
      color: #333;
    }
    
    .form-holder a {
      color: #99ccff;
      font-weight: bold;
      text-decoration: underline;
    }
    
    .form-holder a:hover {
      color: #0066cc; /* Change the color on hover if needed */
    }
        
      </style>
   
        <body>

            <div class="wrapper">
                <div class="inner">
                    
                    <form action="LoginServlet" method="post">
                        <h3> Nurse Login </h3>
                        <div class="form-holder">
                            <label>Username:</label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                        <div class="form-holder">
                            <label>Password:</label>
                            <input type="password" class="form-control" name="password" id="password" required>
                        </div>
                        <button type="submit" onclick="login()">
                            <span>Log In</span>
                        </button>
                        <span id="passwordError" style="color: red;"></span>
                        <div id="loginError" style="color: red;"></div>
                        <div class="form-holder"><p>New User ?, click the link: <a href="registration.jsp">Register!</a></p></div>
                    </form>
                    
                </div>
            </div>
            
        
        
        <script>
        document.getElementById('password').addEventListener('input', function () {
            validatePassword();
        });
    
        function validatePassword() {
            var passwordInput = document.getElementById('password');
            var passwordError = document.getElementById('passwordError');
            
            var password = passwordInput.value;
            
            if (password.length < 8) {
                passwordError.textContent = 'Password must be at least 8 characters long.';
                passwordInput.setCustomValidity('Password must be at least 8 characters long.');
            } else {
                passwordError.textContent = '';
                passwordInput.setCustomValidity('');
            }
        }
    
        function login() {
            var passwordInput = document.getElementById('password');
            var loginError = document.getElementById('loginError');
    
            validatePassword();
    
            if (passwordInput.checkValidity()) {
               
                
              
            } else {
            
                loginError.textContent = 'Please fix the errors before logging in.';
            }
        }
        </script>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->

   <!-- ======= Footer ======= -->
   <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3 style="color: #fff; margin-right: 120px;">Batch 11</h3>
              
              <p>
                Biomedical Engineering<br>
                KPR Insitute of Engineering and Technology<br>
                Coimbatore 641407, Tamil nadu<br><br>
                <strong>Phone:</strong> +91 6384772055<br>
                <strong>Email:</strong> vishnukarikalan@gmail.com<br>
              </p>
              
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Batch 11 Hospitality</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
       
      
        Designed by <a href="">Batch 11 - BME</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>