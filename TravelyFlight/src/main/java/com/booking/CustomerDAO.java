package com.booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

	static String url = "jdbc:mysql://node83794-travely.whelastic.net/";
//	static String url = "jdbc:mysql://localhost:3306/";

	static String username = "root";
	static String password = "VLFmee15368";
//	static String password = "Guhapriya@18";
	static String db = "Travely";

	Connection connection;

	public CustomerDAO() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(url+db, username, password);
	}

	public int addCustomer(String name, String email, String mobile) throws Exception {

		int lastInsertedId = -1;		

		PreparedStatement myStmt = connection
				.prepareStatement("insert into Customer (name, email, mobile) " + "values (?,?,?)",Statement.RETURN_GENERATED_KEYS);
		myStmt.setString(1, name);
		myStmt.setString(2, email);
		myStmt.setString(3, mobile);

		int i = myStmt.executeUpdate();
		if (i == 1) {

			ResultSet rs = myStmt.getGeneratedKeys();
			if (rs.next()) {
				lastInsertedId = rs.getInt(1);
				System.out.println("Last inserted id: " + lastInsertedId);
			}

			System.out.println("Insert complete.");
		}

		return 1;
	}

	public void deleteCustomer() throws Exception {

	}

	public void updateCustomer() throws Exception {

	}
	
	public int addUser(String name, String email, String mobile, String password) throws Exception {

		int lastInsertedId = -1;
		
		// check already there
		
		if(check(email)==1) return 0;
	

		PreparedStatement myStmt = connection
				.prepareStatement("insert into Users (name, email, mobile, password) " + "values (?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
		myStmt.setString(1, name);
		myStmt.setString(2, email);
		myStmt.setString(3, mobile);
		myStmt.setString(4, password);


		int i = myStmt.executeUpdate();
		
		if (i == 1) {

			ResultSet rs = myStmt.getGeneratedKeys();
			if (rs.next()) {
				lastInsertedId = rs.getInt(1);
				System.out.println("Last inserted id: " + lastInsertedId);
			}
			
			PreparedStatement myStmt1 = connection
					.prepareStatement("insert into Login (id,  email, password) " + "values (?,?,?)");
			myStmt1.setInt(1, lastInsertedId);
			myStmt1.setString(2,email);
			myStmt1.setString(3, password);
			
			int i1 = myStmt1.executeUpdate();
			
			if (i1 == 1) {
				System.out.println("Insert complete.");
			}

		}

		return 1;
	}
	
	public int validate(String email, String password) throws Exception {


		String query = "SELECT id FROM `Users` WHERE `email` = ? and `password` = ?";

		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setString(1,  email);
		myStmt.setString(2, password);

		ResultSet rs = myStmt.executeQuery();

		int rowCount = 0, id =-1;
		
	        while (rs.next()) {
	    	 id = rs.getInt("id");
	        }

		return id;
	}
	
	public int check(String email) throws Exception {


		String query = "SELECT * FROM `Users` WHERE `email` = ?";

		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setString(1,  email);

		ResultSet rs = myStmt.executeQuery();

		int rowCount = 0;
	      while (rs.next()) {
	           rowCount++;
	      }
	      if(rowCount==1) return 1;

		return 0;
	}
	
	public int getId(String email) throws Exception {
		String query = "SELECT id FROM `Users` WHERE `email` = ?";

		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setString(1,  email);

		ResultSet rs = myStmt.executeQuery();

		int id = 1;
	    while (rs.next()) {
	         id = rs.getInt("id");
	    }
	    

		return id;
	}
	
	
}
