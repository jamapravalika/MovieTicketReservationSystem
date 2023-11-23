package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.ShowTimeDao;

/**
 * Servlet implementation class RemoveShowServlet
 */
public class RemoveShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveShowServlet() {
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
		int showtimeId = Integer.parseInt(request.getParameter("ShowTime_Id"));
		try {
        ShowTimeDao showTimeDao = new ShowTimeDao();
        showTimeDao.DeleteShowTime(showtimeId);

        response.sendRedirect("/MovieTicketReservation/viewshowtime");
		}
		catch(Exception e) {
	         e.printStackTrace();
	         response.sendRedirect("Error.jsp");
		}
	}

}
