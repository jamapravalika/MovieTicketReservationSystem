package com.Model;

public class Theater {
	private int Theater_Id;
	private String Theater_Name;
	private String Address;
	private int Capacity;
	
	public Theater() {
		super();
	}
	public Theater(int theater_Id, String theater_Name, String address, int capacity) {
		super();
		Theater_Id = theater_Id;
		Theater_Name = theater_Name;
		Address = address;
		Capacity = capacity;
	}
	public Theater(String theatername, String location, int capacity) {
		// TODO Auto-generated constructor stub
	}
	public int getTheater_Id() {
		return Theater_Id;
	}
	public void setTheater_Id(int theater_Id) {
		Theater_Id = theater_Id;
	}
	public String getTheater_Name() {
		return Theater_Name;
	}
	public void setTheater_Name(String theater_Name) {
		Theater_Name = theater_Name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public int getCapacity() {
		return Capacity;
	}
	public void setCapacity(int capacity) {
		Capacity = capacity;
	}
	@Override
	public String toString() {
		return "Theater [Theater_Id=" + Theater_Id + ", Theater_Name=" + Theater_Name + ", Address=" + Address
				+ ", Capacity=" + Capacity + "]";
	}
	
}
	