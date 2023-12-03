package com.Servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.Dao.MovieDao;
import com.Dao.ShowTimeDao;
import com.Dao.TheaterDao;
import com.Dao.UserDao;
import com.Db.DbConnection;
import com.Model.Movie;
import com.Model.ShowTimes;
import com.Model.Theater;
import com.Model.users;

@WebServlet("/moviepage")
@MultipartConfig
public class MovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public MovieServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	TheaterDao theaterDao = new TheaterDao(); 
    	List<Theater> thea = theaterDao.displayTheaterdetails();
		request.setAttribute("theaters", thea);
    	
		ShowTimeDao showTimeDao = new ShowTimeDao();
        List<ShowTimes> showtime = showTimeDao.ListAllShowTime();
        request.setAttribute("showtime", showtime);
    	
        UserDao userDao = new UserDao();
	    List<users> userList = userDao.getAllUsers(); 
	    request.setAttribute("userList", userList);
    	
    	 MovieDao movieDao = new MovieDao();
    	 List<Movie> movies = movieDao.getAllMovies(); 
    	 request.setAttribute("movies", movies);
    	 RequestDispatcher dispatcher = request.getRequestDispatcher("moviepage.jsp");
    	 dispatcher.forward(request, response);
				 
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in post");
        Part file = request.getPart("movieImage");
        
        String imageFileName = getSubmittedFileName(file);
        System.out.println(imageFileName);
        
	
		 String uploadPath =
				"C:/Users/pssim/git/MovieTicketReservationSystem/MovieTicketReservationSystem/src/main/webapp/images/"
				 		 + imageFileName;
        
		/* String uploadPath =request.getRealPath("images"); */
        System.out.println(uploadPath);
        
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();
            
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        String insertQuery = "INSERT INTO movies (theaterId, movie_name, director, releasedate, casts, description, poster, duration, trailerlink, genre) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        int theaterId = 1; // Replace with your theater ID or get it from the request
        String movieName = request.getParameter("movieName");
        String director = request.getParameter("director");
        String releasedate = request.getParameter("releasedate"); // Make sure to retrieve this from your form
        String casts = request.getParameter("casts");
        String description = request.getParameter("description");
        String duration = request.getParameter("duration");
        String trailerlink = request.getParameter("trailerlink");
        String genre = request.getParameter("genre");

        try {
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setInt(1, theaterId);
            pstmt.setString(2, movieName);
            pstmt.setString(3, director);
            pstmt.setString(4, releasedate);
            pstmt.setString(5, casts);
            pstmt.setString(6, description);
            pstmt.setString(7, imageFileName);
            pstmt.setString(8, duration);
            pstmt.setString(9, trailerlink);
            pstmt.setString(10, genre);

            int row = pstmt.executeUpdate();

            conn.commit();

            if (row > 0) {
                System.out.println("Image path added successfully");
            } else {
                System.out.println("Failed to add image path");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/viewmovies");
    }
    
    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("file")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
