package com.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.TheaterDao;
import com.Db.DbConnection;
import com.Model.Theater;

@WebServlet("/viewTheater")
public class TheaterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String Select_QUERY = "Select * from movies";
	private static final String Insert_QUERY = "INSERT INTO Theater (theaterName, address, capacity) VALUES (?, ?, ?)"; 
	private static final String Delete_QUERY = "DELETE FROM Theater WHERE theaterId = ?";
	private static final String updateSql = "UPDATE theaters SET TheatrName = ?, address = ? WHERE theaterId = ?";

	Connection con = DbConnection.getConnection();

	Theater thea = new Theater();

	public TheaterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		  TheaterDao theaterDao = new TheaterDao(); 
		  List<Theater> thea = theaterDao.displayTheaterdetails();
		  request.setAttribute("theaters", thea);
		  RequestDispatcher dispatcher = request.getRequestDispatcher("viewTheater.jsp");
		  dispatcher.forward(request, response);
		  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PreparedStatement pstmt = null;
	    Connection con = null;

System.out.println("in post");

		try {
			con = DbConnection.getConnection();
			String tName = request.getParameter("theaterName");
			String TLocation = request.getParameter("theaterLocation");
			int capacity = Integer.parseInt(request.getParameter("seatingCapacity"));

			String insertQuery = "INSERT INTO Theater (theatrName, address, capacity) VALUES (?, ?, ?)";
			pstmt = con.prepareStatement(insertQuery);

			pstmt.setString(1, tName);
			pstmt.setString(2, TLocation);
			pstmt.setInt(3, capacity);

			pstmt.executeUpdate();

            con.commit();

		 } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) {
	                    pstmt.close();
	                }
	                if (con != null) {
	                    con.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
		}
	
}