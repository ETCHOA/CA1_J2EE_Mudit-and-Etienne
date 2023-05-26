package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
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
		try {
			String id = request.getParameter("cart");
			
			if(!(id == null)) {
				ArrayList<String> bookList = (ArrayList<String>) session.getAttribute("cartList");
				
				if(bookList == null) {
					bookList = new ArrayList<String>();
				}
				bookList.add(id);
				session.setAttribute("cartList", bookList);
			} else {
				session.setAttribute("cart","Book failed to add to Cart");
				response.sendRedirect("project/pages/details.jsp?id="+id);
			}
			session.setAttribute("cart","Book successfully added to Cart");
			/*
			RequestDispatcher dispatcher = request.getRequestDispatcher("details.jsp?id="+id);
			dispatcher.forward(request,response);
			*/
			response.sendRedirect("project/pages/details.jsp?id="+id);
		} catch(Exception e) {
			session.setAttribute("cart","Book failed to add to Cart");
			response.sendRedirect("project/pages/search.jsp");
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
