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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
 
    <script>
        $('#myCarousel').carousel({
            interval: 3000 
        });
    </script>
    <style>
    
    #movetop {
        display: none;
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #007BFF; /* Button background color */
        color: #fff; /* Button text color */
        border: none;
        border-radius: 50%;
        padding: 15px;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s, color 0.3s;
    }

    #movetop:hover {
        background-color: #0056b3; /* Hover background color */
        color: #fff; /* Hover text color */
    }

    .fa-arrow-up {
        font-size: 20px;
    }
</style>

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
            <li><a class="dropdown-item" href="/MovieTicketReservationSystem/userDetails">Account</a></li>
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
    <h1>Popular Movies</h1>
    <a href="/MovieTicketReservation/moviepage"><h6 style="margin-right: 5%;">Show All</h6></a></div>
    
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
    
    <div class="container-fluid" style="background-color: rgb(43, 49, 72);">
    <div class="show" style="color:#fff;padding-top: 2%; margin-bottom:2%;">
    <h1>Upcoming Movies</h1>
    <a href="/MovieTicketReservation/moviepage"><h6 style="margin-right: 5%; color:#fff;">Show All</h6></a></div>
    
    <section class="cards">
   
        <article class="card card--1">
          <div class="card__info-hover">
            <svg class="card__like"  viewBox="0 0 24 24">
            <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
        </svg>
              <div class="card__clock-info">
                <svg class="card__clock"  viewBox="0 0 24 24"><path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
                </svg><span class="card__time">7 Days</span>
              </div>
            
          </div>
          <div class="card__img"></div>
          <a href="https://youtu.be/GDVT4raMjRY" class="card_link">
             <div class="card__img--hover"></div>
           </a>
          <div class="card__info">
            <span class="card__category"> Drama, Family</span>
            <h3 class="card__title">Hi Nanna</h3>
            <span class="card__by">by <a href="https://youtu.be/GDVT4raMjRY" class="card__author" title="author">Shouryuv</a></span>
          </div>
        </article>
          
          
        <article class="card card--2">
          <div class="card__info-hover">
            <svg class="card__like"  viewBox="0 0 24 24">
            <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
        </svg>
              <div class="card__clock-info">
                <svg class="card__clock"  viewBox="0 0 24 24"><path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
                </svg><span class="card__time">8th Days</span>
              </div>
            
          </div>
          <div class="card__img"></div>
          <a href="https://youtu.be/otNh9bTjXWg" class="card_link">
             <div class="card__img--hover"></div>
           </a>
          <div class="card__info">
            <span class="card__category"> Fantacy, Musical</span>
            <h3 class="card__title">Wonka</h3>
            <span class="card__by">by <a href="https://youtu.be/otNh9bTjXWg" class="card__author" title="author">Paul King</a></span>
          </div>
        </article>  
  		
  		<article class="card card--3">
          <div class="card__info-hover">
            <svg class="card__like"  viewBox="0 0 24 24">
            <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
        </svg>
              <div class="card__clock-info">
                <svg class="card__clock"  viewBox="0 0 24 24"><path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
                </svg><span class="card__time">8 Days</span>
              </div>
            
          </div>
          <div class="card__img"></div>
          <a href="https://youtu.be/LOzucm1jbzs" class="card_link">
             <div class="card__img--hover"></div>
           </a>
          <div class="card__info">
            <span class="card__category"> Action, Romance</span>
            <h3 class="card__title">Extra ordinary Man</h3>
            <span class="card__by">by <a href="https://youtu.be/GnO4cOx_wFQ" class="card__author" title="author">Vakkantham Vamsi</a></span>
          </div>
        </article>
        <a href="https://youtu.be/LOzucm1jbzs" class="card_link">
        <article class="card card--4">
          <div class="card__info-hover">
            <svg class="card__like"  viewBox="0 0 24 24">
            <path fill="#000000" d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
        </svg>
              <div class="card__clock-info">
                <svg class="card__clock"  viewBox="0 0 24 24"><path d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
                </svg><span class="card__time">21 Days</span>
              </div>
            
          </div>
          <div class="card__img"></div>
          <a href="https://youtu.be/LOzucm1jbzs" class="card_link">
             <div class="card__img--hover"></div>
           </a>
          <div class="card__info">
            <span class="card__category"> Comedy, Drama</span>
            <h3 class="card__title">Dunki</h3>
            <span class="card__by">by <a href="https://youtu.be/LOzucm1jbzs" class="card__author" title="author">Rajkumar Hirani</a></span>
          </div>
        </article>
        </a>
          </section>
       </div>   
          
          
          
    <div class="show">
        <h1 style="margin-bottom: 2%;">New Releases</h1>
        <a href="/MovieTicketReservation/moviepage"><h6 style="margin-right: 5%;">Show All</h6></a></div>
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
			<button onclick="topFunction()" id="movetop" title="Go to top">
        <span class="fa fa-arrow-up" aria-hidden="true"></span>
    </button>
			<script>
				// When the user scrolls down 20px from the top of the document, show the button
				window.onscroll = function () {
					scrollFunction()
				};

				function scrollFunction() {
					if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
						document.getElementById("movetop").style.display = "block";
					} else {
						document.getElementById("movetop").style.display = "none";
					}
				}

				// When the user clicks on the button, scroll to the top of the document
				function topFunction() {
					document.body.scrollTop = 0;
					document.documentElement.scrollTop = 0;
				}
			</script>
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