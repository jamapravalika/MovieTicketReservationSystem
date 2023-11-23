package com.Model;

public class Admin {
	private int Admin_Id;
	private int Admin_Name;
	private int Admin_Email;
	private int Admin_Pwd;
	private int Admin_Role;
	public Admin() {
		
	}
	public Admin(int admin_Id, int admin_Name, int admin_Email, int admin_Pwd, int admin_Role) {
		super();
		Admin_Id = admin_Id;
		Admin_Name = admin_Name;
		Admin_Email = admin_Email;
		Admin_Pwd = admin_Pwd;
		Admin_Role = admin_Role;
	}
	public int getAdmin_Id() {
		return Admin_Id;
	}
	public void setAdmin_Id(int admin_Id) {
		Admin_Id = admin_Id;
	}
	public int getAdmin_Name() {
		return Admin_Name;
	}
	public void setAdmin_Name(int admin_Name) {
		Admin_Name = admin_Name;
	}
	public int getAdmin_Email() {
		return Admin_Email;
	}
	public void setAdmin_Email(int admin_Email) {
		Admin_Email = admin_Email;
	}
	public int getAdmin_Pwd() {
		return Admin_Pwd;
	}
	public void setAdmin_Pwd(int admin_Pwd) {
		Admin_Pwd = admin_Pwd;
	}
	public int getAdmin_Role() {
		return Admin_Role;
	}
	public void setAdmin_Role(int admin_Role) {
		Admin_Role = admin_Role;
	}
	@Override
	public String toString() {
		return "Admin [Admin_Id=" + Admin_Id + ", Admin_Name=" + Admin_Name + ", Admin_Email=" + Admin_Email
				+ ", Admin_Pwd=" + Admin_Pwd + ", Admin_Role=" + Admin_Role + "]";
	}
	
	
	
}
