package com.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.BookingDAO;
import com.Dao.BookingDAOIntr;
import com.Dao.MovieDao;
import com.Model.Bookings;
import com.Model.Movie;

/**
 * Servlet implementation class DisplayTicket
 */
public class DisplayTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookingDAOIntr bookingDAO = new BookingDAO();
        List<Bookings> bookedTickets = bookingDAO.ShowBookingByUserEmail(request);

        // Set the bookedTickets attribute in the request
        request.setAttribute("bookings", bookedTickets);

        RequestDispatcher dispatcher = request.getRequestDispatcher("ticket.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
