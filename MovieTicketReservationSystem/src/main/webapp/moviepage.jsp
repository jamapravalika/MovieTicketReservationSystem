<%@ page import="java.util.List"%>
<%@ page import="com.Model.Movie"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.util.List"%>
<%@ page import="com.Model.Theater"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="com.Model.ShowTimes"%>
<%@ page import="com.Model.users"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Latest Bootstrap 5 JS with Popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link
	href="//fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,600&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<link rel="stylesheet" href="assets/css/movies.css">
<link rel="stylesheet" href="assets/css/Header.css">


<title>Movies</title>
<style type="text/css">
/*    .modal.fade {
  background: rgba(0, 0, 0, 0.5);
}

.modal-backdrop.fade {
  opacity: 0;
}
.def-number-input {
  display: inline-block;
  max-width: 120px;
  
}

.def-number-input button:hover {
  background-color: #f1f1f1;
} */
.col-md-3 {
	margin-bottom: 15px;
	
}
 @media (min-width: 768px) {
  .col-md-3 {
    flex: 0 0 auto !important;
    width: 25% !important;
  }
 }
 .container{
 margin-left: 10%;
 } 
 .mt-3 {
  margin-left: 13%;
  }
.def-number {
	aligh-items: "center";
}

.btn-primary {
	display: inline-block;
	padding: 10px 70px;
	background: linear-gradient(90deg, rgba(244, 11, 11, 0.8),
		rgba(0, 0, 0, 0.8) 87.19%);
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.btn-primary:hover {
	background: linear-gradient(90deg, rgba(0, 0, 0, 0.8) 20.19%,
		rgba(244, 11, 11, 0.8));
}


.theatre {
	font-size: 14px;
	/* width: fit-content; */
	padding: 7px 14px;
	background: rgb(233, 233, 233);
	border-radius: 2mm;
	cursor: pointer;
}

.timings {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	/* justify-content: center; */
	margin-top: 30px;
}

.timings input:checked+label {
	background: rgb(285, 115, 115);
	color: white;
}

.timings input:checked+label {
	background: rgb(285, 115, 115);
	color: white;
}

.timings input:checked+label {
	background: rgb(285, 115, 115);
	color: white;
}
.theatres {
	width: 100%;
	display: flex;
	align-items: center;
	/* justify-content: space-between; */
	margin-top: 10px;
	margin-bottom: 10px;
}

.theatre {
	font-size: 14px;
	padding: 7px 14px;
	background: rgb(233, 233, 233);
	border-radius: 2mm;
	cursor: pointer;
}

.times {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 10px;
}

.time {
	font-size: 14px;
	width: fit-content;
	padding: 7px 14px;
	background: rgb(233, 233, 233);
	border-radius: 2mm;
	cursor: pointer;
}

tr {
	align-items: center;
}
  /* Add this style for flex container */
  .theatres-and-times {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .theatres,
  .times {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }


.timings input[type="radio"] {
	display: none;
}
.card {
    position: relative;
    overflow: hidden;
}

.modal img {
    transition: opacity 0.3s;
}

.modal img:hover{
    opacity: 0.6; 
    cursor: pointer;
}

.watch-trailer-text {
    position: absolute;
    top: 26%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #21060c;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    z-index: 1;
}
.text-overlay h3{
	padding-left: 10px;
	color:#cc0d0d;
    text-align: left;
    font-size: 1rem;
}
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

</style>
</head>
<body>
	<%@ include file="Header.jsp"%>

	<div id="myCarousel" class="carousel slide slide mx-auto"
		data-bs-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
			<li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
			<li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
			<li data-bs-target="#myCarousel" data-bs-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">

			<div class="carousel-item active">
				<img src="assets/images/banner1.jpg" alt="Chania" width="460"
					height="345">
			</div>

			<div class="carousel-item">
				<img src="assets/images/banner2.jpg" alt="Chania" width="460"
					height="345">
			</div>

			<div class="carousel-item">
				<img src="assets/images/banner3.jpeg" alt="Flower" width="460"
					height="345">
			</div>

			<div class="carousel-item">
				<img src="assets\images\paw2.jpeg" alt="Flower" width="460"
					height="345">
			</div>

		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#myCarousel" role="button"
			data-bs-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</a> <a class="carousel-control-next" href="#myCarousel" role="button"
			data-bs-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</a>
	</div>

	<br>
	<br>
	<h2 style="margin-left: 6%;">Latest Movies</h2>

	<div class="container mt-3" style="margin-left: 9%;">
        <% 
        List<Movie> movies = (List<Movie>) request.getAttribute("movies");
        List<users> userList = (List<users>) request.getAttribute("userList");
        if (movies != null) {
            int movieCount = 0;
            for (Movie movie : movies) {
                if (movieCount % 100 == 0) {  
        %>
        <div class="row">
            <%
                }
            %>
            <div class="col-md-3 mb-4">
                <div class="card"> 
                            
                    <img class="card-img-top custom-card-image" src="images/<%= movie.getMovie_Poster() %>" alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title"><%= movie.getMovie_Name() %></h4>
                        <p class="card-text"><%= movie.getGenre() %></p>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%= movie.getMovie_Id() %>">Movie Details</button>
                    </div>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="myModal<%= movie.getMovie_Id() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle"><%= movie.getMovie_Name() %></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                           	<a href="<%= movie.getTrailerlink() %>" target="_blank"><div class="watch-trailer-text"><img class="trailer-imge" src="assets/images/play-button(3).png" alt="trailer"><br>Watch Trailer</div></a>
                 
                                <img src="images/<%= movie.getMovie_Poster() %>" alt="Movie Poster" style="max-width: 100%; height: auto; margin-left: 19%;">
                             <br>
                                <br>
                                <div class="text-overlay">
                                <div style="align-items: center;">		
                                    <h3 style="margin-right: 20px; font-weight: bold;"><%= movie.getGenre() %></h3>
                                    <h3><b>Duration&nbsp;</b>: <%= movie.getMovie_Duration() %> min</h3>
                                    <h3><b>Release Date&nbsp;</b>: <%= movie.getMovie_Release_Date() %></h3>
                                </div>
                                </div>
                                <h4 style="margin-top: 20px; font-weight: bold;">About Movie</h4>
                                <p><%= movie.getMovie_Description() %></p>
                                <h4 style="margin-top: 20px; font-weight: bold;">Director</h4>
                                <p><%= movie.getMovie_Director() %></p>
                                <h4 style="margin-top: 20px; font-weight: bold;">Star Cast</h4>
                                <p><%= movie.getMovie_Casts() %></p>

                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nestedModal<%= movie.getMovie_Id() %>">Select Seats</button>

                                <div class="modal fade bd-example-modal-lg" id="nestedModal<%= movie.getMovie_Id() %>" tabindex="-1" role="dialog" aria-labelledby="nestedModalTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="nestedModalTitle"><%= movie.getMovie_Name() %></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body" style="align-items: center;">
                                                <form action="Booking" method="post">
                                                    <div class="bo" style="display:flex;">
                                                        <div>
                                                            <img class="card-img-top custom-card-image" src="images/<%= movie.getMovie_Poster() %>" alt="Card image" style="height: 150px; width: 150px;">
                                                            <input type="hidden" class="form-control moviename" name="MovieImage" value="<%= movie.getMovie_Poster() %>">
                                                            <input type="hidden" class="form-control moviename" name="moviename" value="<%= movie.getMovie_Name() %>">
                                                           
                                                        </div>
                                                        <div style="margin-left: 20%;margin-top:3%;">
                                                        	<p><italic>Each Seat Costs: 200$</italic></p>
                                                            <h7 style="margin-left: 20%; margin-top:5%; margin-bottom:2%;">Total Seats: </h7>
                                                            <br>
                                                            <div class="def-number-input number-input safari_only" style="margin-top:7%">
                                                                <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
                                                                <input class="quantity" min="0" name="quantity" value="1" type="number">
                                                                <button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="timings">
                                                        <div class="theatres-and-times">
                                                            <div class="theatres" style="margin-left: 2%">
                                                                <% 
                                                                    List<Theater> theaters = (List<Theater>) request.getAttribute("theaters");
                                                                    if (theaters != null) {
                                                                        for (Theater theater : theaters) { %>
                                                                            <div style="margin-right: 5px;">
                                                                                <input type="radio" name="theatre_name" id="<%= theater.getTheater_Id() %>_<%= movie.getMovie_Id() %>" value="<%= theater.getTheater_Name() %>" checked /> 
                                                                                <label for="<%= theater.getTheater_Id() %>_<%= movie.getMovie_Id() %>" class="theatre" style="justify-content:space-between;"><%= theater.getTheater_Name() %></label>
                                                                            </div>
                                                                        <% } 
                                                                    } %>
                                                            </div>
                                                            <div class="times">
                                                                <% 
                                                                    List<ShowTimes> showList = (List<ShowTimes>) request.getAttribute("showtime");
                                                                    if (showList != null && !showList.isEmpty()) { 
                                                                        for (ShowTimes showtime : showList) { %>
                                                                            <div style="margin-left: 2%">
                                                                                <input type="radio" name="time_start" id="time_<%= showtime.getShowtime_Id() %>_<%= movie.getMovie_Id() %>" value="<%= showtime.getStart_Time() %>" checked /> 
                                                                                <label for="time_<%= showtime.getShowtime_Id() %>_<%= movie.getMovie_Id() %>" class="time"><%= showtime.getStart_Time() %></label>
                                                                            </div>
                                                                        <% } 
                                                                    } else { %>
                                                                        <div>No show times available.</div>
                                                                    <% } %>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <button type="submit" class="btn btn-primary" style="margin-top: 4%">Select Seats</button>
                                                    </div>
                                                </form>
                                                <br>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="close" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <%
                if ((movieCount + 1) % 100 == 0 || movieCount == movies.size() - 1) {
            %>
        </div><br>
       
        <%
                }
                movieCount++;
            }
            
        }
        %>
    
    </div>
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
    <%@ include file="footer.html"%>
    
</body>
</html>