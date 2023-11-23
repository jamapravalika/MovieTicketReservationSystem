package com.Model;


import java.sql.Time;
import java.sql.Timestamp;


public class Bookings extends Movie{
	private int BookingId;
	private String Useremail;
	private String MovieName;
	private String TheaterName;
	private Time ShowTime;
	private int quantity;
	private float TotalPrice;
	private Timestamp BookingDate;
	private String MoviePoster;
	private boolean confirmed;
	public int getBookingId() {
		return BookingId;
	}
	
	public Bookings() {
		super();
	}

	public Bookings(int bookingId, String useremail, String movieName, String theaterName, Time showTime, int quantity,
			float totalPrice, Timestamp bookingDate, String moviePoster, boolean confirmed) {
		super();
		BookingId = bookingId;
		Useremail = useremail;
		MovieName = movieName;
		TheaterName = theaterName;
		ShowTime = showTime;
		this.quantity = quantity;
		TotalPrice = totalPrice;
		BookingDate = bookingDate;
		MoviePoster = moviePoster;
		this.confirmed = confirmed;
	}

	public void setBookingId(int bookingId) {
		BookingId = bookingId;
	}
	public String getUseremail() {
		return Useremail;
	}
	public void setUseremail(String useremail) {
		Useremail = useremail;
	}
	public String getMovieName() {
		return MovieName;
	}
	public void setMovieName(String movieName) {
		MovieName = movieName;
	}
	public String getTheaterName() {
		return TheaterName;
	}
	public void setTheaterName(String theaterName) {
		TheaterName = theaterName;
	}
	public Time getShowTime() {
		return ShowTime;
	}
	public void setShowTime(Time showTime) {
		ShowTime = showTime;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		TotalPrice = totalPrice;
	}
	public Timestamp getBookingDate() {
		return BookingDate;
	}
	public void setBookingDate(Timestamp bookingDate) {
		BookingDate = bookingDate;
	}
	public String getMoviePoster() {
		return MoviePoster;
	}
	public void setMoviePoster(String moviePoster) {
		MoviePoster = moviePoster;
	}
	public boolean isConfirmed() {
		return confirmed;
	}
	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}
	@Override
	public String toString() {
		return "Bookings [BookingId=" + BookingId + ", Useremail=" + Useremail + ", MovieName=" + MovieName
				+ ", TheaterName=" + TheaterName + ", ShowTime=" + ShowTime + ", quantity=" + quantity + ", TotalPrice="
				+ TotalPrice + ", BookingDate=" + BookingDate + ", MoviePoster=" + MoviePoster + ", confirmed="
				+ confirmed + "]";
	}
	
	
	
}
	

	

