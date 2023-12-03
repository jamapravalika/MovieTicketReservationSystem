<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Model.Theater" %>
<%@ page import="com.Dao.TheaterDao" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Edit theater</title>
    <link rel="stylesheet" href="assets/css/adminHeader.css">
    <link rel="stylesheet" type="text/css" href="AddMovies.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style>
        .dropdown, .dropup {
            position: static;
            margin-top: 4px;
        }
    </style>
</head>

<body>

<%@ include file="aHeader.jsp" %>
    <h1>Edit theater</h1>
<div class="container" style="max-width: 660px; margin-top: 5%;">
            
            <form action="EditTheaterServlet" method="post">
             <% 
               int theaterID = Integer.parseInt(request.getParameter("theaterId"));
                TheaterDao theaterDao = new TheaterDao();
                Theater theater = theaterDao.getTheaterById(theaterID); 
    		     %> 

    		      <input type="hidden" name="theaterId" value="<%= theater.getTheater_Id() %>"> 
                    <div class="form-group">
                        <label for="theaterName" class="form-label">Theater Name</label>
                        <input type="text" class="form-control" id="theaterName" name="theaterName" value="<%= theater.getTheater_Name() %>" required>
                    </div>
                     
                    <div class="form-group">
                        <label for="theaterLocation" class="form-label">location </label>
                        <input type="text" class="form-control" id="theaterLocation" name="theaterLocation" value="<%= theater.getAddress() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="seatingCapacity" class="form-label">Seating Capacity</label>
                        <input type="number" class="form-control" id="seatingCapacity" name="seatingCapacity" value="<%= theater.getCapacity() %>"required>
                    </div>
                    <div class="buttons">
                        <button type="submit" class="btn btn-primary" style="color: #fff;">Update Theater</button>
                    </div>
               </form>
              
     </div>
    </section>
</body>
</html>   