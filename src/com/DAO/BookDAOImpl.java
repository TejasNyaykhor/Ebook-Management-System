package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BookDAOImpl implements BookDAO{

	
	private Connection conn;
	
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDetails b) {
		
		boolean f=false;
		
		try {
			
			String sql="insert into book_details (bookname,author,price,bookCategory,status,photo,user_email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getUser_email());
			
			int i=ps.executeUpdate();
			
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
		
	}

	@Override
	public List<BookDetails> getAllBook() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b=null;
		
		try {
			
			String sql="select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDetails();
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
			}
			
			
		}
		catch (Exception e) {
		e.printStackTrace();
		}
		
		
		
		return list;
	}

	
	public BookDetails getBookById(int id) {
		
		BookDetails b = null;  // created a refrence of bookdetails
		
		try {
			
			String sql="select * from book_details where bookID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new BookDetails();
				
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}

	@Override
	public boolean updateEditBooks(BookDetails b) {
		
		boolean f=false;;
		
		try {
			
			String sql="update book_details set bookname=?,author=?,price=?,status=? where bookID=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookID());
			
			int i = ps.executeUpdate();
			
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public boolean deleteBook(int id) {
		
		boolean f= false;
		try {
			String sql="delete from book_details where bookID=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			
			if (i==1) {
				f=true;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	
	
	                       //  New Book DAO code 
	
	
	@Override
	public List<BookDetails> getNewBook() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
	  BookDetails b = null;
	   
	  try {
		  
		  String sql="select * from book_details where bookCategory=? and status=? order by bookID DESC "; // order by bookID DESC se hame recent book show hongi ham add karte jayenge 
		  PreparedStatement ps = conn.prepareStatement(sql);
		  
		  ps.setString(1, "New");
		  ps.setString(2, "Active");
		  
		  ResultSet rs=ps.executeQuery();
		  
		  int i=1;
		  while (rs.next() && i<=4) {
			b=new BookDetails();
			
			b.setBookID(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookCategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUser_email(rs.getString(8));
			
			list.add(b);
			i++;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		return list;
	}
	
	
	
	        //  Recent Book Code 
  // Same code as New Book but little changes karege 

	@Override
	public List<BookDetails> getRecentBook() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		  BookDetails b = null;
		   
		  try {
			  
			  String sql="select * from book_details where status=? order by bookID DESC "; // order by bookID DESC se hame recent book show hongi ham add karte jayenge 
			  PreparedStatement ps = conn.prepareStatement(sql);
			  
			  ps.setString(1, "Active");
			 
			  
			  ResultSet rs=ps.executeQuery();
			  
			  int i=1;
			  while (rs.next() && i<=4) {
				b=new BookDetails();
				
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	      // Old Book DAO Code

	@Override
	public List<BookDetails> getOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		  BookDetails b = null;
		   
		  try {
			  
			  String sql="select * from book_details where bookCategory=? and status=? order by bookID DESC "; // order by bookID DESC se hame recent book show hongi ham add karte jayenge 
			  PreparedStatement ps = conn.prepareStatement(sql);
			  
			  ps.setString(1, "Old");
			  ps.setString(2, "Active");
			  
			  ResultSet rs=ps.executeQuery();
			  
			  int i=1;
			  while (rs.next() && i<=4) {
				b=new BookDetails();
				
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			return list;
		}
	
	
	
	   //   Get All Books for view all Button Code 
	
	
	

	@Override
	public List<BookDetails> getAllRecentBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		  BookDetails b = null;
		   
		  try {
			  
			  String sql="select * from book_details where status=? order by bookID DESC "; // order by bookID DESC se hame recent book show hongi ham add karte jayenge 
			  PreparedStatement ps = conn.prepareStatement(sql);
			  
			  ps.setString(1, "Active");
			 
			  
			  ResultSet rs=ps.executeQuery();
			  
		
			  while (rs.next() ) {
				b=new BookDetails();
				
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();
	  BookDetails b = null;
	   
	  try {
		  
		  String sql="select * from book_details where bookCategory=? and status=? order by bookID DESC "; // order by bookID DESC se hame recent book show hongi ham add karte jayenge 
		  PreparedStatement ps = conn.prepareStatement(sql);
		  
		  ps.setString(1, "New");
		  ps.setString(2, "Active");
		  
		  ResultSet rs=ps.executeQuery();
		  
		  
		  while (rs.next()) {
			b=new BookDetails();
			
			b.setBookID(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookCategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUser_email(rs.getString(8));
			
			list.add(b);
			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
		return list;
	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		  BookDetails b = null;
		   
		  try {
			  
			  String sql="select * from book_details where bookCategory=? and status=? order by bookID DESC "; // order by bookID DESC se hame recent book show hongi ham add karte jayenge 
			  PreparedStatement ps = conn.prepareStatement(sql);
			  
			  ps.setString(1, "Old");
			  ps.setString(2, "Active");
			  
			  ResultSet rs=ps.executeQuery();
			  
			  
			  while (rs.next()) {
				b=new BookDetails();
				
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				
				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			return list;
	}
	
	
	
	
	public List<BookDetails> getBookByOld(String email, String cate) {
	
		List<BookDetails> list= new ArrayList<BookDetails>();
		BookDetails b=null;
		
		try {
			
			String sql="select * from book_details where bookCategory=? and user_email=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b=new BookDetails();
				
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	
	@Override
	public boolean OldBookDelete(String email, String cate , int id) {
		boolean f=false;
		try {
			
			String sql="delete from book_details where bookCategory=? and user_email=? and bookID=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i =ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
	@Override
	public List<BookDetails> getBookBySearch(String ch) {
		List<BookDetails> list= new ArrayList<BookDetails>();
		BookDetails b=null;
		
		try {
			
			String sql="select * from book_details where bookname like ? or author like ? or bookCategory like ? and status=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%"); // user agar koi bhi book search karta hai toh   book,author,cate,,  koi bhi character match hota hai toh user books show hongi 
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b=new BookDetails();
				
				b.setBookID(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
		
	}
	
	
	
	
	
	
	

	
	

