package com.Model;

import java.util.Date;
import java.sql.Blob;
import java.util.Arrays;

public class Movie {
	private int movie_Id;
	private int Theater_Id;
    private String movie_Name;
    private String movie_Director;
    private Date movie_Release_Date;
    private String movie_Casts;
    private String movie_Description;
    private String movie_Poster;
    private String movie_Duration;
    private String trailerlink;
    private String genre;
    
    
    
public Movie() {
		super();
	}
public Movie(int movie_Id, int theater_Id, String movie_Name, String movie_Director, Date movie_Release_Date,
			String movie_Casts, String movie_Description, String movie_Poster, String movie_Duration, String trailerlink,
			String genre, Theater theater) {
		super();
		this.movie_Id = movie_Id;
		Theater_Id = theater_Id;
		this.movie_Name = movie_Name;
		this.movie_Director = movie_Director;
		this.movie_Release_Date = movie_Release_Date;
		this.movie_Casts = movie_Casts;
		this.movie_Description = movie_Description;
		this.movie_Poster = movie_Poster;
		this.movie_Duration = movie_Duration;
		this.trailerlink = trailerlink;
		this.genre = genre;
		this.theater = theater;
	}

	public int getTheater_Id() {
		return Theater_Id;
	}
	public void setTheater_Id(int theater_Id) {
		Theater_Id = theater_Id;
	}
	public Theater getTheater() {
		return theater;
	}
	public void setTheater(Theater theater) {
		this.theater = theater;
	}
	private Theater theater; // New property for Theater object
    
	
	public int getMovie_Id() {
		return movie_Id;
	}
	public void setMovie_Id(int movie_Id) {
		this.movie_Id = movie_Id;
	}
	public String getMovie_Name() {
		return movie_Name;
	}
	public void setMovie_Name(String movie_Name) {
		this.movie_Name = movie_Name;
	}
	public String getMovie_Director() {
		return movie_Director;
	}
	public void setMovie_Director(String movie_Director) {
		this.movie_Director = movie_Director;
	}
	public Date getMovie_Release_Date() {
		return movie_Release_Date;
	}
	public void setMovie_Release_Date(Date string) {
		this.movie_Release_Date = string;
	}
	public String getMovie_Casts() {
		return movie_Casts;
	}
	public void setMovie_Casts(String movie_Casts) {
		this.movie_Casts = movie_Casts;
	}
	public String getMovie_Description() {
		return movie_Description;
	}
	public void setMovie_Description(String movie_Description) {
		this.movie_Description = movie_Description;
	}
	
	public String getMovie_Poster() {
		return movie_Poster;
	}
	public void setMovie_Poster(String movie_Poster) {
		this.movie_Poster = movie_Poster;
	}
	public String getMovie_Duration() {
		return movie_Duration;
	}
	public void setMovie_Duration(String movie_Duration) {
		this.movie_Duration = movie_Duration;
	}
	public String getTrailerlink() {
		return trailerlink;
	}
	public void setTrailerlink(String trailerlink) {
		this.trailerlink = trailerlink;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	@Override
	public String toString() {
		return "Movie [movie_Id=" + movie_Id + ", Theater_Id=" + Theater_Id + ", movie_Name=" + movie_Name
				+ ", movie_Director=" + movie_Director + ", movie_Release_Date=" + movie_Release_Date + ", movie_Casts="
				+ movie_Casts + ", movie_Description=" + movie_Description + ", movie_Poster=" + movie_Poster
				+ ", movie_Duration=" + movie_Duration + ", trailerlink=" + trailerlink + ", genre=" + genre
				+ ", theater=" + theater + "]";
	}
	
	
	
}
