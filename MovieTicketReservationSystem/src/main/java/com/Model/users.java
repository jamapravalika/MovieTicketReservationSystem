package com.Model;

import java.sql.Timestamp;

public class users {
	private int User_Id;
	private String User_Name;
	private String User_Email;
	private String User_Pwd;
	private long User_Mobile;
	private String Role;
	private Timestamp createdAt;
	
	
	public users() {
		super();
	}
	public users(int user_Id, String user_Name, String user_Email, String user_Pwd, long user_Mobile, String role,
			Timestamp createdAt) {
		super();
		User_Id = user_Id;
		User_Name = user_Name;
		User_Email = user_Email;
		User_Pwd = user_Pwd;
		User_Mobile = user_Mobile;
		Role = role;
		this.createdAt = createdAt;
	}
	public int getUser_Id() {
		return User_Id;
	}
	public void setUser_Id(int user_Id) {
		User_Id = user_Id;
	}
	public String getUser_Name() {
		return User_Name;
	}
	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}
	public String getUser_Email() {
		return User_Email;
	}
	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
	}
	public String getUser_Pwd() {
		return User_Pwd;
	}
	public void setUser_Pwd(String user_Pwd) {
		User_Pwd = user_Pwd;
	}
	public long getUser_Mobile() {
		return User_Mobile;
	}
	public void setUser_Mobile(long user_Mobile) {
		User_Mobile = user_Mobile;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	@Override
	public String toString() {
		return "users [User_Id=" + User_Id + ", User_Name=" + User_Name + ", User_Email=" + User_Email + ", User_Pwd="
				+ User_Pwd + ", User_Mobile=" + User_Mobile + ", Role=" + Role + ", createdAt=" + createdAt + "]";
	}
	
	
	
}
