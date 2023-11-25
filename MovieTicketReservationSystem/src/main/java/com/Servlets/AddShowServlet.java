package com.Servlets;

import java.io.IOException;
import java.sql.Time;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ShowTimeDao;
import com.Model.Movie;
import com.Model.ShowTimes;
import com.Model.Theater;

/**
 * Servlet implementation class AddShowServlet
 */
public class AddShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ShowTimeDao showTimeDao = new ShowTimeDao();
        List<ShowTimes> showtime = showTimeDao.ListAllShowTime();

        request.setAttribute("showtime", showtime);

        RequestDispatcher dispatcher = request.getRequestDispatcher("viewshowtime.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movieName = request.getParameter("Movie_Name");
        String startTimeStr = request.getParameter("Start_Time");
        String endTimeStr = request.getParameter("End_Time");

        String theaterIdParameter = request.getParameter("theater_id");
        int theater = (theaterIdParameter != null && !theaterIdParameter.isEmpty())
                ? Integer.parseInt(theaterIdParameter)
                : 0;

        try {
            Time start = Time.valueOf(startTimeStr + ":00");
            Time end = Time.valueOf(endTimeStr + ":00");

            Movie movie = new Movie();
            movie.setMovie_Name(movieName);

            Theater theaterId = new Theater();
            theaterId.setTheater_Id(theater);

            ShowTimes showtime = new ShowTimes(movie, start, end, theaterId);

            ShowTimeDao showTimeDao = new ShowTimeDao();
            showTimeDao.InsertShowTime(showtime);

            response.sendRedirect("viewshowtime.jsp");
        } catch (IllegalArgumentException e) {
            e.printStackTrace(); 
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid time format. Please use HH:mm");
        }
	}
}
