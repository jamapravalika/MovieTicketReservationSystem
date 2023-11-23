 package com.Servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.MovieDao;
import com.Model.Movie;

public class EditMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int movie_Id = Integer.parseInt(request.getParameter("movieID")); 
        String movie_name = request.getParameter("movieName");
        String movie_Director = request.getParameter("director");
        String movie_Release_Date = request.getParameter("releasedate");
        String movie_Casts = request.getParameter("casts");
        String movie_Description = request.getParameter("description");
        String movie_Poster = request.getParameter("movieImage");
        String movie_Duration = request.getParameter("duration");
        String trailerlink = request.getParameter("trailerlink");
        String genre = request.getParameter("genre");
        String theater = request.getParameter("theater");

        Movie mov = new Movie();
        mov.setMovie_Id(movie_Id);
        mov.setMovie_Name(movie_name);
        mov.setMovie_Director(movie_Director);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            mov.setMovie_Release_Date(dateFormat.parse(movie_Release_Date));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        mov.setMovie_Casts(movie_Casts);
        mov.setMovie_Description(movie_Description);
        mov.setMovie_Poster(movie_Poster);
        mov.setMovie_Duration(movie_Duration);
        mov.setTrailerlink(trailerlink);
        mov.setGenre(genre);
        
        MovieDao movieDao = new MovieDao();
        boolean updated = movieDao.UpadateMovies(mov);

        if (updated) {
        	 request.setAttribute("movie", mov);
             RequestDispatcher dispatcher = request.getRequestDispatcher("EditMovie.jsp");
             dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
}

