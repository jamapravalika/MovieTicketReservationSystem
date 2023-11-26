package com.Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.UserDao;
import com.Model.users;

/**
 * Servlet implementation class Update_User
 */
public class Update_User extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_User() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer userId = (Integer) request.getSession().getAttribute("userId");

        if (userId != null) {
            UserDao userDao = new UserDao();
            List<users> userList = userDao.getUserById(userId);

            if (!userList.isEmpty()) {
                users user = userList.get(0);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/edituser.jsp").forward(request, response);
            } else {
                response.sendRedirect("/MovieTicketReservationSystem/Error.jsp");
            }
        } else {
            response.sendRedirect("/MovieTicketReservationSystem/Error.jsp");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		    String name = request.getParameter("name");
		    String email = request.getParameter("email");
		    long mobile = Long.parseLong(request.getParameter("mobile"));
		    
		    Object userIdAttribute = request.getSession().getAttribute("userId");
		    
		    if (userIdAttribute != null) {
		        int userId = Integer.parseInt(userIdAttribute.toString());

		        users updatedUser = new users();
		        updatedUser.setUser_Id(userId);
		        updatedUser.setUser_Name(name);
		        updatedUser.setUser_Email(email);
		        updatedUser.setUser_Mobile(mobile);

		        UserDao userProfileDao = new UserDao();
		        boolean isUpdateSuccessful = userProfileDao.updateUserProfile(updatedUser);

		        if (isUpdateSuccessful) {
		            response.sendRedirect("/MovieTicketReservationSystem/userDetails");
		        } else {
		            response.sendRedirect("error.jsp");
		        }
		    } else {
		        response.sendRedirect("/MovieTicketReservationSystem/Error.jsp");
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		    response.sendRedirect("error.jsp");
		}
	}

}
