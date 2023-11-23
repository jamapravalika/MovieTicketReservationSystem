<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/Header.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

  <title>Nav</title>
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
          <a class="nav-link" href="/MovieTicketReservation/moviepage"><i class="fa-solid fa-video"></i> Movies</a>
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
            <li><a class="dropdown-item" href="/MovieTicketReservation/UserBookings">History</a></li>
            <li><a class="dropdown-item" href="login.jsp">Logout</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" action="SearchServlet" method="get">
      	<label for="keyword">Search:</label>
        <input class="form-control me-2" type="text" placeholder="Search">
        <i class="fas fa-search"></i>
      </form>
    </div>
  </div>
</nav>

<div class="container-fluid mt-3">
  
</div>

</body>
</html>
