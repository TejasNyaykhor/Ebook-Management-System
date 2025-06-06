package com.entity;

public class contact {
	
	private int id;
    private String name;
    private String email;
    private String subject;
    private String messege;
    
	public contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessege() {
		return messege;
	}
	public void setMessege(String messege) {
		this.messege = messege;
	}
	@Override
	public String toString() {
		return "contact [id=" + id + ", name=" + name + ", email=" + email + ", subject=" + subject + ", messege="
				+ messege + "]";
	}
    
    
}
