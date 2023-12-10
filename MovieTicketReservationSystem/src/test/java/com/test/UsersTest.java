package com.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.Dao.UserDao;
import com.Model.users;

public class UsersTest {
	
	private UserDao userDao;

    @Before
    public void setUp() {
        userDao = new UserDao();
    }

    @Test
    public void testGetAllUsers() {
        List<users> userList = userDao.getAllUsers();

        assertNotNull(userList);
        assertTrue(userList.size() > 0);
    }

    @Test
    public void testGetUserById() {
        int userId = 1;
        List<users> userList = userDao.getUserById(userId);

        assertNotNull(userList);
        assertTrue(userList.size() > 0);
        assertEquals(userId, userList.get(0).getUser_Id());
    }

    @Test
    public void testUpdateUserProfile() {
        users user = new users();
        user.setUser_Id(1);
        user.setUser_Name("SarahSusan");
        user.setUser_Email("pssarahsusan@gmail.com");
        user.setUser_Mobile(1234567890);

        boolean isUpdated = userDao.updateUserProfile(user);

        assertTrue(isUpdated);

        // Verify the changes by fetching the updated user
        List<users> updatedUserList = userDao.getUserById(user.getUser_Id());
        assertEquals("SarahSusan", updatedUserList.get(0).getUser_Name());
        assertEquals("pssarahsusan@gmail.com", updatedUserList.get(0).getUser_Email());
        assertEquals(1234567890, updatedUserList.get(0).getUser_Mobile());
    }

    @After
    public void tearDown() {
        userDao = null;
    }
}