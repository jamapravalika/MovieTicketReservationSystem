package com.Dao;

import java.util.List;

import com.Model.ShowTimes;
import com.Model.Theater;

public interface TheaterDaoIntrf {
	public void addTheater();
	
	public void editTheater(Theater theater);
	
	public void removeTheater(int id);
	
	public List<Theater> displayTheaterdetails();
}
