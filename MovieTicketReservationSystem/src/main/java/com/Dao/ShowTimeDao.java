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
            String sql = "INSERT INTO Showtimes (movieName, startTime, endTime, theaterId) VALUES (?, ?, ?, ?);";
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
	public void UpdateShowTime(ShowTimes showtime) {
		// TODO Auto-generated method stub
		
		final String updateQuery = "UPDATE Showtimes SET movieName = ?, startTime = ?, endTime = ?, theaterId= ? WHERE showtimeId = ?";
		
		try(Connection connection = DbConnection.getConnection()) {
			PreparedStatement statement = con.prepareStatement(updateQuery);
            statement.setString(1, (showtime.getMovie_name() != null) ? showtime.getMovie_name().getMovie_Name() : null);
            statement.setTime(2, showtime.getStart_Time());
            statement.setTime(3, showtime.getEnd_Time());
            statement.setInt(4, (showtime.getTheater_id() != null) ? showtime.getTheater_id().getTheater_Id() : null);
            statement.setInt(5, showtime.getShowtime_Id());
            statement.executeUpdate();
            System.out.println("Connected successfully");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Finally Block");
        }
    }
	
	@Override
	public List<ShowTimes> ListAllShowTime() {
		// TODO Auto-generated method stub
		
		List<ShowTimes> show = new ArrayList<>();
        
        final String select_query = "SELECT * FROM 	Showtimes";
        
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
		final String Delete_Query ="DELETE FROM Showtimes WHERE showtimeId = ?";
		
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
	    final String select = "SELECT * FROM Showtimes WHERE showtimeId = ?";
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
	
	@Override
	public boolean isShowTimeExists(String movieName, Time startTime, Time endTime, int theaterId) {
	    Connection conn = DbConnection.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT COUNT(*) FROM Showtimes WHERE movieName = ? AND startTime = ? AND endTime = ? AND theaterId = ?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, movieName);
	        pstmt.setTime(2, startTime);
	        pstmt.setTime(3, endTime);
	        pstmt.setInt(4, theaterId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            int count = rs.getInt(1);
	            return count > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	    	System.out.println("Finally Block");
	    }

	    return false;
	}
	
	@Override
	public boolean isTheaterExists(int theaterId) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT COUNT(*) FROM Theaters WHERE theaterId = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, theaterId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	System.out.println("Finally Block");
        }

        return false;
    }
}
