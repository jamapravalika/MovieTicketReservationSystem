package com.Dao;

import java.sql.Time;
import java.util.List;

import com.Model.Movie;
import com.Model.ShowTimes;

public interface ShowTimingIntrf {
	
	public void InsertShowTime(ShowTimes showtime);
	
	public void UpdateShowTime(ShowTimes showtime);
	
	public void DeleteShowTime(int showtimeId);
	
	public ShowTimes getshowtimeId(int showtimeId);
	
	public List<ShowTimes> ListAllShowTime();
	
	public boolean isShowTimeExists(String movieName, Time startTime, Time endTime, int theaterId);
	
	public boolean isTheaterExists(int theaterId);
}
