package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BookDAO {

	public boolean addBooks(BookDetails b);
	
	public List<BookDetails>  getAllBook();
	
	public BookDetails getBookById(int id); // ID ke helps se book ko Get karenga jab koi book edit karna hoo

	public boolean updateEditBooks(BookDetails b);
	
	public boolean deleteBook(int id);
	
	public List<BookDetails> getNewBook();
	
	public List<BookDetails> getRecentBook();
	
	public List<BookDetails> getOldBook();
	
	public List<BookDetails> getAllRecentBook();
	
	public List<BookDetails> getAllNewBook();
	
	public List<BookDetails> getAllOldBook();

    public List<BookDetails> getBookByOld(String email,String cate); // user multiple book bhi add kar skta hai jo User Login hai uske Email  ke help se book ko show karege or category wise book show honi chahiye 
	
	public boolean OldBookDelete(String email,String cate,int id);
	
	public List<BookDetails> getBookBySearch(String ch);
	
		
	
}
