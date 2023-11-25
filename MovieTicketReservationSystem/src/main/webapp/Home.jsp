<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="assets/css/Home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="assets/css/Header.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  
  

    <script>
        // Start the carousel and set the interval for autoplay
        $('#myCarousel').carousel({
            interval: 3000 // Change slide every 3 seconds (3000ms)
        });
    </script>

</head>
<body>
<nav class="navbar navbar-expand-sm custom-navbar" style="background-color: maroon;">
  <div class="container-fluid">
    <a class="navbar-brand" href="javascript:void(0)"><i class="fa-solid fa-film"></i> MovieTicket</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <br>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="Home.jsp"><i class="fas fa-home"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/MovieTicketReservationSystem/moviepage"><i class="fa-solid fa-video"></i> Movies</a>
        </li>
       <!--  <li class="nav-item">
          <a class="nav-link" href="Movies.jsp"><i class="fa-solid fa-video"></i> Movies</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link" href="About.jsp"><i class="fas fa-book"></i> About</a>
      </li>
        <li class="nav-item">
          <a class="nav-link" href="ContactForm.jsp"><i class="fas fa-envelope"></i> Contact</a>
        </li>
        
      
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><i class="fas fa-user"></i> Account</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Account</a></li>
            <li><a class="dropdown-item" href="/MovieTicketReservationSystem/UserBookings">History</a></li>
            <li><a class="dropdown-item" href="login.jsp">Logout</a></li>
          </ul>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="#">Hello, <%=session.getAttribute("name") %> <i class="fas fa-hand-wave"></i></a>

        </li>
      </ul>
      <form class="d-flex" action="SearchServlet" method="post">
        <label for="keyword"></label>
        <input class="form-control me-2" type="text" id="keyword" name="keyword" placeholder="Search">
        <i class="fas fa-search" value="Search"></i>
      </form>
    </div>
  </div>
</nav>
<br>
<section>
<div class="container-fluid">
    <div id="myCarousel" class="carousel slide" data-ride="carousel" style:"width:80%">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="assets/images/banner4.jpg" alt="Image 4">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Paw Patrol: The Mighty Movie</h3>
								<p>
									When a magical meteor crash lands in Adventure City, it gives
									the Paw Patrol pups<span style="font-style: italic;"> superpowers,
										transforming them into The Mighty Pups!</span>
								</p>
								<a href="#small-dialog4" style="text-decoration: none;">
									<span style="color: #fff;"><i class="fa fa-play" style="align-items: center;"></i>
									Watch Trailer</span>
								</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="assets/images/mrshettyPos.jpg" alt="Image 2">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Miss Shetty Mr Polishetty</h3>
								<p>
									While Miss Shetty is a feminist living in London and wants to
									be single forever,<span style="font-style: italic;"> Mr.
										Polishetty from Hyderabad wants to be in a committed
										relationship. Despite being in different stages of life, they
										connect.</span>
								</p>
								<a href="" style="text-decoration: none;">
								 <span style="color: #fff;"><i class="fa fa-play" style="align-items: center;"></i>
									Watch Trailer</span>
                                </a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="assets/images/KushiPos.avif" alt="Image 3">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Kushi</h3>
                    <p>A couple who are predicted to have a failed marriage, decide to become ideal 
                        partners for each other. <span style="font-style: italic;">
                        Will it work out or will they realize that their parents were right?</span></p>
                        <a href="" style="text-decoration: none;">
                            <span style="color: #fff;"><i class="fa fa-play" style="align-items: center;"></i>
                               Watch Trailer</span>
                        </a>
                </div>
            </div>
            
            <div class="carousel-item">
                <img src="assets/images/JawanPos.jpg" alt="Image 1">
                <div class="carousel-caption d-none d-md-block">
                    <h3>Jawan</h3>
								<p>
									A high-octane action thriller that outlines<span
										style="font-style: italic;"> the emotional journey of a man who
										is set to rectify the wrongs in society.</span>
								</p>
								<a href="" style="text-decoration: none;">
									<span style="color: #fff;"><i class="fa fa-play" style="align-items: center;"></i> 
									Watch Trailer</span>
                                </a>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<div class="container-fluid">
    <div class="show">
    <h1>Popular Movie</h1>
    <h6 style="margin-right: 5%;">Show All</h6></div>
    <div class="row" id = "con">
        <div class="col-6 col-md-3">
                <img src="assets/images/the-equalizer.webp" alt="Equalizer">
                <div class="descriptions">
                    <h3>Equalizer 3</h3>
                    <p>
                        Since giving up his life as a government assassin, Robert McCall finds solace in serving justice on behalf of the oppressed. Now living in Southern Italy, he soon discovers his new friends are under the control of local crime bosses.                   
                    </p>
                    <button>
                        <i class="fa fa-youtube"></i>
                        Play trailer on YouTube
                    </button>
                </div>
        </div>
        <div class="col-6 col-md-3">
            <img src="assets/images/Gadhar-portrait.webp" alt="Gadar">
            <div class="descriptions">
                <h3>Gadar 2</h3>
                <p>
                    When Tara Singh goes missing during a skirmish and is believed to be captured in Pakistan, his son Jeete sets out to rescue him and enters a labyrinth from which they both must escape at all costs.
                </p>
                <button>
                    <i class="fa fa-youtube"></i>
                    Play trailer on YouTube
                </button>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <img src="assets/images/a-haunting-in-venice.webp" alt="haunting">
                <div class="descriptions">
                    <h3>A Haunting in Venice</h3>
                    <p>
                        Now retired and living in self-imposed exile in the world's most glamorous city, Poirot reluctantly attends a seance at a decaying, haunted palazzo. He soons gets thrust into a sinister world of shadows and secrets when one of the guests is murdered.
                    </p>
                    <button>
                        <i class="fa fa-youtube"></i>
                        Play trailer on YouTube
                    </button>
                </div>
        </div>
        <div class="col-6 col-md-3">
            <img src="assets/images/avtar-2.jpeg" alt="Avatar">
                <div class="descriptions">
                    <h3>Avatar 2</h3>
                    <p>
                        It follows a blue-skinned humanoid Na'vi named Jake Sully (Worthington) as he and his family, under renewed human threat, seek refuge with the aquatic Metkayina clan of Pandora, a habitable exomoon on which they live.
                    </p>
                    <button>
                        <i class="fa fa-youtube"></i>
                        Play trailer on YouTube
                    </button>
                </div>
        </div>
    </div>
    
    <div class="show">
        <h1 style="margin-bottom: 2%;">New Releases</h1>
        <h6 style="margin-right: 5%;">Show All</h6></div>
    <div class="row" id="con">  
        <div class="col-6 col-md-3">
            <img src="assets/images/n2.jpg" alt="Mulan">
                <div class="descriptions">
                    <h3>Mulan</h3>
                    <p>Mulan is a fictional character, developed in China in response to the greater independence women</p>
                    <button>
                        <i class="fa fa-youtube"></i>
                        Play trailer on YouTube
                    </button>
                </div>
        </div>
        <div class="col-6 col-md-3">
            <img src="assets/images/n1.jpg" alt="No Time to Die">
                <div class="descriptions">
                    <h3>No Time to Die</h3>
                    <p>In No Time To Die, Bond has left active service and is enjoying a tranquil life in Jamaica.
                    </p>
                    <button>
                        <i class="fa fa-youtube"></i>
                        Play trailer on YouTube
                    </button>
                </div>
        </div>
        <div class="col-6 col-md-3">
            <img src="assets/images/n3.jpg" alt="Free Guy">
                <div class="descriptions">
                    <h3>Free Guy</h3>
                    <p>It tells the story of a bank teller who discovers that he is a non-player character in a massively
                    </p>
                    <button>
                        <i class="fa fa-youtube"></i>
                        Play trailer on YouTube
                    </button>
                </div>
        </div>
        <div class="col-6 col-md-3">
            <img src="assets/images/n4.jpg" alt="My Spy">
                <div class="descriptions">
                    <h3>My Spy</h3>
                    <p>To save his career, a demoted CIA operative must cater to the whims of a precocious girl 
                    </p>
                    <button>
                        <i class="fa fa-youtube"></i>
                        Play trailer on YouTube
                    </button>
                </div>
        </div>
    </div>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" style="margin-top: 0;">
            <div class="carousel-item active">
                <img src="assets/images/meg.jpg" alt="Image 1">
                <div class="carousel-caption d-none d-md-block">
                    <span style="font-style: italic;">Action / Adventure</span>
                    <h3>Meg 2</h3>
						<a href="" style="text-decoration: none;">
							<span style="color: #fff;"><i class="fa fa-play" style="align-items: center;"></i> 
							Watch Trailer</span>
                        </a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="assets/images/mid2.jpg" alt="Image 2">
                <div class="carousel-caption d-none d-md-block">
                    <span style="font-style: italic;">Comedy / Adventure</span>
						<h3>Dolittle</h3>
						    <a href="" style="text-decoration: none;">
							<span style="color: #fff;"><i class="fa fa-play" style="align-items: center;"></i>
							Watch Trailer</span>
                            </a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="assets/images/mission.jpg" alt="Image 3">
                <div class="carousel-caption d-none d-md-block">
                    <span style="font-style: italic;">Action / Adventure</span>
						<h3>Mission: Impossible a Dead Reckoning Part 7</h3>
                            <a href="" style="text-decoration: none;">
                            <span style="color: #fff;"><i class="fa fa-play" style="align-items: center;"></i>
                               Watch Trailer</span>
                        </a>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
</section>

<footer>
<div class="container-fluid">
            <div class="container">
                <div class="row">
                  <div class="col-6 col-sm-4">
                    <h2><i class="fa fa-play"> Movie Ticket </i></h2>
                    <p>&copy; 2023 Movie Tickets. All rights reserved</p>
                    <ol class="social">
                        <li><a href="https://www.facebook.com/"><i class="fa fa-facebook" aria-hidden="true">
                        </i></a></li>
                        <li><a href="https://in.linkedin.com/"><i class="fa fa-linkedin"aria-hidden="true">
                        </i></a></li>
                        <li><a href="https://twitter.com/"><i class="fa fa-twitter" aria-hidden="true">
                        </i></a></li>
                        <li><a href="https://www.google.com/gmail/about/"><i class="fa fa-google-plus" aria-hidden="true">
                        </i></a></li>
                    </ol>
                  </div>
                  <div class="col">
                    <h3> Movies </h3>
                    <ol>
                        <li><a href="#">Movies</a></li>
                        <li><a href="#">Videos</a></li>
                        <li><a href="#">English Movies</a></li>
                        <li><a href="#">Tailor</a></li>
                        <li><a href="#">Upcoming Movies</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ol>
                  </div>
                  <div class="col">
                    <h3> Information </h3>
                    <ol>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="#">Tv Series</a></li>
                        <li><a href="#">Blogs</a></li>
                        <li><a href="sign_in.html">Login</a></li>
                        <li><a href="Contact_Us.html">Contact</a></li>
                    </ol>
                  </div>
                  <div class="col">
                    <h3> Location </h3>
                    <ol>
                        <li><a href="Movies.jsp">Asia</a></li>
                        <li><a href="Movies.jsp">France</a></li>
                        <li><a href="Movies.jsp">Taiwan</a></li>
                        <li><a href="Movies.jsp">United States</a></li>
                        <li><a href="Movies.jsp">Korea</a></li>
                        <li><a href="Movies.jsp">United Kingdom</a></li>
                    </ol>
                  </div>
                </div>
              </div>
          </div>
</footer>

</body>
</html>