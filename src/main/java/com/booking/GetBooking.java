package com.booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetBooking")
public class GetBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");

		try {
			FlightBookingDAO flightDAO = new FlightBookingDAO();
			List<String> results = flightDAO.updateFlightBooking(id);

			request.setAttribute("flights", results);

			RequestDispatcher rd = request.getRequestDispatcher("adminbooking.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			out.print(e);
		}

	}

}
