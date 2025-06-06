package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.contact;

public class ContactDAOImpl implements ContactDAO{

	
	private Connection conn;
	public ContactDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}




	@Override
	public boolean userContact(contact c) {
		boolean f=false;
		try {
			
			String sql="insert into contact_msg(name,email,subject,messege) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getSubject());
			ps.setString(4, c.getMessege());
			
			int i=ps.executeUpdate();
			
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
