package com.booking;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BookFlight")
public class BookFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookFlight() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String uname = request.getParameter("uname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String date = request.getParameter("date");
		String cabin = request.getParameter("cabin");
		
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		
		String fname = request.getParameter("fname");
		// out.print(name);
		
		try {
			//CustomerDAO custDAO = new CustomerDAO();
			
			// or get it from session
			
			// int customerId = custDAO.getId(email);
			HttpSession session = request.getSession();
			int customerId = (int) session.getAttribute("username");
			
			
			FlightDAO flightDAO = new FlightDAO();
			String chk = flightDAO.getFlightIdPrice(fname,cabin, from ,to);
			String[] s = (flightDAO.getFlightIdPrice(fname,cabin, from ,to)).split("/");
			
			out.print(chk);
			
			double totalcost = Double.parseDouble(s[1]);
			int flightId = Integer.parseInt(s[0]);
			out.print(flightId);
			
			// HotelBooking insertion
			FlightBookingDAO book = new FlightBookingDAO();
			int i = book.addFlightBooking(customerId, flightId, date, cabin, totalcost);
			
			// completed
			String msg = i == 1 ? "Successfully Booked" : "Unable to book your Flight ticket. Try again Later";
			
			session.setAttribute("message", msg);
			response.sendRedirect("flightBooking.jsp");
			

		} catch (Exception e) {
			out.print(e);
		}
	}

}
