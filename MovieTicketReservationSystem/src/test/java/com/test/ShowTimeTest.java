package com.test;

import static org.junit.Assert.*;

import java.sql.Time;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.Model.Movie;
import com.Model.ShowTimes;
import com.Model.Theater;

public class ShowTimeTest {
	
	private ShowTimes show;
    private Movie movie;
    private Time start_Time;
    private Time end_Time;
    private Theater theater;

    @Before
    public void setUp() {
        show = new ShowTimes();
        movie = new Movie();
        start_Time = Time.valueOf("14:30:00");
        end_Time = Time.valueOf("18:00:00");
        theater = new Theater();
    }

    @Test
    public void testGetMovieName() {
        // Arrange
        movie.setMovie_Name("Animal");
        show.setMovie_name(movie);

        // Act
        String result = show.getMovie_name().getMovie_Name();

        // Assert
        assertEquals("Animal", result);
    }

    @Test
    public void testGetStartTime() {
        // Arrange
        show.setStart_Time(start_Time);

        // Act
        Time result = show.getStart_Time();

        // Assert
        assertEquals(start_Time, result);
    }

    @Test
    public void testGetEndTime() {
        // Arrange
        show.setEnd_Time(end_Time);

        // Act
        Time result = show.getEnd_Time();

        // Assert
        assertEquals(end_Time, result);
    }

    @Test
    public void testGetTheaterId() {
        // Arrange
        theater.setTheater_Id(3);
        show.setTheater_id(theater);

        // Act
        int result = show.getTheater_id().getTheater_Id();

        // Assert
        assertEquals(3, result);
    }

    @After
    public void tearDown() {
        show = null;
        movie = null;
        start_Time = null;
        end_Time = null;
        theater = null;
    }
}