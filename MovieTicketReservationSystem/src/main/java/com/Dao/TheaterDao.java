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
		private static final String updateSql = "UPDATE theaters SET theater_name = ?, location = ? WHERE theater_id = ?";
		
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
			// TODO Auto-generated method stub
			try  {
	            // Create the SQL update statement
	           
	            
	            // Create a prepared statement
	            PreparedStatement preparedStatement = con.prepareStatement(updateSql);

	            // Set the new values for theater_name and location
	            preparedStatement.setInt(1, thea.getTheater_Id());
	            preparedStatement.setString(2, thea.getTheater_Name());
	            preparedStatement.setString(3, thea.getAddress());
	            
	            // Set the theater_id for the WHERE clause
	            preparedStatement.setInt(4, thea.getCapacity());
	            preparedStatement.executeUpdate();
	            
	            
			}
			catch (SQLException e) {
	            e.printStackTrace();
	        } 
			
		}

		@Override
		public void removeTheater(int id) {
			Connection conn = DbConnection.getConnection();
	        try {
	        	thea=new Theater();
	            PreparedStatement pstm = conn.prepareStatement(Delete_QUERY);
	            pstm.setInt(1, thea.getTheater_Id());
	            int cnt = pstm.executeUpdate();
	            if (cnt != 0) {
	                System.out.println("Deleted Successfully!!! " + thea.getTheater_Id());
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            System.out.println("Finally Block");
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


	}





