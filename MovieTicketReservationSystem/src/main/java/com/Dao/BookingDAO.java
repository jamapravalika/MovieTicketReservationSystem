package com.Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.Db.DbConnection;
import com.Model.Bookings;

public class BookingDAO implements BookingDAOIntr {

	public void createBooking(String UserEmail, String MovieName,String TheaterName,int Quantity, Time startTime, float TotalPrice,Date BookingDate, String MoviePoster) {
		// TODO Auto-generated method stub
		Connection conn = null;
        try {
            conn = DbConnection.getConnection();
            conn.setAutoCommit(false);  // Disable auto-commit to manage transactions

            final String INSERT_QUERY = "INSERT INTO Bookings (useremail, MovieName, TheaterName, ShowTime,quantity, totalPrice, bookingDate, moviePoster) VALUES (?, ?, ?,?, ?, ?, ?,?);";

            try (PreparedStatement pstmt = conn.prepareStatement(INSERT_QUERY)) {
                pstmt.setString(1, UserEmail);
                pstmt.setString(2, MovieName);
                pstmt.setString(3, TheaterName);
                pstmt.setTime(4, startTime);
                pstmt.setInt(5, Quantity);
                pstmt.setFloat(6, TotalPrice);
                pstmt.setTimestamp(7, new Timestamp(BookingDate.getTime()));
                pstmt.setString(8, MoviePoster);

                int rowsAffected = pstmt.executeUpdate();
                System.out.println("ShowTime value to be inserted: " + startTime);

                if (rowsAffected > 0) {
                    System.out.println("Booking created successfully");
                } else {
                    System.out.println("Failed to create the booking");
                }
            }

            conn.commit();  // Commit the transaction
        } catch (SQLException e) {
            e.printStackTrace();
            rollback(conn);  // Rollback the transaction in case of an exception
        } finally {
            closeConnection(conn);  // Close the database connection
        }
    }
	
	 private void rollback(Connection connection) {
	        if (connection != null) {
	            try {
	                connection.rollback();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    private void closeConnection(Connection connection) {
	        if (connection != null) {
	            try {
	                connection.setAutoCommit(true);
	                connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	

	public boolean confirmBooking(int Booking_Id) {
		// TODO Auto-generated method stub
		Connection conn = DbConnection.getConnection();
        final String UPDATE_QUERY = "UPDATE BOOKINGS SET CONFIRMED = ? WHERE BOOKINGID = ?;";
        try {
            PreparedStatement pstmt = conn.prepareStatement(UPDATE_QUERY);
            pstmt.setBoolean(1, true);
            pstmt.setInt(2, Booking_Id);

            int cnt = pstmt.executeUpdate();
            if (cnt != 0) {
                System.out.println("Confirmed Successfully !!!");
            }
            return cnt > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Finally Block");
        }
		return false;
	}

	public void deleteBooking(int Booking_Id) {
		// TODO Auto-generated method stub
		Connection conn = DbConnection.getConnection();
        final String QUERY = "DELETE FROM BOOKINGS WHERE BOOKINGID = ?;";
        try {
            PreparedStatement pstm = conn.prepareStatement(QUERY);
            pstm.setInt(1, Booking_Id);
            int cnt = pstm.executeUpdate();
            if (cnt != 0) {
                System.out.println("Deleted Successfully!!! " + Booking_Id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Finally Block");
        }
	}

	public List<Bookings> ShowBooking(HttpServletRequest request) {
	    // TODO Auto-generated method stub
	    Connection conn = DbConnection.getConnection();
	    final String QUERY = "SELECT * FROM bookings";
	    List<Bookings> bookings = new ArrayList<>();

	    try {
	        Statement stmt = conn.createStatement();
	        ResultSet result = stmt.executeQuery(QUERY);

	        while (result.next()) {
	        	Bookings booking = new Bookings();
	            booking.setUseremail(result.getString("useremail")); 
	            booking.setMovieName(result.getString("MovieName")); 
	            booking.setTheaterName(result.getString("TheaterName"));
	            booking.setShowTime(result.getTime("ShowTime"));
	            booking.setQuantity(result.getInt("quantity"));
	            booking.setTotalPrice(result.getFloat("totalPrice")); 
	            booking.setBookingDate(result.getTimestamp("bookingDate")); 
	            booking.setMoviePoster(result.getString("moviePoster"));
	            bookings.add(booking);
	        }

	        request.setAttribute("bookings", bookings); 
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        System.out.println("Finally Block");
	    }

	    return bookings;
	}
	public List<Bookings> ShowBookingByUserEmail(HttpServletRequest request) {
	    // TODO Auto-generated method stub
		List<Bookings> bookedTickets = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        try {
            conn = DbConnection.getConnection();
            String selectQuery = "SELECT * FROM Bookings WHERE useremail = ?";
            pstmt = conn.prepareStatement(selectQuery);

            String useremail = (String) request.getSession().getAttribute("useremail");
            pstmt.setString(1, useremail);

            result = pstmt.executeQuery();

	        while (result.next()) {
	        	Bookings booking = new Bookings();
	            booking.setUseremail(result.getString("useremail")); 
	            booking.setMovieName(result.getString("MovieName")); 
	            booking.setTheaterName(result.getString("TheaterName"));
	            booking.setShowTime(result.getTime("ShowTime"));
	            booking.setQuantity(result.getInt("quantity"));
	            booking.setTotalPrice(result.getFloat("totalPrice")); 
	            booking.setBookingDate(result.getTimestamp("bookingDate")); 
	            booking.setMoviePoster(result.getString("moviePoster"));
	            bookedTickets.add(booking);
	        }

	        request.setAttribute("bookings", bookedTickets); 
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        System.out.println("Finally Block");
	    }

	    return bookedTickets;
	}
}






