package com.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.Dao.BookingDAO;
import com.Dao.BookingDAOIntr;
import com.Model.Bookings;

public class DisplayTicket extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DisplayTicket() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("in ticket doget");

        String bookingIdParam = request.getParameter("bookingId");
        System.out.println(bookingIdParam);

        if (bookingIdParam != null) {
            try {
                int bookingId = Integer.parseInt(bookingIdParam);
                String movieName = (String) request.getAttribute("MovieName");

                HttpSession session = request.getSession();
                String userEmail = (String) session.getAttribute("useremail");

                session.setAttribute("MovieName", movieName);
                System.out.println("MovieName in doGet: " + movieName);

                BookingDAOIntr bookingDAO = new BookingDAO();
                Bookings bookedTickets = bookingDAO.getBookingById(bookingId);

                request.setAttribute("BookingID", bookingId);
                request.setAttribute("bookings", bookedTickets);

                RequestDispatcher dispatcher = request.getRequestDispatcher("ticket.jsp");
                dispatcher.forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("Error.jsp");
        }
    	  
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
