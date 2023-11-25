<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Registration</title>


 <link rel="stylesheet" href="assets/fonts/material-icon/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
 <link rel="stylesheet" href="assets/css/login.css">
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var emailAlertShown = false;

function isNumber(evt){
	var num=evt.keyCode ? evt.keyCode : evt.which;
	if(num<48 || num>57){
		Swal.fire("Please Enter a valid Phone Number");
		evt.preventDefault();
		return false;
	}
	return true;
}
/*  || !email.endsWith("@yahoo.com")) */
/* function validateEmail(email) {
	if (email === "" || !email.endsWith("@gmail.com") ) {
	   alert("Please enter a valid Gmail email address");
	   return false;
	 }
	 return true;
} */


function validateEmail(email) {
    var x = /[A-Za-z0-9_]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,3}/;
    if (email && email.match(x)) {
        return true;
    } else {
        if (!emailAlertShown) { // Check if the alert has already been shown
            Swal.fire("Invalid Email");
            document.getElementById("email").focus();
            emailAlertShown = true; // Set the flag to prevent further alerts
        }
        return false;
    }
}



</script>
</head>

<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="main">
		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" required="required"/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" onblur="validateEmail(this.value)" required="required"/>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" required="required"/>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" required="required"/>
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact" placeholder="Contact no" onkeypress="isNumber(event);" required="required"/>
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="assets/images/R.png" alt="signup image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	
<script type="text/javascript">
var status=document.getElementById("status").value;
if(status=="success"){
	Swal.fire("congrats","Account Created Succesfully","success");
}
if(status=="invalidName"){
	Swal.fire("Sorry","Please Enter Name","error");
}
if(status=="invalidEmail"){
	Swal.fire("Sorry","Please Enter Email","error");
}
if(status=="invalidUpwd"){
	Swal.fire("Sorry","Please Enter Password","error");
} 
if(status=="invalidUmobile"){
	Swal.fire("Sorry","Please Enter Valid Mobile Number","error");
}

if(status=="invalidUmobileLegth"){
	Swal.fire("Sorry","Please Enter Valid Mobile Number","error");
}
if(status=="invalidConfirmPassword"){
	Swal.fire("Sorry","Password Donot Match","error");
}

</script>


</body>

</html>