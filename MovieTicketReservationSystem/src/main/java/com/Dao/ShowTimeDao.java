package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.Db.DbConnection;
import com.Model.Movie;
import com.Model.ShowTimes;
import com.Model.Theater;

public class ShowTimeDao implements ShowTimingIntrf{
	
	Connection con=DbConnection.getConnection();

	@Override
	public void InsertShowTime(ShowTimes showtime) {
		// TODO Auto-generated method stub
		
		try (Connection connection = DbConnection.getConnection()) {
            String sql = "INSERT INTO ShowTimes (movieName, startTime, endTime, theaterId) VALUES (?, ?, ?, ?);";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, showtime.getMovie_name().getMovie_Name());
                preparedStatement.setTime(2, showtime.getStart_Time());
                preparedStatement.setTime(3, showtime.getEnd_Time());
                preparedStatement.setInt(4, showtime.getTheater_id().getTheater_Id());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception or handle it appropriately
        }
    
		
	}
	
	@Override
	public boolean UpdateShowTime(ShowTimes showtime) {
		// TODO Auto-generated method stub
		
		final String update_Query = "UPDATE Showtimes SET movie_name = ?, start_time = ?, end_time = ?, theater_Id = ? WHERE showtime_Id = ?";


		try {
            PreparedStatement statement = con.prepareStatement(update_Query);
            statement.setString(1, showtime.getMovie_name().getMovie_Name());
            statement.setTime(2, showtime.getStart_Time());
            statement.setTime(3, showtime.getEnd_Time());
            statement.setInt(4, showtime.getTheater_id().getTheater_Id());
            statement.setInt(5, showtime.getShowtime_Id());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
	    }
		  catch (SQLException e) {
	            e.printStackTrace();
	        } 
		finally {
			System.out.println("Finally Block");
		}
		return false;
	}
	@Override
	public List<ShowTimes> ListAllShowTime() {
		// TODO Auto-generated method stub
		
		List<ShowTimes> show = new ArrayList<>();
        
        final String select_query = "SELECT * FROM 	showtimes";
        
        try {
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(select_query);

            while (resultSet.next()) {
                int id = resultSet.getInt("showtimeId");
                String movieName = resultSet.getString("movieName");
                Time start = resultSet.getTime("startTime");
                Time end = resultSet.getTime("endTime");
                int theater = resultSet.getInt("theaterId");

                Movie movie = new Movie();
                movie.setMovie_Name(movieName);

                Theater theaterId = new Theater();
                theaterId.setTheater_Id(theater);

                ShowTimes showtime = new ShowTimes(id, movie, start, end, theaterId);
                show.add(showtime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }  finally {
                System.out.println("Finally Block in ListAllShowTime method");
            }
		return show;
	}
	
	@Override
	public void DeleteShowTime(int showtimeId) {
		// TODO Auto-generated method stub
		final String Delete_Query ="DELETE FROM Showtimes WHERE showtime_Id = ?";
		
		try {
            PreparedStatement pstmt = con.prepareStatement(Delete_Query);
            pstmt.setInt(1, showtimeId);
            pstmt.executeUpdate();
		}
		catch (SQLException e) {
            e.printStackTrace();
	}finally {
		System.out.println("Finally Block");
	}
		
	}

	@Override
	public ShowTimes getshowtimeId(int showtimeId) {
		Connection con = DbConnection.getConnection();
		ShowTimes showtime = null;
        final String select = "SELECT * FROM 	showtimes where showtime_Id = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(select);
            pstmt.setInt(1, showtimeId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("showtimeId");
                String movieName = rs.getString("movieName");
                Time start = rs.getTime("startTime");
                Time end = rs.getTime("endTime");
                int theater = rs.getInt("theaterId");

                Movie movie = new Movie();
                movie.setMovie_Name(movieName);

                Theater theaterId = new Theater();
                theaterId.setTheater_Id(theater);

                showtime = new ShowTimes(id, movie, start, end, theaterId);
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

        return showtime;
    }
}
