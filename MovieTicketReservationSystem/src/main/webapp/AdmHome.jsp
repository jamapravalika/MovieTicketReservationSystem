<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Admin Panel -MOVIE ONLINE BOOKING</title>
    <link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <header>
      <h1>Admin-Dashboard</h1>
  </header>
  <style>
  .dropdown, .dropup {
    position: static;
    margin-top:4px;
}
</style>
</head>
<body>
  <div>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['users', 'Length'],
          ['user 1', 12.2],
          ['user 2', 9.1],
          ['user 3', 12.2],
          ['user 4', 22.9],
          ['user 5', 0.9],
          ['user 6', 36.6],
          ['user 7', 9.1],
          ['user 8', 30.5],
          ['user 9', 6.1],
          ['user 10', 2.7]]);
         var options = {
          title: 'USERS PAYMENT CHART',
          legend: { position: 'none' },
          colors: ['darkred'] };
         var chart = new google.visualization.Histogram(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <nav>
      <ul>
        <li><a href="AdmHome.jsp"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="AddMovies.jsp"><i class="fa fa-film"></i> Add Movies</a></li>
        <li><a href="theater.jsp"><i class="fa fa-building"></i> Theaters</a></li>
        <li><a href="addShowtiming.jsp"><i class="fa fa-building"></i> Show Timings</a></li>
        <li><a href="/MovieTicketReservation/UserTable"><i class="fa fa-users"></i> Users</a></li>
         <li class="nav-item dropdown">
        <div class="dropdown">
  			<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    		View
  		</button>
  		<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
    		<a href="/MovieTicketReservation/viewmovies"><button class="dropdown-item" type="button">Movies</button></a>
    		<a href="/MovieTicketReservation/viewTheater"><button class="dropdown-item" type="button">Theaters</button></a>
    		<a href="/MovieTicketReservation/viewshowtime"><button class="dropdown-item" type="button">Show Timings</button></a>
  		</div>
		</div>
		</li>
      </ul>
    </nav>
    
   
    <div id="chart_div" style="width: 1100px; height: 400px;"></div>
</body>
</html>

