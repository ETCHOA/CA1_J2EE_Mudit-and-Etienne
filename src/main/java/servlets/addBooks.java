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
 * Servlet implementation class addBooks
 */
@WebServlet("/addBooks")
public class addBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		
		
		String title = "";
		String author = "";
		String priceStr = "";
		String quantityStr = "";
		String publisher = "";
		String date = "";
		String isbn = "";
		String category = "";
		String ratingStr = "";
		String desc = "";
		double price = 0;
		Integer quantity = 0;
		double rating = 0;
		String msg = "";
		
		try {
			title = request.getParameter("titleInput");
			author = request.getParameter("authorInput");
			priceStr = request.getParameter("priceInput");
			quantityStr = request.getParameter("quantityInput");
			publisher = request.getParameter("publisherInput");
			date = request.getParameter("dateInput");
			isbn = request.getParameter("isbnInput");
			category = request.getParameter("categorySelect");
			ratingStr = request.getParameter("ratingInput");
			desc = request.getParameter("descInput");
			price = Double.parseDouble(priceStr);
			quantity = Integer.parseInt(quantityStr);
			rating = Double.parseDouble(ratingStr);

			
			
			msg = databaseCodes.addBook(title, author, price, quantity, publisher, date, isbn, category, rating, desc);
			out.print(msg);
			session.setAttribute("added", msg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("project/pages/addbooks.jsp");
			dispatcher.forward(request,response);
			return;
		} catch(Exception e){
			//out.print(e);
			if(title == null){
				session.setAttribute("added", msg);
				RequestDispatcher dispatcher = request.getRequestDispatcher("project/pages/addbooks.jsp");
				dispatcher.forward(request,response);
				return;
			}
			session.setAttribute("added", msg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("project/pages/addbooks.jsp");
			dispatcher.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
