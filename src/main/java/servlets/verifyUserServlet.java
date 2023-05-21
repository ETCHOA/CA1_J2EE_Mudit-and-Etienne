package servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.PrintWriter;
import java.io.IOException;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.sql.*;

import java.io.*;  


/**
 * Servlet implementation class VerifyUserServlet
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
			boolean check = false;

			if(email == null || password == null || email == "" || password == ""){
				error = "password and email cannot be null";
				response.sendRedirect("project/pages/login.jsp?msg="+error);
				return;
			}

			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
				
				Connection connection = DriverManager.getConnection(connURL);
				
				Statement statement = connection.createStatement();
				
				String sqlStr = "SELECT * FROM users where email=? and password=?;";
				
				PreparedStatement ps = connection.prepareStatement(sqlStr);
				ps.setString(1, email);
				ps.setString(2, password);
				
				ResultSet resultSet = ps.executeQuery();

				String emailReturn = "";
				String passwordReturn = "";
				
				while(resultSet.next()){
					check = true;
				}

				connection.close();

			} catch (SQLException e){
				out.println(e);
			}
			HttpSession session=request.getSession();  

			if(check == false){
				error = "Wrong password / user email does not exist";	
				response.sendRedirect("project/pages/login.jsp?error="+error);
			} else {
				session.setAttribute("email",email);
				session.setAttribute("isLoggedIn", true);
				String sessionId = session.getId();
				String encodedURL = response.encodeURL("project/pages/admin.jsp;jsessionid="+sessionId);
				response.sendRedirect(encodedURL);
			}
			
		} catch(Exception e) {
			out.println(e);
		}
		
	}
	
	
}
