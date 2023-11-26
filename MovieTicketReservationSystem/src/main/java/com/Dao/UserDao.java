package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Db.DbConnection;
import com.Model.users;

public class UserDao implements UserDaoIntrf {

    private static final String SELECT_ALL_USERS_QUERY = "SELECT * FROM users";
    private static final String SELECT_USER_BY_ID_QUERY = "SELECT * FROM users WHERE userId = ?";
    private static final String UPDATE_USER_PROFILE_QUERY = "UPDATE users SET uname=?, uemail=?, umobile=? WHERE userId=?";


    @Override
    public List<users> getAllUsers() {
        Connection con = DbConnection.getConnection();
        List<users> userList = new ArrayList<>();

        try {
            PreparedStatement pstmt = con.prepareStatement(SELECT_ALL_USERS_QUERY);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                users user = new users();
                user.setUser_Id(rs.getInt("userId"));
                user.setUser_Name(rs.getString("uname"));
                user.setUser_Pwd(rs.getString("upwd"));
                user.setUser_Email(rs.getString("uemail"));
                user.setUser_Mobile(rs.getLong("umobile"));
                user.setRole(rs.getString("role"));
                user.setCreatedAt(rs.getTimestamp("created_at"));

                userList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Error Retrieving data: " + e.getLocalizedMessage());
        }

        return userList;
    }


	@Override
	public List<users> getUserById(int userId) {
		// TODO Auto-generated method stub
		List<users> userList = new ArrayList<>();
		Connection con = DbConnection.getConnection();
        users user = null;

        try {
            PreparedStatement pstmt = con.prepareStatement(SELECT_USER_BY_ID_QUERY);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new users();
                user.setUser_Id(rs.getInt("userId"));
                user.setUser_Name(rs.getString("uname"));
                user.setUser_Pwd(rs.getString("upwd"));
                user.setUser_Email(rs.getString("uemail"));
                user.setUser_Mobile(rs.getLong("umobile"));
                user.setRole(rs.getString("role"));
                user.setCreatedAt(rs.getTimestamp("created_at"));
                
                userList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Error Retrieving data: " + e.getLocalizedMessage());
        }

        return userList;
    }
	

	   
	    public boolean updateUserProfile(users user) {
	        Connection con = DbConnection.getConnection();

	        try {
	            PreparedStatement pstmt = con.prepareStatement(UPDATE_USER_PROFILE_QUERY);
	            pstmt.setString(1, user.getUser_Name());
	            pstmt.setString(2, user.getUser_Email());
	            pstmt.setLong(3, user.getUser_Mobile());
	            pstmt.setInt(4, user.getUser_Id());

	            int rowsAffected = pstmt.executeUpdate();

	            return rowsAffected > 0;
	        } catch (SQLException e) {
	            System.out.println("Error updating user profile: " + e.getLocalizedMessage());
	            return false;
	        }
	    }
    
}
