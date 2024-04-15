<?php
    include 'config.php';
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="top.css">
    <link rel="stylesheet" href="general.css">
    <link rel="stylesheet" href="booking.css">
    <link rel="stylesheet" href="bottom.css">
    <link rel="stylesheet" href="locations.css">
    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="profile.css">

</head>
<body>
  
  <div class="header">
    <div class="header-div">
      <div class="header-logo">
          <img class="logo" src="/train booking/images/logo.png">
      </div>
      
      <div class="header-options">
          <a class="home" href="index.html">home</a>
          <strong><a class="login"href="login.html">login</a></strong>
          <a class="register"href="register.html">register</a>
          <a class="contact-us"href="contactus.html">contact us</a>
          <a class="trains"href="#">trains</a>
          <strong><time id="time">00:00:00</time> </strong>
          

      </div>
      
      <div class="profile">
          <button id="profile-button">
              <img class="profile-image"src="/train booking/images/user.png">
          </button>
      </div>     
    </div>   
  </div>  


  <div class="login-box-container">
    <div class="login-container">
        <div class="logout-box">
            <img class="train-png" src="/train booking/images/trainpng.png">
            <p class="login-text">PROFILE</p>
            <?php
                if(isset($_SESSION['user_id']))
                {
                    echo 
                    "<div class='name1'>name:</div>
                    <div class='namedisplay'>" 
                        
                        .$_SESSION['user_id']. 
                    "</div>";


                    echo 
                    "<div class='email1'>email:</div>
                    <div class='emaildisplay'>"
                        .$_SESSION['email_id']. 
                     "</div>";


                    echo 
                    "<div class='phoneno1'>phone number:</div>
                    <div class='phonedisplay'>" 
                        .$_SESSION['ph_no']. 
                    "</div>";
                }
            
            ?>
            <form class="email-pass"  action="#">
                
          </form>
          
            <button type="button" id="logout-button" onclick="window.location.href='logout.php'">
                    LOGOUT
            </button>

          
          
        </div>

    </div>


  </div>









  <div class="footer-container">
    <div class=footer-links>
      <a id="about-us" href="#">About us</a>
      <a id="features" href="#">Features</a>
      <a id="sdgs" href="#">SDG's</a>
      <a id="contact-us" href="#">Contact us</a>
      
    </div>
    <div class="copyright-credit">
      <p>&copy;2024 sujal,sanskar,hardik /mentor: bharthi maam</p>

    </div>
  

  </div>

 <script src="time_update.js"></script>
</body>
</html>      