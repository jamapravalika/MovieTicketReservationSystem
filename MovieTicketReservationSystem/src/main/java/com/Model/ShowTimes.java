package com.Model;

import java.sql.Time;

public class ShowTimes {
	private int Showtime_Id;
	private Movie movie_name;
	private Time Start_Time;
	private Time End_Time;
	private Theater theater_id;
	
	public ShowTimes() {
		super();
	}
	public ShowTimes(int showtime_Id, Movie movie_name, Time start_Time, Time end_Time, Theater theater_id) {
		super();
		Showtime_Id = showtime_Id;
		this.movie_name = movie_name;
		Start_Time = start_Time;
		End_Time = end_Time;
		this.theater_id = theater_id;
	}
	
	public ShowTimes(Movie movie_name, Time start_Time, Time end_Time, Theater theater_id) {
		super();
		this.movie_name = movie_name;
		Start_Time = start_Time;
		End_Time = end_Time;
		this.theater_id = theater_id;
	}
	public int getShowtime_Id() {
		return Showtime_Id;
	}

	public void setShowtime_Id(int showtime_Id) {
		Showtime_Id = showtime_Id;
	}
	public Movie getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(Movie movie_name) {
		this.movie_name = movie_name;
	}
	public Time getStart_Time() {
		return Start_Time;
	}
	public void setStart_Time(Time start_Time) {
		Start_Time = start_Time;
	}
	public Time getEnd_Time() {
		return End_Time;
	}
	public void setEnd_Time(Time end_Time) {
		End_Time = end_Time;
	}
	public Theater getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(Theater theater_id) {
		this.theater_id = theater_id;
	}
	
	@Override
	public String toString() {
		return "ShowTimes [Showtime_Id=" + Showtime_Id + ", movie_name=" + movie_name + ", Start_Time=" + Start_Time
				+ ", End_Time=" + End_Time + ", theater_id=" + theater_id + "]";
	} 	
}