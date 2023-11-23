package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.MovieDao;

/**
 * Servlet implementation class DeleteMovieServlet
 */
public class DeleteMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMovieServlet() {
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
		System.out.print("delete");
		String movieid =request.getParameter("movieId");
		Integer movid=Integer.parseInt(movieid);
		
		System.out.print(movid);
		try {
		MovieDao movieDao = new MovieDao();
		movieDao.DeleteMovies(movid);
		response.sendRedirect("/MovieTicketReservation/viewmovies");
	 } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("Error.jsp");
     }
 }
	

}
