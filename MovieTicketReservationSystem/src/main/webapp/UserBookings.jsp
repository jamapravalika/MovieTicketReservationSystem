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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="Header.jsp"%>
<div class="container">
    <h1>Booked Movie Tickets</h1>
    <table class="table table-hover">
        <tr>
        <th></th>
            <th>Movie Name</th>
            <th>Theater Name</th>
            <th>Show Time</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Booking Date</th>
            <th></th>
        </tr>
        <% SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss"); %>
        
        <% 
                List<Bookings> bookingsList = (List<Bookings>) request.getAttribute("bookings");
                for (int i = bookingsList.size() - 1; i >= 0; i--) {
                    Bookings booking = bookingsList.get(i);
            %>
        
			<tr>
            	<td><img src="images/<%= booking.getMoviePoster() %>" alt="" style="width: 80px; height: 100px;"></td>
                <td><%= booking.getMovieName() %></td>
                <td><%= booking.getTheaterName() %></td>
                <td><%= timeFormat.format(booking.getShowTime()) %></td>
                <td><%= booking.getQuantity() %></td>
                <td><%= booking.getTotalPrice() %></td>
                <td><%= booking.getBookingDate() %></td>
            	<td>
                    <% if (i == bookingsList.size() - 1) { %>
                    	<form action="DeleteBooking" method="post">
    						<input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
    						<button type="submit" class="btn btn-danger">Cancel Booking</button>
						</form>
                       <%--  <a href="DeleteBooking?bookingId=<%= booking.getBookingId() %>">Delete</a> --%>
                    <% } %>
                </td>
            
            </tr>
        <% } %>
    </table>
    </div>
    <%@ include file="footer.html"%>
</body>
</html>
