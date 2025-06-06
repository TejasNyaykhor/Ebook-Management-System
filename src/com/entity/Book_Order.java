package com.entity;

public class Book_Order {

	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phone;
	private String fulladd;
	private String bookName;
	private String author;
	private String price;
	private String paymentType;
	
	public Book_Order() {
		super();
		
	}
	
	

	public String getBookName() {
		return bookName;
	}



	public void setBookName(String bookName) {
		this.bookName = bookName;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", phone=" + phone + ", fulladd=" + fulladd + ", bookName=" + bookName + ", author=" + author
				+ ", price=" + price + ", paymentType=" + paymentType + "]";
	}
	
	
}
