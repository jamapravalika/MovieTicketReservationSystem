package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Db.DbConnection;
import com.Model.Seats;

public class SeatsDao implements SeatsDaoIntrf{
	private static final String Select_QUERY = "Select * from movies";
	Connection con=DbConnection.getConnection();
	@Override
	public List<Seats> getAllSeats() {
		List<Seats> SeatList = new ArrayList<Seats>();
        try {
        	
            PreparedStatement pstmt = con.prepareStatement(Select_QUERY);
            ResultSet rs = pstmt.executeQuery();
            
            Seats Se = null;

            while (rs.next()) {
                Se = new Seats();
                Se.setSeat_Id(rs.getInt("seatId"));
                Se.setMovieName(rs.getString("MovieName"));
                Se.setSeat_Number(rs.getInt("seatNumber"));
                Se.setPrice(rs.getFloat("price"));
                Se.setBooked(rs.getBoolean("isBooked"));
                Se.setTotal_Price(rs.getInt("ticketprice"));
             
                SeatList.add(Se);
            }
        } catch (Exception e) {
//        	e.printStackTrace();
        	System.out.println("Error Retrieving data: " + e.getLocalizedMessage());
        }
        return SeatList;
		
	}
	

}
