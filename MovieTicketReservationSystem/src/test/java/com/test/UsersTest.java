package com.test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.Model.users;

public class UsersTest {
	
	private users user;

    @Before
    public void setUp() {
        user = new users();
    }

    @Test
    public void testGetUserName() {
        // Arrange
        user.setUser_Name("JohnDoe");

        // Act
        String result = user.getUser_Name();

        // Assert
        assertEquals("JohnDoe", result);
    }

    @Test
    public void testGetUserEmail() {
        // Arrange
        user.setUser_Email("john.doe@example.com");

        // Act
        String result = user.getUser_Email();

        // Assert
        assertEquals("john.doe@example.com", result);
    }

    @Test
    public void testGetUserPassword() {
        // Arrange
        user.setUser_Pwd("password123");

        // Act
        String result = user.getUser_Pwd();

        // Assert
        assertEquals("password123", result);
    }

    @Test
    public void testGetUserMobile() {
        // Arrange
        user.setUser_Mobile(1234567890);

        // Act
        long result = user.getUser_Mobile();

        // Assert
        assertEquals(1234567890, result);
    }

    @Test
    public void testGetUserRole() {
        // Arrange
        user.setRole("users");

        // Act
        String result = user.getRole();

        // Assert
        assertEquals("users", result);
    }


    @After
    public void tearDown() {
        user = null;
    }
}