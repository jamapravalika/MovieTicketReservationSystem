package com.test;

import static org.junit.Assert.*;

import java.sql.Time;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.Model.Bookings;

public class BookingTest {

	private Bookings booking;

    @Before
    public void setUp() {
        booking = new Bookings();
    }

    @Test
    public void testGetUserEmail() {
        // Arrange
        booking.setUseremail("john.doe@example.com");

        // Act
        String result = booking.getUseremail();

        // Assert
        assertEquals("john.doe@example.com", result);
    }

    @Test
    public void testGetMovieName() {
        // Arrange
        booking.setMovieName("Animal");

        // Act
        String result = booking.getMovieName();

        // Assert
        assertEquals("Animal", result);
    }

    @Test
    public void testGetTheaterName() {
        // Arrange
        booking.setTheaterName("AMB Cinemas");

        // Act
        String result = booking.getTheaterName();

        // Assert
        assertEquals("AMB Cinemas", result);
    }

    @Test
    public void testGetShowTime() {
        // Arrange
    	Time showTime = Time.valueOf("14:30:00");
        booking.setShowTime(showTime);

        // Act
        Time result = booking.getShowTime();

        // Assert
        assertEquals(showTime, result);
    }

    @Test
    public void testGetQuantity() {
        // Arrange
        booking.setQuantity(2);

        // Act
        int result = booking.getQuantity();

        // Assert
        assertEquals(2, result);
    }

    @Test
    public void testGetTotalPrice() {
        // Arrange
        booking.setTotalPrice(500);

        // Act
        float result = booking.getTotalPrice();

        // Assert
        assertEquals(500, result, 0.0f);
    }

    @Test
    public void testGetMoviePoster() {
        // Arrange
        booking.setMoviePoster("C:/Users/pssim/git/MovieTicketReservationSystem/MovieTicketReservationSystem/src/main/webapp/images/animal.avif");

        // Act
        String result = booking.getMoviePoster();

        // Assert
        assertEquals("C:/Users/pssim/git/MovieTicketReservationSystem/MovieTicketReservationSystem/src/main/webapp/images/animal.avif", result);
    }

    @Test
    public void testIsConfirmed() {
        // Arrange
        booking.setConfirmed(true);

        // Act
        boolean result = booking.isConfirmed();

        // Assert
        assertTrue(result);
    }

    @After
    public void tearDown() {
        booking = null;
    }
}