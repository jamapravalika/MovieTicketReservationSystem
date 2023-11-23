<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Model.Bookings" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booked Movie Tickets</title>
    <link rel="stylesheet" href="assets/css/adminHeader.css">
    <link rel="stylesheet" type="text/css" href="AddMovies.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="aHeader.jsp"%>
<div class="container" style="margin-top:5%">
    <h1>Booked Movie Tickets</h1>
    <table class="table table-hover">
        <tr>
        	<th></th>
            <th>User Email</th>
            <th>Movie Name</th>
            <th>Theater Name</th>
            <th>Show Time</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Booking Date</th>
        </tr>
        <% SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss"); %>
        <% for (Bookings booking : (List<Bookings>) request.getAttribute("bookings")) { %>
            <tr>
            	<td><img src="images/<%= booking.getMoviePoster() %>" alt="" style="width: 80px; height: 100px;"></td>
                <td><%= booking.getUseremail() %></td>
                <td><%= booking.getMovieName() %></td>
                <td><%= booking.getTheaterName() %></td>
                <td><%= timeFormat.format(booking.getShowTime()) %></td>
                <td><%= booking.getQuantity() %></td>
                <td><%= booking.getTotalPrice() %></td>
                <td><%= booking.getBookingDate() %></td>
            </tr>
        <% } %>
    </table>
    </div>
</body>
</html>
