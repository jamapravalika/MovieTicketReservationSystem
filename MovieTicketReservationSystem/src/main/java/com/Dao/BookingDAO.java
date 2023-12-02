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
	@Override
	public void createBooking(String UserEmail, String MovieName,String TheaterName,int Quantity, Time startTime, float TotalPrice,Date BookingDate, String MoviePoster) {
		// TODO Auto-generated method stub
		Connection conn = null;
        try {
            conn = DbConnection.getConnection();
            conn.setAutoCommit(false);  

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

            conn.commit(); 
        } catch (SQLException e) {
            e.printStackTrace();
            rollback(conn);  
        } finally {
            closeConnection(conn); 
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
	
	@Override
	public boolean UpdateBookings(int Booking_Id) {
		// TODO Auto-generated method stub
		Connection conn = DbConnection.getConnection();
        final String UPDATE_QUERY = "UPDATE Bookings WHERE BookingId = ?;";
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
	@Override
	public void deleteBooking(int Booking_Id) {
		// TODO Auto-generated method stub
		Connection conn = DbConnection.getConnection();
        final String QUERY = "DELETE FROM Bookings WHERE BookingId = ?;";
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
	@Override
	public List<Bookings> ShowBooking(HttpServletRequest request) {
	    // TODO Auto-generated method stub
	    Connection conn = DbConnection.getConnection();
	    final String QUERY = "SELECT * FROM Bookings";
	    List<Bookings> bookings = new ArrayList<>();

	    try {
	        Statement stmt = conn.createStatement();
	        ResultSet result = stmt.executeQuery(QUERY);

	        while (result.next()) {
	        	Bookings booking = new Bookings();
	        	booking.setBookingId(result.getInt("BookingId"));
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
	@Override
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
	        	booking.setBookingId(result.getInt("BookingId"));
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
	@Override
	public List<Bookings> ShowBookingByUserAndMovie(HttpServletRequest request) {
        List<Bookings> bookedTickets = new ArrayList<>();

        try (Connection connection = DbConnection.getConnection()) {
            String userEmail = (String) request.getSession().getAttribute("useremail");
            String movieName = (String) request.getSession().getAttribute("MovieName");

            String sql = "SELECT * FROM bookings WHERE useremail = ? AND MovieName = ?";
            System.out.println("SQL Query: " + sql);
            System.out.println("User Email: " + userEmail);
            System.out.println("Movie Name: " + movieName);

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, userEmail);
                statement.setString(2, movieName);

                try (ResultSet result = statement.executeQuery()) {
                    int rowCount = 0;
                    while (result.next()) {
                        Bookings booking = new Bookings();
                        booking.setBookingId(result.getInt("BookingId"));
                        booking.setUseremail(result.getString("useremail")); 
                        booking.setMovieName(result.getString("MovieName")); 
                        booking.setTheaterName(result.getString("TheaterName"));
                        booking.setShowTime(result.getTime("ShowTime"));
                        booking.setQuantity(result.getInt("quantity"));
                        booking.setTotalPrice(result.getFloat("totalPrice")); 
                        booking.setBookingDate(result.getTimestamp("bookingDate")); 
                        booking.setMoviePoster(result.getString("moviePoster"));
                        
                        bookedTickets.add(booking);
                        rowCount++;
                    }
                    System.out.println("Number of rows in result set: " + rowCount);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookedTickets;
    }
	 @Override
	    public Bookings getBookingById(int bookingId) {
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet result = null;
	        Bookings booking = null;

	        try {
	            connection = DbConnection.getConnection();
	            String sql = "SELECT * FROM Bookings WHERE BookingId = ?";
	            preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setInt(1, bookingId);
	            result = preparedStatement.executeQuery();

	            if (result.next()) {
	            	booking = new Bookings();
	            	booking.setBookingId(result.getInt("BookingId"));
                    booking.setUseremail(result.getString("useremail")); 
                    booking.setMovieName(result.getString("MovieName")); 
                    booking.setTheaterName(result.getString("TheaterName"));
                    booking.setShowTime(result.getTime("ShowTime"));
                    booking.setQuantity(result.getInt("quantity"));
                    booking.setTotalPrice(result.getFloat("totalPrice")); 
                    booking.setBookingDate(result.getTimestamp("bookingDate")); 
                    booking.setMoviePoster(result.getString("moviePoster"));   
	            }
	        } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		    	closeConnection(connection);
		    }

	        return booking;
	    }
	 @Override
	 public int getLastInsertedBookingId() {
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet result = null;
		    int lastInsertedBookingId = -1;

		    try {
		        connection = DbConnection.getConnection();
		        String sql = "SELECT MAX(BookingId) AS lastId FROM Bookings";
		        preparedStatement = connection.prepareStatement(sql);
		        result = preparedStatement.executeQuery();

		        if (result.next()) {
		            lastInsertedBookingId = result.getInt("lastId");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        closeConnection(connection);
		    }

		    return lastInsertedBookingId;
		}
}
