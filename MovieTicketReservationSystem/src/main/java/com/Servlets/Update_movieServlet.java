package com.Servlets;   

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.MovieDao;
import com.Model.Movie;

public class Update_movieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Update_movieServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // movie display for edit and delete
        MovieDao movieDao = new MovieDao();
        List<Movie> movies = movieDao.getAllMovies();
        request.setAttribute("movies", movies);
        RequestDispatcher dispatcher = request.getRequestDispatcher("EditMovie.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	int movieId = Integer.parseInt(request.getParameter("movieId"));
        String movieName = request.getParameter("movieName");
        String director = request.getParameter("director");
        String releasedateStr = request.getParameter("releasedate");
        String casts = request.getParameter("casts");
        String description = request.getParameter("description");
        String duration = request.getParameter("duration");
        String trailerlink = request.getParameter("trailerlink");
        String genre = request.getParameter("genre");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date releasedate = null;
        try {
            java.util.Date parsedDate = dateFormat.parse(releasedateStr);
            releasedate = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Movie updatedMovie = new Movie();
        updatedMovie.setMovie_Id(movieId);
        updatedMovie.setMovie_Name(movieName);
        updatedMovie.setMovie_Director(director);
        updatedMovie.setMovie_Release_Date(releasedate);
        updatedMovie.setMovie_Casts(casts);
        updatedMovie.setMovie_Description(description);
        updatedMovie.setMovie_Duration(duration);
        updatedMovie.setTrailerlink(trailerlink);
        updatedMovie.setGenre(genre);

        MovieDao movieDao = new MovieDao();
        boolean success = movieDao.UpadateMovies(updatedMovie);

        if (success) {
            response.sendRedirect("/MovieTicketReservation/viewmovies");
        } else {
            response.sendRedirect("Error.jsp");
        }
    }
}