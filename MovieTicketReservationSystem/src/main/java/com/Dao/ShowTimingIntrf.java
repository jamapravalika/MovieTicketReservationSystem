package com.Dao;

import java.util.List;

import com.Model.Movie;
import com.Model.ShowTimes;

public interface ShowTimingIntrf {
	
	public void InsertShowTime(ShowTimes showtime);
	
	public boolean UpdateShowTime(ShowTimes showtime);
	
	public void DeleteShowTime(int showtimeId);
	
	public ShowTimes getshowtimeId(int showtimeId);
	
	public List<ShowTimes> ListAllShowTime();
	
}
