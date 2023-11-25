package com.Dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Db.DbConnection;
import com.Model.Movie;
import com.Model.Theater;

public  class MovieDao implements MoviesDaoIntrfc{
	private static final String Select_QUERY = "Select * from movies";
	private static final String Insert_QUERY = "Insert into movies (movieId,theaterId,movie_name,director,releasedate,casts,description,poster,duration,trailerlink,genre) values(?,?,?,?,?,?,?,?,?,?,?)";
	private static final String Update_QUERY = "UPDATE movies SET movie_name = ?, director = ?, releasedate = ?, casts = ?, description = ?, duration = ?, trailerlink = ?, genre = ? WHERE movieId = ?";
	private static final String Delete_QUERY="DELETE FROM movies WHERE MovieId = ?";
	private static final String SELECT_BY_ID_QUERY = "SELECT * FROM movies WHERE movieId = ?";
	
	private static List<Movie> movies = new ArrayList<>();
	
	List<Movie> movList = new ArrayList<Movie>();
	
	Connection con=DbConnection.getConnection();
	public List<Movie> getAllMovies() {
		
		 
	        try {
	        	
	            PreparedStatement pstmt = con.prepareStatement(Select_QUERY);
	            ResultSet rs = pstmt.executeQuery();
	            
	            Movie mov = null;

	            while (rs.next()) {
	                mov = new Movie();
	                mov.setMovie_Id(rs.getInt("movieId"));
	                mov.setTheater_Id(rs.getInt("theaterId"));
	                mov.setMovie_Name(rs.getString("movie_name"));
	                mov.setMovie_Director(rs.getString("director"));
	                mov.setMovie_Release_Date(rs.getDate("releasedate"));
	                mov.setMovie_Casts(rs.getString("casts"));
	                mov.setMovie_Description(rs.getString("description"));
	                mov.setMovie_Poster(rs.getString("poster"));
					/*
					 * Blob posterBlob = rs.getBlob("poster"); if (posterBlob != null) {
					 * mov.setMovie_Poster(posterBlob); }
					 */
	                mov.setMovie_Duration(rs.getString("duration"));
	                mov.setTrailerlink(rs.getString("trailerlink"));
	                mov.setGenre(rs.getString("genre"));
	                
	                Theater theater = new Theater();
	                mov.setTheater(theater);               
	                movList.add(mov);
	            }
	        } catch (Exception e) {
//	        	e.printStackTrace();
	        	System.out.println("Error Retrieving data: " + e.getLocalizedMessage());
	        }
	        return movList;
	    }
	public void InsertMovies(Movie mov) {
	
		try {
			PreparedStatement pstmt = con.prepareStatement(Insert_QUERY);
			
			pstmt.setInt(1, mov.getMovie_Id());
            pstmt.setInt(2, mov.getTheater_Id());
			pstmt.setString(3, mov.getMovie_Name());
			pstmt.setString(4, mov.getMovie_Director());
			pstmt.setDate(5, new Date(mov.getMovie_Release_Date().getTime()));
			pstmt.setString(6, mov.getMovie_Casts());
			pstmt.setString(7, mov.getMovie_Description());
			pstmt.setString(8, mov.getMovie_Poster());
			pstmt.setString(9, mov.getMovie_Duration());
			pstmt.setString(10, mov.getTrailerlink());
			pstmt.setString(11, mov.getGenre());
			pstmt.executeUpdate();
			
			con.close();
		} 
		catch (Exception e) {
			System.out.println("Error Inserting Movies" + e.getLocalizedMessage());
		}
		finally {
			System.out.println("Finally Block");
		}

	}

	@Override
	public Movie getMovieById(int movieId) {
        Connection con = DbConnection.getConnection();
        Movie movie = null;

        try {
            PreparedStatement pstmt = con.prepareStatement(SELECT_BY_ID_QUERY);
            pstmt.setInt(1, movieId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                movie = new Movie();
                movie.setMovie_Id(rs.getInt("movieId"));
                movie.setTheater_Id(rs.getInt("theaterId"));
                movie.setMovie_Name(rs.getString("movie_name"));
                movie.setMovie_Director(rs.getString("director"));
                movie.setMovie_Release_Date(rs.getDate("releasedate"));
                movie.setMovie_Casts(rs.getString("casts"));
                movie.setMovie_Description(rs.getString("description"));
                movie.setMovie_Poster(rs.getString("poster"));
                movie.setMovie_Duration(rs.getString("duration"));
                movie.setTrailerlink(rs.getString("trailerlink"));
                movie.setGenre(rs.getString("genre"));

                Theater theater = new Theater();
                movie.setTheater(theater);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return movie;
    }

	@Override
	public boolean DeleteMovies(int movieId) {
		boolean rowDeleted = false;
        try {
            PreparedStatement pstmt = con.prepareStatement(Delete_QUERY);
            pstmt.setInt(1, movieId);
            rowDeleted = pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    
	}
	@Override
	public boolean UpadateMovies(Movie mov) {
		// TODO Auto-generated method stub
		Connection con = DbConnection.getConnection();

        try {
            PreparedStatement pstmt = con.prepareStatement(Update_QUERY);

            pstmt.setString(1, mov.getMovie_Name());
            pstmt.setString(2, mov.getMovie_Director());
            pstmt.setDate(3, new java.sql.Date(mov.getMovie_Release_Date().getTime()));
            pstmt.setString(4, mov.getMovie_Casts());
            pstmt.setString(5, mov.getMovie_Description());
            pstmt.setString(6, mov.getMovie_Duration());
            pstmt.setString(7, mov.getTrailerlink());
            pstmt.setString(8, mov.getGenre());
            pstmt.setInt(9, mov.getMovie_Id());

            int rowsUpdated = pstmt.executeUpdate();

            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
	}
	
	@Override
	public List<Movie> SearchMovies(String keyword) {
		String SEARCH_QUERY = "SELECT * FROM movies WHERE movie_name like ? or genre like ?";
		List<Movie> movies = new ArrayList<>();
		
		try (Connection con = DbConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SEARCH_QUERY)) {
			
            pstmt.setString(1, "%"+keyword+"%");
            pstmt.setString(2, "%"+keyword+"%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovie_Id(rs.getInt("movieId"));
                movie.setTheater_Id(rs.getInt("theaterId"));
                movie.setMovie_Name(rs.getString("movie_name"));
                movie.setMovie_Director(rs.getString("director"));
                movie.setMovie_Release_Date(rs.getDate("releasedate"));
                movie.setMovie_Casts(rs.getString("casts"));
                movie.setMovie_Description(rs.getString("description"));
                movie.setMovie_Poster(rs.getString("poster"));
                movie.setMovie_Duration(rs.getString("duration"));
                movie.setTrailerlink(rs.getString("trailerlink"));
                movie.setGenre(rs.getString("genre"));

                Theater theater = new Theater();
                movie.setTheater(theater);
                
                movies.add(movie);
                System.out.println("Connected Successfully");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Finally");
        }
        return movies;
    }

}