<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.Model.Movie" %>
<%@ page import="com.Dao.MovieDao" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Edit Movie</title>
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
    <h1>Edit Movie</h1>
<div class="container" style="max-width: 660px; margin-top: 5%;">
    <form action="Update_movieServlet" method="post">
        <% 
        int movieID = Integer.parseInt(request.getParameter("movieID"));

        MovieDao movieDao = new MovieDao();
        Movie movie = movieDao.getMovieById(movieID);
        %>
        
        	<div class="form-group">
            	<input type="hidden" name="movieId" value="<%= movie.getMovie_Id() %>">
            </div>
            <div class="form-group">
            	<label for="movieName">Movie Name:</label>
            	<input type="text" name="movieName" value="<%= movie.getMovie_Name() %>" required>
            </div>
            <div class="form-group">
            	<label for="director">Director:</label>
            	<input type="text" name="director" value="<%= movie.getMovie_Director() %>" required>
            </div>
            <div class="form-group">
            	<label for="releasedate">Release Date:</label>
            	<input type="date" name="releasedate" value="<%= movie.getMovie_Release_Date() %>" required>
            <div class="form-group">
            	<label for="casts">Casts:</label>
            	<input type="text" name="casts" value="<%= movie.getMovie_Casts() %>" required>
            </div>
            <div class="form-group">
            	<label for="description">Description:</label>
            	<textarea name="description" rows="4" required><%= movie.getMovie_Description() %></textarea>
            </div>
            <div class="form-group">
            	<label for="duration">Duration (minutes):</label>
            	<input type="number" name="duration" value="<%= movie.getMovie_Duration() %>" required>
            </div>
            <div class="form-group">
            	<label for="trailerlink">Trailer Link:</label>
            	<input type="url" name="trailerlink" value="<%= movie.getTrailerlink() %>" required>
            </div>
            <div class="form-group">
            	<label for="genre">Genre:</label>
            	<input type="text" name="genre" value="<%= movie.getGenre() %>" required>
            </div>
            <button type="submit" class="btn btn-primary" style="color: #fff;">Update Movie</button>
        
    </form>
    </div>

</body>

</html>
