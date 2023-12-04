package com.test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.Model.Theater;

public class TheaterTest {
	
	private Theater theater;

	@Before
	public void setUp() {
		theater = new Theater(); 
	}

	@Test
	public void testGetTheaterName() {
        // Arrange
		theater = new Theater();
		theater.setTheater_Name("AMB Cinemas");

        // Act
        String result = theater.getTheater_Name();

        // Assert
        assertEquals("AMB Cinemas", result);
    }
	
	@Test
	public void testGetAddress() {
        // Arrange
		theater = new Theater();
		theater.setAddress("Gachibowli");

        // Act
        String result = theater.getAddress();

        // Assert
        assertEquals("Gachibowli", result);
    }
	
	@Test
	public void testGetCapacity() {
        // Arrange
		theater = new Theater();
		theater.setCapacity(450);

        // Act
        int result = theater.getCapacity();

        // Assert
        assertEquals(450, result);
    }
	
	@After
	public void tearDown() {
		theater = null;
	}

}
