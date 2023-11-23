package com.Servlets;

import java.io.IOException;
import java.sql.Time;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ShowTimeDao;
import com.Dao.ShowTimingIntrf;
import com.Model.Movie;
import com.Model.ShowTimes;
import com.Model.Theater;

/**
 * Servlet implementation class EditShowServlet
 */
public class EditShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ShowTimingIntrf showDao = new ShowTimeDao();
		List<ShowTimes> showtime = showDao.ListAllShowTime();
		request.setAttribute("showtime", showtime);
		RequestDispatcher dispatcher = request.getRequestDispatcher("EditShowTime.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int showtimeId = Integer.parseInt(request.getParameter("ShowTime_Id"));
        String movieName = request.getParameter("Movie_Name");
        Time start = Time.valueOf(request.getParameter("Start_Time"));
        Time end = Time.valueOf(request.getParameter("End_Time"));
        int theater = Integer.parseInt(request.getParameter("theater_id"));

        Movie movie = new Movie();
        movie.setMovie_Name(movieName);
        Theater theaterId = new Theater();
        theaterId.setTheater_Id(theater);

        ShowTimes showtime = new ShowTimes();
        showtime.setShowtime_Id(showtimeId);
        showtime.setMovie_name(movie);
        showtime.setStart_Time(start);
        showtime.setEnd_Time(end);
        showtime.setTheater_id(theaterId);

        ShowTimeDao showTimeDao = new ShowTimeDao();
        boolean success = showTimeDao.UpdateShowTime(showtime);
        
        if (success) {
            response.sendRedirect("/MovieTicketReservation/viewshowtime");
        } else {
            response.sendRedirect("Error.jsp");
        }
	}
}
