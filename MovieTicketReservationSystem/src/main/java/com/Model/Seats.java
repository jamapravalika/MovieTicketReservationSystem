package com.Model;

public class Seats {
	private int Seat_Id;
	private String MovieName;
	private int Seat_Number;
	private float price;
    private boolean isBooked;
    private float Total_Price;
    
    
	public Seats() {
		super();
	}
	public Seats(int seat_Id, String movieName, int seat_Number, float price, boolean isBooked, float total_Price) {
		super();
		Seat_Id = seat_Id;
		MovieName = movieName;
		Seat_Number = seat_Number;
		this.price = price;
		this.isBooked = isBooked;
		Total_Price = total_Price;
	}
	public int getSeat_Id() {
		return Seat_Id;
	}
	public void setSeat_Id(int seat_Id) {
		Seat_Id = seat_Id;
	}
	public String getMovieName() {
		return MovieName;
	}
	public void setMovieName(String movieName) {
		MovieName = movieName;
	}
	public int getSeat_Number() {
		return Seat_Number;
	}
	public void setSeat_Number(int seat_Number) {
		Seat_Number = seat_Number;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public boolean isBooked() {
		return isBooked;
	}
	public void setBooked(boolean isBooked) {
		this.isBooked = isBooked;
	}
	public float getTotal_Price() {
		return price;
	}
	public void setTotal_Price(float total_Price) {
		Total_Price = Total_Price;
	}
	@Override
	public String toString() {
		return "Seats [Seat_Id=" + Seat_Id + ", MovieName=" + MovieName + ", Seat_Number=" + Seat_Number + ", price="
				+ price + ", isBooked=" + isBooked + ", Total_Price=" + Total_Price + "]";
	}
	
	
	
}
