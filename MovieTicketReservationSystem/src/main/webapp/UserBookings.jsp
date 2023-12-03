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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
                    <!-- Trigger Bootstrap modal -->
                    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModalCenter">&#8942;</button>

                    <!-- Bootstrap modal -->
                    <div id="exampleModalCenter" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Confirmation</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                    <form action="DeleteBooking" method="post">
                                        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                                        <p>Are you sure you want to delete this booking?</p>
                                        <button type="submit" class="btn btn-danger" style="margin-left:25%;">Cancel Booking</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
<%@ include file="footer.html"%>
</body>
</html>
