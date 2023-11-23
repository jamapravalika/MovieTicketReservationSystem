<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List" %>
<%@ page import="com.Model.Theater" %> 
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.io.InputStream" %>



<!doctype html>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Therters</title>
<link rel="stylesheet" href="assets/css/adminHeader.css">
    <link rel="stylesheet" type="text/css" href="AddMovies.css">
<link rel="stylesheet" href="assets/css/style-starter.css">
<link href="//fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
</head>
<style>
body {
     text-align: center;
 }
.container{
	padding :0 5%;
}



</style>

<body>
	<!-- header -->
	 <%@ include file="aHeader.jsp" %>
	

   <h1>List of Movies</h1>
    <div>
  <table class="table" style="max-width: 80%;margin: auto; margin-top: 5%;">
  <thead class="table">
    <tr class="table-danger">
            <th scope="col">Theater Name</th>
            <th scope="col">address</th>
            <th scope="col">capacity</th>
            <th scope="col">Action</th>
        </tr>
        
        <% List<Theater> theaters = (List<Theater>) request.getAttribute("theaters");
   if (theaters != null) {
       for (Theater Theater : theaters) { %>
        <tr>
            <td><%= Theater.getTheater_Name() %></td>
            <td><%= Theater.getAddress() %></td>
            <td><%= Theater.getCapacity() %></td>
            
            <td><a href="EditMovie.jsp"><button type="button" class="btn btn-success">Edit</button></a><a href=""><button type="button" class="btn btn-danger">Delete</button></a></td>
        </tr>
    <% } 
   
       }%>
  
    </table>


	