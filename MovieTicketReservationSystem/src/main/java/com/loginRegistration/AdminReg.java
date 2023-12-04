package com.loginRegistration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminReg
 */
public class AdminReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReg() {
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
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String upwd=request.getParameter("pass");
		String Repass=request.getParameter("re_pass");
		String umobile=request.getParameter("contact");
		String role=request.getParameter("role");
		RequestDispatcher dispatcher = null;
		Connection con=null;
		
		if(uname == null || uname.equals("")) {
			request.setAttribute("status", "invalidName");
			dispatcher = request.getRequestDispatcher("AdminReg.jsp");
			dispatcher.forward(request, response);
		}
		if(uemail == null || uemail.equals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("AdminReg.jsp");
			dispatcher.forward(request, response);
		}
		if(upwd == null || upwd.equals("")) {
			request.setAttribute("status", "invalidUpwd");
			dispatcher = request.getRequestDispatcher("AdminReg.jsp");
			dispatcher.forward(request, response);
		}
		else if(!upwd.equals(Repass)){
			request.setAttribute("status", "invalidConfirmPassword");
			dispatcher = request.getRequestDispatcher("AdminReg.jsp");
			dispatcher.forward(request, response);
		}
		if(umobile == null || umobile.equals("")) {
			request.setAttribute("status", "invalidUmobile");
			dispatcher = request.getRequestDispatcher("AdminReg.jsp");
			dispatcher.forward(request, response);
		}
		else if(umobile.length() != 10){
		    request.setAttribute("status", "invalidUmobileLegth");
		    dispatcher = request.getRequestDispatcher("AdminReg.jsp");
		    dispatcher.forward(request, response);
		}

		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/movieticket?useSSL=false", "root", "root");
		    PreparedStatement pst = con.prepareStatement("INSERT INTO users (uname, upwd, uemail, umobile, role) VALUES (?, ?, ?, ?, ?)");

		    pst.setString(1, uname);
		    pst.setString(2, upwd);
		    pst.setString(3, uemail);
		    pst.setString(4, umobile);
		    pst.setString(5, role);

		    int rowCount = pst.executeUpdate();
		    
		    dispatcher = request.getRequestDispatcher("AdminReg.jsp");
		    if (rowCount > 0) {
		        request.setAttribute("status", "success");
		        response.sendRedirect("AdminLogin.jsp");
		    } else {
		        request.setAttribute("status", "failed");
		    }
		    dispatcher.forward(request, response);
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    try {
		        if (con != null) {
		            con.close();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}
	
	}

}
