package com.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.Dao.TheaterDao;
import com.Model.Theater;

public class TheaterTest {
	
	private TheaterDao theaterDao;

    @Before
    public void setUp() {
        theaterDao = new TheaterDao();
    }

    @Test
    public void testAddTheater() {
        Theater theater = new Theater();
        theater.setTheater_Name("MovieMax");
        theater.setAddress("AMR, ECIL Secunderabad");
        theater.setCapacity(100);

        theaterDao.addTheater();

        List<Theater> theaters = theaterDao.displayTheaterdetails();

        assertNotNull(theaters);
        assertTrue(theaters.size() > 0);
    }

    @Test
    public void testEditTheater() {
        Theater theater = new Theater();
        theater.setTheater_Id(1);
        theater.setTheater_Name("Platinum Movietime Cinema");
        theater.setAddress("Gachibowli SLN Terminus");
        theater.setCapacity(350);

        theaterDao.editTheater(theater);

        Theater updatedTheater = theaterDao.getTheaterById(theater.getTheater_Id());

        assertNotNull(updatedTheater);
        assertEquals("Platinum Movietime Cinema", updatedTheater.getTheater_Name());
        assertEquals("Gachibowli SLN Terminus", updatedTheater.getAddress());
        assertEquals(350, updatedTheater.getCapacity());
    }

    @Test
    public void testRemoveTheater() {
        int theaterIdToRemove = 6;
        theaterDao.removeTheater(theaterIdToRemove);

        Theater removedTheater = theaterDao.getTheaterById(theaterIdToRemove);

        assertNull(removedTheater);
    }

    @Test
    public void testDisplayTheaterdetails() {
        List<Theater> theaters = theaterDao.displayTheaterdetails();

        assertNotNull(theaters);
        assertTrue(theaters.size() > 0);
    }

    @Test
    public void testGetTheaterById() {
        int theaterId = 1;
        Theater theater = theaterDao.getTheaterById(theaterId);

        assertNotNull(theater);
        assertEquals(theaterId, theater.getTheater_Id());
    }

    @After
    public void tearDown() {
        theaterDao = null;
    }
}
