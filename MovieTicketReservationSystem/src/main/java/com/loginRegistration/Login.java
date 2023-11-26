package com.loginRegistration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.MovieDao;
import com.Dao.ShowTimeDao;
import com.Dao.TheaterDao;
import com.Dao.UserDao;
import com.Db.DbConnection;
import com.Model.Movie;
import com.Model.ShowTimes;
import com.Model.Theater;
import com.Model.users;

/**
 * Servlet implementation class Login
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	Connection con=DbConnection.getConnection();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uemail=request.getParameter("username");
		String upwd=request.getParameter("password");
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher =null;
		
		if(uemail == null || uemail.contentEquals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		if(upwd == null || upwd.contentEquals("")) {
			request.setAttribute("status", "invalidupwd");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		
		try {
			
			PreparedStatement pst = con.prepareStatement("select * from users where uemail= ? and upwd = ?");
			
			pst.setString(1, uemail);
			pst.setString(2, upwd);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				int userId = rs.getInt("userId");
			    System.out.println("User ID from ResultSet: " + userId);
			    session.setAttribute("userId", userId);
				session.setAttribute("name", rs.getString("uname"));
				session.setAttribute("useremail", rs.getString("uemail"));
				dispatcher = request.getRequestDispatcher("Home.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("/login.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
