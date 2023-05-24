package servlets;
import javax.servlet.*;
import dataBaseJava.databaseCodes;
import javax.servlet.http.*;
import java.io.PrintWriter;
import java.io.IOException;


import java.io.IOException;

import javax.servlet.annotation.WebServlet;

import java.sql.*;

import java.io.*;  

/**
 * Servlet implementation class deleteBooks
 */
@WebServlet("/deleteBooks")
public class deleteBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idStr =request.getParameter("id");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(idStr);
		int deleted = 0;
		try {
			deleted = databaseCodes.deleteBook(id);
		} catch(Exception e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("project/pages/deleteBooks.jsp?result=0");
			dispatcher.forward(request,response);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("project/pages/deleteBooks.jsp?result="+deleted);
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
