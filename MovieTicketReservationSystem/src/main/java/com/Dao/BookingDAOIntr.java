package com.Dao;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.Model.Bookings;

public interface BookingDAOIntr {
	public void createBooking(String UserEmail, String MovieName,String TheaterName,int Quantity, Time startTime, float TotalPrice,Date BookingDate, String MoviePoster);
	
	public boolean confirmBooking(int Booking_Id);
	
	public void deleteBooking(int Booking_Id);
	
	public List<Bookings> ShowBooking(HttpServletRequest request);
	
	public List<Bookings> ShowBookingByUserEmail(HttpServletRequest request);
}