package com.Servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.BookingDAO;
import com.Dao.BookingDAOIntr;
import com.Model.Bookings;

/**
 * Servlet implementation class UserBookings
 */
public class UserBookings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBookings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookingDAOIntr bookingDAO = new BookingDAO();
        List<Bookings> bookedTickets = bookingDAO.ShowBookingByUserEmail(request);

        // Set the bookedTickets attribute in the request
        request.setAttribute("bookings", bookedTickets);

        RequestDispatcher dispatcher = request.getRequestDispatcher("UserBookings.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in post");
        HttpSession session = request.getSession();
        
        String MoviePoster = request.getParameter("moviePoster");
        String useremail = (String) session.getAttribute("useremail");
        String movieName = request.getParameter("moviename");
        String theaterName = request.getParameter("theatre_name");
        String startTimeStr = request.getParameter("time_start").trim();
        Time startTime = Time.valueOf(startTimeStr);

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        float totalPrice = calculateTotalPrice(quantity);

        Date bookingDate = new Date(System.currentTimeMillis());
        
        System.out.println("MoviePoster : " + MoviePoster);
        System.out.println("useremail : " + useremail);
        System.out.println("movieName : " + movieName);
        System.out.println("theaterName : " + theaterName);
        System.out.println("startTime : " + startTime);
        System.out.println("quantity : " + quantity);
        System.out.println("totalPrice : " + totalPrice);
        System.out.println("bookingDate : " + bookingDate);

        BookingDAO bookingDAO = new BookingDAO();
        bookingDAO.createBooking(useremail, movieName, theaterName, quantity, startTime, totalPrice, bookingDate, MoviePoster);

        RequestDispatcher dispatcher = request.getRequestDispatcher("ticket.jsp");
        dispatcher.forward(request, response);
    }

    private float calculateTotalPrice(int quantity) {
        return 200 * quantity;
    }
	

}
