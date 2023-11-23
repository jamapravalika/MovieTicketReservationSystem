package com.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.SeatsDao;
import com.Db.DbConnection;
import com.Model.Seats;

/**
 * Servlet implementation class SeatServlet
 */
public class SeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SeatsDao seatsdao = new SeatsDao();

	    List<Seats> seats = seatsdao.getAllSeats();
	   
	    request.setAttribute("seatss", seats);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("show.jsp");
	    dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = DbConnection.getConnection();
		  try {
			conn.setAutoCommit(false);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		  PreparedStatement pstmt = null;
		  String insertQuery ="INSERT INTO Seats (MovieName, seatNumber, price, isBooked) VALUES (?, ?, ?, ?);";
		  
		  int seat_id=Integer.parseInt(request.getParameter("seatId"));
		  String movieName = request.getParameter("movieName"); 
		  int seatNumber = Integer.parseInt(request.getParameter("seatNumber")); 
		  int price = Integer.parseInt(request.getParameter("price"));
		  boolean isBooked = request.getParameter("isBooked") != null;
		/* float totalPrice = seatNumber * 200; */

		  
		  System.out.println("Movie Id: " + movieName);
		  System.out.println("Seat Number: " + seatNumber);
		  System.out.println("Price: " + price); 
		  System.out.println("Is Booked: " + isBooked);
		  
		  
		  
		  try { pstmt = conn.prepareStatement(insertQuery);
		  
		  pstmt.setString(1, movieName); 
		  pstmt.setInt(2, seatNumber); 
		  pstmt.setInt(3, price); 
		  pstmt.setBoolean(4, isBooked);
		  
			/* pstmt.setFloat(5, totalPrice); */
		  
		  
		  int row = pstmt.executeUpdate();
		  
		  conn.commit();
		  
		  if (row > 0) { 
			  System.out.println("Seats successfully"); 
		} else {
		  System.out.println("Failed to Insert Seats"); 
		  } 
		} catch (Exception e) {
		  e.printStackTrace(); 
		  
		} finally { 
			
			try {
				if (pstmt != null) { 
					pstmt.close(); 
				}
		  if (conn != null) { 
			  conn.close(); 
		} 
	} catch (SQLException e) {
		  e.printStackTrace(); 
		  }
	}
		  
		  response.sendRedirect("seat.jsp");	
  
	}

}
