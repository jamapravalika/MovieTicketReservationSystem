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
}
