package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.MovieDao;

/**
 * Servlet implementation class RemoveServlet
 */
public class RemoveMoviesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveMoviesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 // response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */


		   protected void doPost(HttpServletRequest request, HttpServletResponse response)
		            throws ServletException, IOException {
		        int movieId = Integer.parseInt(request.getParameter("movieId"));

		        MovieDao movieDao = new MovieDao();
		        movieDao.DeleteMovies(movieId);

		        response.sendRedirect("/MovieTicketReservation/MoviesPage1");
		    }
		

	}


 