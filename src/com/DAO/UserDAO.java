package com.DAO; // Data Access Object

import com.entity.User;

public interface UserDAO {

	public boolean userRegister(User us); // us is called as update user
	
	public  User login(String email , String password);
	
	
	public boolean checkPassword(int id,String ps);    // update user details method
	
	public boolean updateProfile(User us);
	
	public boolean checkUser(String em); // same email Login checking 
	
}
