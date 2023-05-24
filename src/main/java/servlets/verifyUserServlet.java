package servlets;
import javax.servlet.*;
import dataBaseJava.databaseCodes;
import javax.servlet.http.*;
import java.io.PrintWriter;
import java.io.IOException;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.sql.*;

import java.io.*;  


/**
 * Servlet implementation class verifyUserServlet
 */
@WebServlet("/verifyUserServlet")
public class verifyUserServlet extends HttpServlet {
		protected void doGet (HttpServletRequest request, HttpServletResponse response)
		
		
		throws ServletException, IOException{
		
		PrintWriter out = response.getWriter();	
		try {
			
			String error = "Invalid session ID / Password cannot be null";
			String email = request.getParameter("emailInput");
			String password = request.getParameter("passwordInput");
			HttpSession session=request.getSession();
			session.removeAttribute("error");
			boolean check = false;

			if(email == null || password == null || email == "" || password == ""){
				error = "password and email cannot be null";
				session.setAttribute("error", error);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/project/pages/login.jsp");
				dispatcher.forward(request,response);
				return;
			} else {
				Object[] obj = databaseCodes.verifyUser(email,password);
				check = (Boolean) obj[0];
				error = (String) obj[1];
				String emailStr = (String) obj[2];
				if(error == "none") {
					session.setAttribute("isLoggedIn", check);
					session.setAttribute("email", emailStr);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/project/pages/admin.jsp");
					dispatcher.forward(request,response);
					return;
				} else {
					session.setAttribute("error", error);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/project/pages/login.jsp");
					dispatcher.forward(request,response);
					return;
				}
			}
		
		}catch(Exception e) {
			
		}
		
	}
		
	protected void doPost (HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		doGet(request,response);
	}
		
}
