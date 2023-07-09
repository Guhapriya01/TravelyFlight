package com.booking;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		HttpSession session = request.getSession();
		
		
//		if(email=="admin" && pwd=="admin") {
//			session.setAttribute("username",email);
//			response.sendRedirect("admin.jsp");
//			
//		}
//		else {
			try {
				CustomerDAO custDAO = new CustomerDAO();
				int id = custDAO.validate( email, pwd);
				
				String valid = "false";
				
				if(id!=1) {
					session.setAttribute("username",id);
					
					response.sendRedirect("flight.jsp");
				}
				else {
					// invalid
					response.sendRedirect("index.jsp");
				}
				

			} catch (Exception e) {
				out.print(e);
			}
	}

}
