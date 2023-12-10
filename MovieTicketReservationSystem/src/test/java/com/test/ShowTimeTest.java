package com.test;

import static org.junit.Assert.*;

import java.sql.Time;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.Dao.ShowTimeDao;
import com.Model.Movie;
import com.Model.ShowTimes;
import com.Model.Theater;

public class ShowTimeTest {
	
	private ShowTimeDao showTimeDao;

    @Before
    public void setUp() {
        showTimeDao = new ShowTimeDao();
    }

    @Test
    public void testInsertShowTime() {
        
        Movie movie = new Movie();
        movie.setMovie_Name("Animal");
        
        Theater theater = new Theater();
        theater.setTheater_Id(3);

        ShowTimes showtime = new ShowTimes(movie, Time.valueOf("10:00:00"), Time.valueOf("12:00:00"), theater);

        showTimeDao.InsertShowTime(showtime);

        ShowTimes retrievedShowtime = showTimeDao.getshowtimeId(showtime.getShowtime_Id());

        assertNotNull(retrievedShowtime);
    }

    @Test
    public void testUpdateShowTime() {

        Movie movie = new Movie();
        movie.setMovie_Name("Tiger 3");

        Theater theater = new Theater();
        theater.setTheater_Id(2);

        ShowTimes showtime = new ShowTimes(movie, Time.valueOf("10:00:00"), Time.valueOf("12:00:00"), theater);

        showTimeDao.InsertShowTime(showtime);

        showtime.setStart_Time(Time.valueOf("12:30:00"));
        showtime.setEnd_Time(Time.valueOf("14:30:00"));

        showTimeDao.UpdateShowTime(showtime);

        ShowTimes updatedShowtime = showTimeDao.getshowtimeId(showtime.getShowtime_Id());


        assertEquals(Time.valueOf("12:30:00"), updatedShowtime.getStart_Time());
        assertEquals(Time.valueOf("14:30:00"), updatedShowtime.getEnd_Time());
    }

    @Test
    public void testListAllShowTime() {

        List<ShowTimes> showtimes = showTimeDao.ListAllShowTime();

        assertNotNull(showtimes);
    }

    @Test
    public void testDeleteShowTime() {
        
        Movie movie = new Movie();
        movie.setMovie_Name("Animal");

        Theater theater = new Theater();
        theater.setTheater_Id(3);

        ShowTimes showtime = new ShowTimes(movie, Time.valueOf("10:00:00"), Time.valueOf("12:00:00"), theater);

        showTimeDao.InsertShowTime(showtime);

        showTimeDao.DeleteShowTime(showtime.getShowtime_Id());

        ShowTimes deletedShowtime = showTimeDao.getshowtimeId(showtime.getShowtime_Id());

        assertNull(deletedShowtime);
    }

    @After
    public void tearDown() {
        showTimeDao = null;
    }
}