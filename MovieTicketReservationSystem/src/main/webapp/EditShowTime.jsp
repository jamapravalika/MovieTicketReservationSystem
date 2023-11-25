<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.ShowTimes" %>
<%@ page import="com.Dao.ShowTimeDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Show Time</title>
    <link rel="stylesheet" href="assets/css/adminHeader.css">
    <link rel="stylesheet" type="text/css" href="AddMovies.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style>
        .dropdown, .dropup {
            position: static;
            margin-top: 4px;
        }
        a:hover {
      text-decoration: none;
    }
    </style>
</head>
<body>
<%@ include file="aHeader.jsp" %>
        <section id="showtime">
        <div class="container" style="max-width: 660px; margin-top: 5%;">
        <h1>Edit Show Time</h1>
        <form action="EditShowServlet" method="post">
          <%
			int showtime = Integer.parseInt(request.getParameter("ShowTime_Id"));
			System.out.println("ShowTime_Id parameter value: " + showtime);
			
        	ShowTimeDao showDao = new ShowTimeDao();
        	ShowTimes show = showDao.getshowtimeId(showtime);

			%>
            <!-- Your form and input fields -->
            	<div class="form-group">
                	<input type="hidden" name="Showtime_Id" value="<%= show.getShowtime_Id() %>">
            	</div>
            	<div class="form-group">
               		<input type="text" name="Movie_Name" placeholder="Movie Name" value="<%= show.getMovie_name().getMovie_Name() %>" required>
            	</div>
            	<div class="form-group">
                	<input type="time" name="Start_Time" value="<%= show.getStart_Time() %>" required>
            	</div>
            	<div class="form-group">
                	<input type="time" name="End_Time" value="<%= show.getEnd_Time() %>" required>
            	</div>
            	<div class="form-group">
              	  <input type="number" name="theater_id" placeholder="Theater ID" value="<%= show.getTheater_id().getTheater_Id() %>" required>
            	</div>
            	<div class="form-group">
                	<button type="submit" class="btn btn-primary" style="color: #fff;">Update Show Time</button>
            	</div>

                </form>
            </div>
    </section>
</body>
</html>