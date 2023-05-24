package dataBaseJava;

import java.sql.Connection;
import java.util.ArrayList;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.*;
import javax.swing.JOptionPane;

public class databaseCodes {

	// verify User
	
	public static Object[] verifyUser(String email,String password) {
		String loggedInErr = "Invalid session ID / Password or Email cannot be null";
		String emailStr = "";
		
		boolean check = false;
        Object[] arrayObjects = new Object[3];
		if (!(email == null || email.equals("") || password == null || password.equals(""))) {
			try {
				
				// Connect to database
				
				Class.forName("com.mysql.jdbc.Driver");
				
				String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
				
				Connection connection = DriverManager.getConnection(connURL);
				
				Statement statement = connection.createStatement();
				
				String sqlStr = "SELECT email FROM users where email=? and password=?;";
				
				// Prepared String
				
				PreparedStatement ps = connection.prepareStatement(sqlStr);
				ps.setString(1, email);
				ps.setString(2, password);
				
				ResultSet resultSet = ps.executeQuery();

				String emailReturn = "";
				String passwordReturn = "";
				
				while(resultSet.next()){
					check = true;
					emailStr = resultSet.getString("email");
				}

				connection.close();
				
				if(check == false){
					loggedInErr = "Wrong password / user email does not exist";	
				} else {
					loggedInErr = "none";
				}

			} catch (Exception e){
				System.out.println(e);
			}
		}
		arrayObjects [0] = check;
        arrayObjects [1] = loggedInErr;
        arrayObjects [2] = emailStr;
        return arrayObjects;
	}
	
	
	
	// get page objects functions
	
	
	public static Object[] getRecords(String searchStr,String catStr){
		// ArrrayLists of data
		ArrayList<Integer> ids = new ArrayList<>();
		ArrayList<String> titles = new ArrayList<>();
		ArrayList<Double> prices = new ArrayList<>();
		ArrayList<Double> ratings = new ArrayList<>();
		ArrayList<String> genres = new ArrayList<>();
		Object[] arrayObjects = new Object[5];
		
		try {
			// Connect to database
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
			
			Connection connection = DriverManager.getConnection(connURL);
			
			Statement statement = connection.createStatement();
			
			
			// SQL statement (take first 200 datasets)
			String sqlStr = "";
			if(searchStr == null && catStr.equals("none")){
				sqlStr = "SELECT id,title,price,rating,genre FROM books limit 0, 199";
			} else 	{
				if(catStr.equals("")){
					sqlStr = "SELECT id,title,price,rating,genre FROM books limit 0, 199";
				}else if(catStr.equals("none")){
					sqlStr = "SELECT id,title,price,rating,genre FROM books where title LIKE ? LIMIT 0,199";
				} else if (searchStr == null) {
					sqlStr = "SELECT id,title,price,rating,genre FROM books where genre=? LIMIT 0,199";
				} else {
					sqlStr = "SELECT id,title,price,rating,genre FROM books where title LIKE ? and genre=? LIMIT 0,199 ";
				}
						
			}
			
			PreparedStatement ps = connection.prepareStatement(sqlStr);
			
			
			if(!(searchStr == null && (catStr.equals("none")))){
				if(!(catStr.equals(""))){
					if(catStr.equals("none")){
						ps.setString(1,"%" + searchStr + "%");
					}else if(searchStr == null){
						ps.setString(1,catStr);
					} else {
						ps.setString(1,"%" + searchStr + "%");
						ps.setString(2,catStr);
					}
				}
			
			}
			
			// Execute Query
			
			ResultSet resultSet = ps.executeQuery();
			
			while(resultSet.next()){
				Integer id = resultSet.getInt("id");
				String title = resultSet.getString("title");
				double price = resultSet.getDouble("price");
				double rating = resultSet.getDouble("rating");
				String genre = resultSet.getString("genre");

				ids.add(id);
				titles.add(title);
				prices.add(price);
				ratings.add(rating);
				genres.add(genre);
			}

			connection.close();
		}catch(Exception e) {
			
		}
		arrayObjects[0] = ids;
		arrayObjects[1] = titles;
		arrayObjects[2] = prices;
		arrayObjects[3] = ratings;
		arrayObjects[4] = genres;
		
		return arrayObjects;
	}
	
	// update books func
	
	public static Object[] getBooks(String id) {
		Object[] arrayObjects = new Object[10];
		
		String title = "";
		String author = "";
		String publisher = "";
		String isbn = "";
		String category = "";
		String desc = "";
		String date = "";
		double price = 0;
		Integer quantity = 0;
		double rating = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
			
			Connection connection = DriverManager.getConnection(connURL);
			
			Statement statement = connection.createStatement();
			
			String sqlStr = "SELECT * FROM BOOKS WHERE id=?";
			
			PreparedStatement ps = connection.prepareStatement(sqlStr);
			ps.setString(1,id);
			
			ResultSet resultSet = ps.executeQuery();
			
			while (resultSet.next()){
				title = resultSet.getString("title");
				author = resultSet.getString("author");
				price = resultSet.getDouble("price");
				quantity = resultSet.getInt("quantity");
				publisher = resultSet.getString("publisher");
				date = resultSet.getString("publication_date");
				isbn = resultSet.getString("isbn");
				category = resultSet.getString("genre");
				rating = resultSet.getDouble("rating");
				desc = resultSet.getString("description");
			}

		}catch(Exception e){
			System.out.print(e);
		}
		
		arrayObjects[0] = title;
		arrayObjects[1] = author;
		arrayObjects[2] = price;
		arrayObjects[3] = quantity;
		arrayObjects[4] = publisher;
		arrayObjects[5] = date;
		arrayObjects[6] = isbn;
		arrayObjects[7] = category;
		arrayObjects[8] = rating;
		arrayObjects[9] = desc;
				
		return arrayObjects;
	}
	
	public static String updateBook(String title,String author,Double price,int quantity,String publisher,String date,String isbn,String category,double rating,String desc,int id) {
		String msg = "";
		//JOptionPane.showMessageDialog(null, "alert", "alert", JOptionPane.ERROR_MESSAGE);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
			
			Connection connection = DriverManager.getConnection(connURL);
			
			Statement statement = connection.createStatement();
			String sqlStr = "Update BOOKS SET title=?,author=?,price=?,quantity=?,publisher=?,publication_date=?,isbn=?,genre=?,rating=?,description=? WHERE id=?";
			PreparedStatement ps = connection.prepareStatement(sqlStr);
			ps.setString(1,title);
			ps.setString(2,author);
			ps.setDouble(3,price);
			ps.setInt(4,quantity);
			ps.setString(5,publisher);
			ps.setString(6,date);
			ps.setString(7,isbn);
			ps.setString(8,category);
			ps.setDouble(9,rating);
			ps.setString(10,desc);
			
			ps.setInt(11,id);
			
			System.out.println(ps);
			int rowsChanged = ps.executeUpdate();
			
			if(rowsChanged == 1){
				msg = "Book successfully updated!";
			} else {
				msg = "Book failed to update";
			}

			connection.close();
			
		} catch(Exception e){
			System.out.print(e);
		}
		return msg;
	}
	
	// add books func 
	
	public static String addBook(String title,String author,Double price,int quantity,String publisher,String date,String isbn,String category,double rating,String desc) {
		String msg = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
			
			Connection connection = DriverManager.getConnection(connURL);
			
			Statement statement = connection.createStatement();
			String sqlStr = "INSERT INTO BOOKS (title,author,price,quantity,publisher,publication_date,isbn,genre,rating,description) values (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sqlStr);
			
			ps.setString(1,title);
			ps.setString(2,author);
			ps.setDouble(3,price);
			ps.setInt(4,quantity);
			ps.setString(5,publisher);
			ps.setString(6,date);
			ps.setString(7,isbn);
			ps.setString(8,category);
			ps.setDouble(9,rating);
			ps.setString(10,desc);
			
			int rowsChanged = ps.executeUpdate();
			if(rowsChanged == 1){
				msg = "Book successfully added!";
			} else {
				msg = "Book failed to add";
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		return msg;
	}
	
	public static int deleteBook(int id) {
		int resultSet = 0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
			
			Connection connection = DriverManager.getConnection(connURL);
			
			Statement statement = connection.createStatement();
			
			String sqlStr = "DELETE FROM BOOKS WHERE id=?";
			
			PreparedStatement ps = connection.prepareStatement(sqlStr);
			ps.setInt(1,id);
			
			resultSet = ps.executeUpdate();
			connection.close();
				
			
		} catch(Exception e) {
			System.out.print(e);
		}
		return resultSet;
	}
}
