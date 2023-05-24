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
 * Servlet implementation class updateBooks
 */
@WebServlet("/updateBooks")
public class updateBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String type = request.getParameter("type");
		String idStr =request.getParameter("id");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(idStr);
		
		//out.print(id);
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

			
			
			String msg = databaseCodes.updateBook(title, author, price, quantity, publisher, date, isbn, category, rating, desc, id);
			out.print(msg);
			session.setAttribute("updated", msg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("project/pages/changebooks.jsp?id"+id);
			dispatcher.forward(request,response);
			return;
		} catch(Exception e){
			out.print(e);
			if(title == null){
				RequestDispatcher dispatcher = request.getRequestDispatcher("project/pages/changebooks.jsp?id"+id);
				dispatcher.forward(request,response);
				return;
			}
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
