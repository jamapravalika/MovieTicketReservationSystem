package com.test;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.Model.Movie;

public class MovieTest {
	
	private Movie movie;

	@Before
	public void setUp() {
		movie = new Movie();
	}

	@Test
    public void testGetMovieName() {
        // Arrange
        movie = new Movie();
        movie.setMovie_Name("Animal");

        // Act
        String result = movie.getMovie_Name();

        // Assert
        assertEquals("Animal", result);
    }

    @Test
    public void testGetMovieDirector() {
        // Arrange
        movie = new Movie();
        movie.setMovie_Director("Sandeep Reddy Vanga");

        // Act
        String result = movie.getMovie_Director();

        // Assert
        assertEquals("Sandeep Reddy Vanga", result);
    }

    @Test
    public void testGetReleaseDate() throws ParseException{
        // Arrange
    	String releaseDateString = "01-12-2023";
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date releaseDate = dateFormat.parse(releaseDateString);
        movie = new Movie();
        movie.setMovie_Release_Date(releaseDate);

        // Act
        Date result = movie.getMovie_Release_Date();

        // Assert
        assertEquals(releaseDate, result);
    }
    
    @Test
    public void testGetMovieCasts() {
    	// Arrange
        movie = new Movie();
        movie.setMovie_Casts("Ranbir Kapoor as Actor\r\n" + 
        		"Anil Kapoor as Balbir Singh\r\n" + 
        		"Bobby Deol as Actor\r\n" + 
        		"Rashmika Mandanna as Geethanjali\r\n" + 
        		"Tripti Dimri as Actor\r\n");

        // Act
        String result = movie.getMovie_Casts();

        // Assert
        assertEquals("Ranbir Kapoor as Actor\r\n" + 
        		"Anil Kapoor as Balbir Singh\r\n" + 
        		"Bobby Deol as Actor\r\n" + 
        		"Rashmika Mandanna as Geethanjali\r\n" + 
        		"Tripti Dimri as Actor\r\n", result);
    }
	
    @Test
    public void testGetMovieDescription() {
    	// Arrange
        movie = new Movie();
        movie.setMovie_Description("This is the story of a son whose love for his father knows no bounds.As their bond begins to fracture, "
        		+ "a chain of extraordinary events unfold causing the son to undergo a remarkable transformation consumed by a thirst for vengeance.");

        // Act
        String result = movie.getMovie_Description();

        // Assert
        assertEquals("This is the story of a son whose love for his father knows no bounds.As their bond begins to fracture, "
        		+ "a chain of extraordinary events unfold causing the son to undergo a remarkable transformation consumed by a thirst for vengeance.", result);
    }
    
    @Test
    public void testGetMoviePoster() {
    	// Arrange
        movie = new Movie();
        movie.setMovie_Poster("C:/Users/pssim/git/MovieTicketReservationSystem/MovieTicketReservationSystem/src/main/webapp/images/animal.avif");

        // Act
        String result = movie.getMovie_Poster();

        // Assert
        assertEquals("C:/Users/pssim/git/MovieTicketReservationSystem/MovieTicketReservationSystem/src/main/webapp/images/animal.avif", result);
    }
    
    @Test
    public void testGetDuration() {
    	// Arrange
        movie = new Movie();
        movie.setMovie_Duration("3h 21m");

        // Act
        String result = movie.getMovie_Duration();

        // Assert
        assertEquals("3h 21m", result);
    }
    
    @Test
    public void testGetTrailer() {
    	// Arrange
        movie = new Movie();
        movie.setTrailerlink("https://www.youtube.com/watch?v=8FkLRUJj-o0");

        // Act
        String result = movie.getTrailerlink();

        // Assert
        assertEquals("https://www.youtube.com/watch?v=8FkLRUJj-o0", result);
    }
    
    @Test
    public void testGetGenre() {
    	// Arrange
        movie = new Movie();
        movie.setGenre("Action/Crime/Drama");

        // Act
        String result = movie.getGenre();

        // Assert
        assertEquals("Action/Crime/Drama", result);
    }
    
	@After
	public void tearDown() {
		movie = null;
	}

}
