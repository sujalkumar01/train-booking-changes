<?php
include 'config.php';

if(isset($_POST['register'])){
    $name = mysqli_real_escape_string($connection, $_POST['name']);
    $email = mysqli_real_escape_string($connection, $_POST['email']);
    $phone_number = mysqli_real_escape_string($connection, $_POST['phone_number']);
    $password = mysqli_real_escape_string($connection, $_POST['password']);
    $confirm_password = mysqli_real_escape_string($connection, $_POST['confirm_password']);
    
   
  if($password === $confirm_password) {
        // Check if all fields are filled
        if(!empty($name) && !empty($email) && !empty($phone_number) && !empty($password) && !empty($confirm_password)) {
            // Check if user already exists
            $select = mysqli_query($connection, "SELECT * FROM `user` WHERE email='$email' AND password='$password'") or die(mysqli_error($connection));
            
            if(mysqli_num_rows($select) > 0) {
                $message[] = 'User already exists';
            } else {
                // Insert user if all checks pass
                $insert = mysqli_query($connection, "INSERT INTO `user`(`User_ID`, `Username`, `Password`, `Email`, `Phone_Number`, `Address`, `image`) VALUES ('','$name','$password','$email','$phone_number','NULL','NULL')") or die(mysqli_error($connection));

                if($insert) {
                    $message[] = 'Registered successfully';
                   // header("Location: train booking/login.php");
                    exit;
                } else {
                    $message[] = 'Failed to register';
                }
            }
        } else {
            $message[] = 'All fields are required';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <link rel="stylesheet" href="top.css">
    <link rel="stylesheet" href="general.css">
    <link rel="stylesheet" href="booking.css">
    <link rel="stylesheet" href="bottom.css">
    <link rel="stylesheet" href="locations.css">
    <link rel="stylesheet" href="register.css">

</head>
<body>
  
  <div class="header">
    <div class="header-div">
      <div class="header-logo">
          <img class="logo" src="/train booking/images/logo.png">
      </div>
      
      <div class="header-options">
          <a class="home" href="index.html">home</a>
          <a class="login"href="login.html">login</a>
          <a class="register"href="register.php">register</a>
          <a class="contact-us"href="contactus.html">contact us</a>
          <a class="trains"href="#">trains</a>
          <strong><time id="time">00:00:00</time> </strong>
          <strong><time id ="date"datetime="2023-04-1"></time></strong>

      </div>
      
      <div class="profile">
          <button id="profile-button">
              <img class="profile-image"src="/train booking/images/user.png">
          </button>
      </div>     
    </div>   
  </div>  


  <div class="register-box-container">
    <div class="register-container">
        <div class="register-box">
            <img class="train-png" src="/train booking/images/trainpng.png">
            <img class="train-png2" src="/train booking/images/trainpng.png">
            <p class="register-text">REGISTER</p>
            
            <form class="email-pass" method="post" action="#" enctype="multipart/form-data">
                <?php
                if(isset($message)){
                    foreach($message as $already){
                        echo '<div class="message">'.$already.'</div>';
                    }
                    
                }
                
                
                ?>
                <input type="text" id="name" name="name" placeholder="name" required>
                <input type="email" id="email" name="email" placeholder="email id" required oninvalid="this.setCustomValidity('enter valid email id')" oninput="this.setCustomValidity('')" >
                <input type="text" id="phone-number" name="phone_number" placeholder="phone number" pattern="\d{10}">
                <input type="password" id="password" name="password" placeholder="password" required minlength="8"oninvalid="this.setCustomValidity('min 8 characters')"oninput="this.setCustomValidity('')">
                <input type="password" id="confirm-password" name="confirm_password" placeholder="confirm password" required oninput="check()">
            
            <button type="submit"  name="register" id="register-button">
                REGISTER
            </button>
          </form>
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
  <script>
    function check()
    {
      var pass=document.getElementById('confirm-password');
      if(pass.value !=document.getElementById('password').value)
      {
        pass.setCustomValidity("passwords must match")
      }
      else
      {
        pass.setCustomValidity("")
      }
    }
  </script>
</body>
</html>