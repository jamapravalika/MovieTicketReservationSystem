package com.Dao;

import java.util.List;

import com.Model.Movie;

public interface MoviesDaoIntrfc {
	public List<Movie> getAllMovies();	
	void InsertMovies(Movie mov);
	boolean UpadateMovies(Movie mov);
	boolean DeleteMovies(int movieId);
	public Movie getMovieById(int movieId);	
	List<Movie> SearchMovies(String keyword);
}
