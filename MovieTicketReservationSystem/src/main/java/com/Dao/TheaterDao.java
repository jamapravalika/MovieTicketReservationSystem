package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Db.DbConnection;
import com.Model.Movie;
import com.Model.ShowTimes;
import com.Model.Theater;


public class TheaterDao implements TheaterDaoIntrf {
		private static final String  Select_QUERY= "Select * from Theater";
		private static final String Insert_QUERY = "Insert into Theater (TheatrName,address,capacity) values(?,?,?)";
	
		private static final String Delete_QUERY ="DELETE FROM Theater WHERE theaterId = ?";
		private static final String updateSql = "UPDATE Theater SET TheatrName = ?, address = ?, capacity=? WHERE theaterId = ?";
		 private static final String SELECT_BY_ID_QUERY = "SELECT * FROM Theater WHERE theaterId = ?";
		
		Connection con=DbConnection.getConnection();
		
		
		Theater thea=new Theater();

		@Override
		public void addTheater() {
			// TODO Auto-generated method stub
			try {
				PreparedStatement pstmt = con.prepareStatement(Insert_QUERY);
				
				Theater thea=new Theater();
				pstmt.setInt(1, (thea).getTheater_Id());
	            pstmt.setString(2, ( thea).getTheater_Name());
				pstmt.setString(3, (thea).getAddress());
				pstmt.setInt(4, (thea).getCapacity());
				pstmt.executeUpdate();
				
				con.close();
			} 
			catch (Exception e) {
				System.out.println("Exception" + e.getLocalizedMessage());
			}
			finally {
				System.out.println("Finally Block");
			}
			
		}

		@Override
		public void editTheater(Theater theater) {
		    try  {
		        PreparedStatement preparedStatement = con.prepareStatement(updateSql);

		        preparedStatement.setString(1, theater.getTheater_Name());
		        preparedStatement.setString(2, theater.getAddress());
		        preparedStatement.setInt(3, theater.getCapacity());
		        preparedStatement.setInt(4, theater.getTheater_Id()); // Assuming theater_id is the fourth parameter in your SQL query

		        int rowsUpdated = preparedStatement.executeUpdate();

		        if (rowsUpdated > 0) {
		            System.out.println("Theater updated successfully.");
		        } else {
		            System.out.println("No theaters were updated.");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}

		@Override
		public void removeTheater(int id) {
	        try {
	            PreparedStatement pstm = con.prepareStatement(Delete_QUERY);
	            pstm.setInt(1, id);
	            int cnt = pstm.executeUpdate();

	            if (cnt != 0) {
	                System.out.println("Deleted Successfully!!! " + id);
	            } else {
	                System.out.println("No records deleted for theaterId: " + id);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

		@Override
		public List<Theater> displayTheaterdetails() {
		    List<Theater> theater = new ArrayList<Theater>();

		    try {
		    	Connection conn = DbConnection.getConnection();
		        Statement stmt = conn.createStatement();

		        ResultSet result = stmt.executeQuery(Select_QUERY);

		        while (result.next()) {
		            Theater the = new Theater();
		            the.setTheater_Id(result.getInt(1)); 
		            the.setTheater_Name(result.getString(2));
		            the.setAddress(result.getString(3));
		            the.setCapacity(result.getInt(4)); 

		            theater.add(the);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        System.out.println("Finally Block");
		    }

		    return theater;
		}
		
		@Override
	    public Theater getTheaterById(int theaterId) {
	        Theater theater = null;
	        try {
	            PreparedStatement pstmt = con.prepareStatement(SELECT_BY_ID_QUERY);
	            pstmt.setInt(1, theaterId);
	            ResultSet result = pstmt.executeQuery();

	            if (result.next()) {
	                theater = new Theater();
	                theater.setTheater_Id(result.getInt("theaterId"));
	                theater.setTheater_Name(result.getString("TheatrName"));
	                theater.setAddress(result.getString("address"));
	                theater.setCapacity(result.getInt("capacity"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return theater;
	    }
		
}