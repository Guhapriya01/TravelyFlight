package com.booking;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FlightBookingDAO {
	static String url = "jdbc:mysql://node83794-travely.whelastic.net/";
	static String username = "root";
	static String password = "VLFmee15368";
	static String db = "Travely";


	Connection connection;

	public FlightBookingDAO() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(url+db, username, password);
	}

	public int addFlightBooking(int cid, int fid, String date, String cabin, double cost)
			throws Exception {

		PreparedStatement myStmt = connection.prepareStatement(
				"insert into FlightBooking (flight_id, customer_id, date, class, price) values (?,?,?,?,?)");
		myStmt.setInt(1, fid);
		myStmt.setInt(2, cid);
		myStmt.setString(3, date);
		myStmt.setString(4, cabin);
		myStmt.setDouble(5, cost);

		int i = myStmt.executeUpdate();
		System.out.println("Insert complete.");
		return i;
	}

	public void deleteFlightBooking() throws Exception {

	}

	public void updateFlightBooking() throws Exception {

	}
}
