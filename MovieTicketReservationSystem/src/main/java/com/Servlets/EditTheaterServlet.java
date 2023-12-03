package com.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.TheaterDao;
import com.Model.Theater;

/**
 * Servlet implementation class EditTheaterServlet
 */
public class EditTheaterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTheaterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int theaterId = Integer.parseInt(request.getParameter("theaterId"));
        TheaterDao theaterDao = new TheaterDao();
        Theater theater = theaterDao.getTheaterById(theaterId);

        // Set updated values from the form
        theater.setTheater_Name(request.getParameter("theaterName"));
        theater.setAddress(request.getParameter("theaterLocation"));
        theater.setCapacity(Integer.parseInt(request.getParameter("seatingCapacity")));

        // Call the editTheater method to update the theater
        theaterDao.editTheater(theater);

        // Redirect to a page after updating (you can change the URL accordingly)
        response.sendRedirect(request.getContextPath() + "/viewTheater");
	}

}
