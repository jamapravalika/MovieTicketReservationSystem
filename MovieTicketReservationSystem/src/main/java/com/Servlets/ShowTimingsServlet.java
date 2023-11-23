package com.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Db.DbConnection;
import com.Model.ShowTimes;

/**
 * Servlet implementation class ShowTimingsServlet
 */
public class ShowTimingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String Insert_QUERY = "INSERT INTO Showtimes (movieName, startTime, endTime, theaterId) VALUES (?, ?,?,?, ?);";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowTimingsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		/*
		 * String action = request.getServletPath(); try { switch (action) { case
		 * "/insert" : AddShowTiming(request ,response); break; case "/delete" :
		 * DeleteShowTime(request ,response); break; case "/update" :
		 * UpdateShowTimes(request ,response); break; default : listShowTimes(request
		 * ,response); } } catch (Exception e ) { e.printStackTrace(); }
		 */
	}

	/*
	 * private void listShowTimes(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * 
	 * List<ShowTimes> list= ShowTimeDao.ListAllShowTime();
	 * request.setAttribute("list", list); RequestDispatcher dispatcher =
	 * request.getRequestDispatcher("AdmShowTime.jsp"); dispatcher.forward(request,
	 * response);
	 * 
	 * }
	 * 
	 * private void UpdateShowTimes(HttpServletRequest request, HttpServletResponse
	 * response) { // TODO Auto-generated method stub int id =
	 * Integer.parseInt(request.getParameter("id")); Time startTime =
	 * Time.valueOf(request.getParameter("Start_Time")); Time endTime
	 * =Time.valueOf(request.getParameter("End_Time")); int theaterId =
	 * Integer.parseInt(request.getParameter("theater_Id"));
	 * 
	 * ShowTimes show=new ShowTimes(id, Start_Time, End_Time, theater_Id);
	 * ShowTimeDao.UpdateShowTime(); response.sendRedirect("list"); }
	 * 
	 * private void DeleteShowTime(HttpServletRequest request, HttpServletResponse
	 * response) { // TODO Auto-generated method stub int id =
	 * Integer.parseInt(request.getParameter("id")); ShowTimes show= new
	 * ShowTimes(id); ShowTimeDao.DeleteShowTime(show);
	 * response.sendRedirect("list"); }
	 */

	private void AddShowTiming(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Connection con = DbConnection.getConnection();
		try { 
			 ShowTimes Show = new ShowTimes(); 
		        PreparedStatement statement = con.prepareStatement(Insert_QUERY);
		        statement.setString(1,Show.getMovie_name().getMovie_Name());
		        statement.setTime(2,Show.getStart_Time());
		        statement.setTime(3, Show.getEnd_Time());
		        statement.setInt(4,Show.getTheater_id().getTheater_Id());
		        statement.executeUpdate();
		    }
		catch (Exception e) {
			System.out.println("Exception" + e.getLocalizedMessage());
		}
		finally {
			System.out.println("Finally Block");
		}
		response.sendRedirect("list");
		
	}

}


