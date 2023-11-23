<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.Model.Movie" %> 
<%@ page import="com.Model.Bookings" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="assets/css/viewTicket.css">
</head>
<body>
    <fieldset>
        <h2>E-Ticket</h2>
        <div class="ticket-body">
            <div class="ticket">
                <div class="holes-top"></div>
                <div class="title">
                <% SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss"); %>
                    <% for (Bookings booking : (List<Bookings>) request.getAttribute("bookings")) { %>
                    <H2 class="cinema"><%= booking.getTheaterName() %></H2>
                    <p class="movie-title"><%= booking.getMovieName() %></p>
                </div>
                <div class="info">
                    
                        <div class="poster">
                            <img class="card-img-top custom-card-image" src="images/<%= booking.getMoviePoster() %>" alt="Card image" style="height: 190px; width: 280px; margin-left: 10%;">
                        </div>
                        <table class="info-table ticket-table">
                            <tr>
                                <th>Movie</th>
                                <th>Slot</th>
                                <th>SEATS</th>
                            </tr>
                            <br><br>
                            
                            <tr style="margin-top: 2%;">
                                <td class="bigger"><%= booking.getMovieName() %></td>
                                <td class="bigger"><%= timeFormat.format(booking.getShowTime()) %></td>
                                <td class="bigger"><%= booking.getQuantity() %></td>
                            </tr>
                        </table>
                        <br>
                        <table class="info-table ticket-table">
                            <tr>
                                <th>PRICE</th>
                                <th>DATE</th>
                            </tr>
                            <tr>
                                <td><%= booking.getTotalPrice() %></td>
                                <td><%= booking.getBookingDate() %></td>
                          
                            </tr>
                        </table>
                    <% } %>
                </div>
                <div class="holes-lower"></div>
                <div class="serial">
                    <table class="barcode ticket-table">
                        <!-- rest of the barcode table code -->
                    </table>
                    <table class="numbers ticket-table">
                        <!-- rest of the numbers table code -->
                    </table>
                </div>
            </div>
        </div>
        <input type="button" name="previous-step" class="home-page-btn" value="Browse to Home Page"
            onclick="location.href='Home.jsp';" />
    </fieldset>
</body>
</html>
