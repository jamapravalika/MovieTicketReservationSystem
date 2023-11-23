<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/material-design-iconic-font@2.2.0/dist/css/material-design-iconic-font.min.css">

<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
/* function validateEmail(email) {
	if (email === "" || !email.endsWith("@gmail.com") ) {
	   alert("Please enter a valid Gmail email address");
	   return false;
	 }
	 return true;
} */

function validateEmail(email) {
    var x = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,3})$/;
    if (email && email.match(x)) {
        return true;
    } else {
    	Swal.fire("Invalid Email");
        document.getElementById("email").focus();
        return false;
    }
}


</script>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main">
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="assets/images/cinema-clipart-transparent-background-7.png" alt="sing up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
					</div>
					<div class="signin-form">
						<h2 class="form-title">Sign in</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username"
									placeholder="Your Email" onblur="validateEmail(this.value)"/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<a href="forgotPassword.jsp">Forgot Password</a>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
						
					</div>
				</div>
			</div>
		</section>
	</div>
	
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
		var status=document.getElementById("status").value;
		if(status == "failed"){
			Swal.fire("Sorry","Wrong username and password","error");
		}
		if(status == "invalidEmail"){
			Swal.fire("Sorry","Please Enter Username","error");
		}
		if(status == "invalidupwd"){
			Swal.fire("Sorry","Please Enter Password","error");
		}
		if(status == "resetSuccess"){
			Swal.fire("Congrats","Password set successufully","success");
		}
		if(status == "resetFailed"){
			Swal.fire("Sorry","Password Reset Failed","error");
		}
	</script>
</body>
</html>