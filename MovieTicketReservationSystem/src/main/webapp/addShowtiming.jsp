<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Show Timing</title>
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
    <section id="movies">
        <h2>Show Timings</h2>
        <a>
            <div class="container" style="max-width: 660px; margin-top: 5%;">
                <h2 style="text-align: center; padding: 0">Add Show Timings</h2>
                <br>
                </br>
                <!-- Add Show Timing Form -->
                <form action="AddShowServlet" method="post">
                    <!-- Input fields for Movie_Name, Start_Time, End_Time, and theater_id -->
                    <div class="form-group">
                        <input type="text" class="form-control" name="Movie_Name" placeholder="Movie Name" required>
                    </div>
                    <div class="form-group">
                        <input type="time" class="form-control" name="Start_Time" required>
                    </div>
                    <div class="form-group">
                        <input type="time" class="form-control" name="End_Time" required>
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" name="theater_id" placeholder="Theater ID" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" style="color: #fff;">Add Show Time</button>
                    </div>
                </form>
            </div>
        </a>
    </section>
</body>
</html>
