package com.booking;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FlightBookingDAO {
	static String url = "jdbc:mysql://node83794-travely.whelastic.net/";
//	static String url = "jdbc:mysql://localhost:3306/";

	static String username = "root";
	static String password = "VLFmee15368";
//	static String password = "Guhapriya@18";
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

	public List<String> updateFlightBooking(String id) throws Exception {

		String query = "SELECT * FROM `FlightBooking` WHERE `flight_id` = ?";

		List<String> availFlights = new ArrayList<>();
		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setString(1, id);

		ResultSet rs = myStmt.executeQuery();

		while (rs.next()) {
			String date = rs.getString("date"), classType = rs.getString("class") ;
			int cid = rs.getInt("customer_id");
			double price = rs.getDouble("price");
			
			String name="";
			

			PreparedStatement stmt = connection.prepareStatement(
					"SELECT * FROM `Users` WHERE `id` = ?");
			stmt.setInt(1, cid);

			ResultSet rset = stmt.executeQuery();

			while (rset.next()) {
				name = rset.getString("name");
			}

			String value = name+"/"+date+"/"+classType+"/"+price;

			availFlights.add(value);
		}

		return availFlights;

	}

	public List<String> getBookings(int id)  throws Exception {

		String query = "SELECT * FROM `FlightBooking` WHERE `customer_id` = ?";

		List<String> availFlights = new ArrayList<>();
		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setInt(1, id);

		ResultSet rs = myStmt.executeQuery();

		while (rs.next()) {
			String date = rs.getString("date"), classType = rs.getString("class") ;
			int fid = rs.getInt("flight_id");
			double price = rs.getDouble("price");
			
			String name="", from="", to="";
			

			PreparedStatement stmt = connection.prepareStatement(
					"SELECT * FROM `Flight` WHERE `id` = ?");
			stmt.setInt(1, fid);

			ResultSet rset = stmt.executeQuery();

			while (rset.next()) {
				name = rset.getString("name");
				from = rset.getString("from");
				to = rset.getString("to");
			}

			String value = name+"/"+from+"/"+to+"/"+date+"/"+classType+"/"+price;

			availFlights.add(value);
		}

		return availFlights;
	}
}
