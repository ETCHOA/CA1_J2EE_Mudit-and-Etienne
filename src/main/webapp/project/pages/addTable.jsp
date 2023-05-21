<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%
boolean status = false;
String error = "Invalid session ID / Password cannot be null";
String email = "";
try {
	email = (String)session.getAttribute("email");
	status = (boolean)session.getAttribute("isLoggedIn");
}catch(Exception e){
	response.sendRedirect("login.jsp?msg="+error);
	return;
}
if(email == null || !(status)){
	response.sendRedirect("login.jsp?msg="+error);
	return;
}
String type = request.getParameter("type");
String id =request.getParameter("id");
out.print(type);

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
Integer rating = 0;

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
	rating = Integer.parseInt(ratingStr);
} catch(Exception e){
	if(title == null){
		if(type.equals("update")){
			response.sendRedirect("changebooks.jsp?id"+id);
		} else {
			response.sendRedirect("addbooks.jsp");
			return;
		}
	}
}


try {
	Class.forName("com.mysql.jdbc.Driver");
	
	String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
	
	Connection connection = DriverManager.getConnection(connURL);
	
	Statement statement = connection.createStatement();
	String sqlStr = "";
	if(type.equals("new")){
		sqlStr = "INSERT INTO BOOKS (title,author,price,quantity,publisher,publication_date,isbn,genre,rating,description) values (?,?,?,?,?,?,?,?,?,?)";
	} else if(type.equals("update")){
		sqlStr = "Update BOOKS SET title=?,author=?,price=?,quantity=?,publisher=?,publication_date=?,isbn=?,genre=?,rating=?,description=? WHERE id=?";
	}
	PreparedStatement ps = connection.prepareStatement(sqlStr);
	ps.setString(1,title);
	ps.setString(2,author);
	ps.setDouble(3,price);
	ps.setInt(4,quantity);
	ps.setString(5,publisher);
	ps.setString(6,date);
	ps.setString(7,isbn);
	ps.setString(8,category);
	ps.setInt(9,rating);
	ps.setString(10,desc);
	
	if(id != null){
		ps.setString(11,id);
	}
	out.println(ps);
	int rowsChanged = ps.executeUpdate();
	
	String msg = "";
	
	if(id == null){
		if(rowsChanged == 1){
			msg = "Book successfully added!";
			session.setAttribute("added", msg);
			response.sendRedirect("addbooks.jsp?msg="+msg);
		} else {
			msg = "Book failed to add";
			session.setAttribute("added", msg);
			response.sendRedirect("addbooks.jsp?msg="+msg);
		}
	} else {
		if(rowsChanged == 1){
			msg = "Book successfully updated!";
			session.setAttribute("updated", msg);
			response.sendRedirect("changebooks.jsp?msg="+msg+"&id="+id);
		} else {
			msg = "Book failed to update";
			session.setAttribute("updated", msg);
			response.sendRedirect("changebooks.jsp?msg="+msg+"&id="+id);
		}
	}
	connection.close();
	
} catch(SQLException e){
	out.print(e);
}
%>
<body>

</body>
</html>