<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>

	<link href="//fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,600&display=swap"
		rel="stylesheet">
<!-- <link rel="stylesheet" href="css/ContactForm.css"> -->
<link rel="stylesheet" href="assets/css/Header.css">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/Header.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  	<link rel="stylesheet" href="assets/css/Contact.css">

</head>
<body>
<%@ include file="Header.jsp" %>

    <div class="container" id="con"> 
        <form onsubmit="SendEmail(); reset(); return false;">
            <h2>CONTACT US</h2>
            <input type="text" id="name" placeholder="Your Name" required>
            <input type="email" id="email" placeholder="Email ID" required>
            <input type="text" id="phone" placeholder="Phone no." required>
            <textarea id="message" rows="4" placeholder="YOUR MESSAGE"></textarea>
            <button type="submit">SEND</button>
        </form>
    </div>
     <%@ include file="footer.html" %>
    <!--/theme-change-->
<script src="assets/js/theme-change.js"></script>
    <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script>
        function reset() {
            document.getElementById('name').value = '';
            document.getElementById('email').value = '';
            document.getElementById('phone').value = '';
            document.getElementById('message').value = '';
        }

        function SendEmail() {
            Email.send({
                Host: "smtp.elasticemail.com",
                Username: "jamapravalika@gmail.com",
                Password: "ECEC2B38670C471A8A4A68ACE2421F1BABA5",
                To: "pravallikajama@gmail.com",
                From: "jamapravalika@gmail.com",
                Subject: "This is the subject",
                Body: "And this is the body"
            }).then(
                message {
                    if (message === 'OK') {
                        alert('Email sent successfully');
                        reset();
                    } else {
                        alert('Email not sent. Please check your SMTP configuration.');
                    }
                }
            );
        }
    </script>
    <!-- disable body scroll which navbar is in active -->
<script>
	$(function () {
		$('.navbar-toggler').click(function () {
			$('body').toggleClass('noscroll');
		})
	});
</script>
<!-- disable body scroll which navbar is in active -->

<!--/MENU-JS-->
<script>
	$(window).on("scroll", function () {
		var scroll = $(window).scrollTop();

		if (scroll >= 80) {
			$("#site-header").addClass("nav-fixed");
		} else {
			$("#site-header").removeClass("nav-fixed");
		}
	});

	//Main navigation Active Class Add Remove
	$(".navbar-toggler").on("click", function () {
		$("header").toggleClass("active");
	});
	$(document).on("ready", function () {
		if ($(window).width() > 991) {
			$("header").removeClass("active");
		}
		$(window).on("resize", function () {
			if ($(window).width() > 991) {
				$("header").removeClass("active");
			}
		});
	});
</script>

</body>
</html>
    