<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
</head>
<%
boolean logged = false;
try{
	logged = (boolean)session.getAttribute("isLoggedIn");
	//out.print("logged");
} catch(Exception e){
	logged = false;
	//out.print("not logged");
}

String id = request.getParameter("id");
String title = "";
String author = "";
Double price = 0.0;
Integer quantity = 0;
String publisher = "";
String ISBN = "";
String genre = "";
Double rating = 0.0;
String description = "";

try {
	// mySQL Database 
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
	
	Connection connection = DriverManager.getConnection(connURL);
		
	Statement statement = connection.createStatement();
		
	String sqlStr = "SELECT * FROM books where id=?";
	
	PreparedStatement ps = connection.prepareStatement(sqlStr);
	ps.setString(1,id);
	
	
	ResultSet resultSet = ps.executeQuery();
	
	while (resultSet.next()){
		title = resultSet.getString("title");
		author = resultSet.getString("author");
		price = resultSet.getDouble("price");
		quantity = resultSet.getInt("quantity");
		publisher = resultSet.getString("publisher");
		ISBN = resultSet.getString("isbn");
		genre = resultSet.getString("genre");
		rating = resultSet.getDouble("rating");
		description = resultSet.getString("description");
	}
	
}catch(SQLException e){
	
}

%>
<body>
<%@ include file="projectHeader.html" %>
<%
String cartmsg = (String) session.getAttribute("cart");
if (!(cartmsg == null)){
	%><%=cartmsg%><%
}
%>
<div>
	<div style="display:flex;flex-direction:row">
		<h2>Title :</h2><p style="justify-content:center;font-size:1.4em"><%=title %></p>
	</div>
	<div style="display:flex;flex-direction:row">
		<h2>Author :</h2><p style="justify-content:center;font-size:1.4em"><%=author %></p>
	</div>
	<div style="display:flex;flex-direction:row">
		<h2>Price :</h2><p style="justify-content:center;font-size:1.4em"><%=price %></p>
	</div>
	<div style="display:flex;flex-direction:row">
		<h2>Quantity :</h2><p style="justify-content:center;font-size:1.4em"><%=quantity %></p>
	</div>
	<div style="display:flex;flex-direction:row">
		<h2>Publisher :</h2><p style="justify-content:center;font-size:1.4em"><%=publisher %></p>
	</div>
	<div style="display:flex;flex-direction:row">
		<h2>IBSN :</h2><p style="justify-content:center;font-size:1.4em"><%=ISBN %></p>
	</div>
	<div style="display:flex;flex-direction:row">
		<h2>Genre :</h2><p style="justify-content:center;font-size:1.4em"><%=genre %></p>
	</div>
	<div style="display:flex;flex-direction:row">
		<h2>Rating :</h2><p style="justify-content:center;font-size:1.4em"><%=rating %></p>
	</div>
	<div style="display:flex;flex-direction:column">
		<h2 style="padding:5px">Description :</h2><p style="justify-content:center;font-size:1.4em"><%=description %></p>
	</div>
	<div>
		<form action="/first_web_project/addToCart">
			<input type="hidden" name="cart" value="<%=id%>"/>
			<input type="submit" name="addCart" value="Add Item to Cart" style="padding:5px;margin:5px"/>
		</form>
	</div>
	<form action="search.jsp">
			<input type="submit" name="back" value="back" style="padding:5px;margin:5px"/>
		</form>
	<%
	if(logged == true){
		%>
		<div style="display:flex;flex-direction:row">
			<form action="changebooks.jsp?id=<%=id %>" method="POST">
				<input type="submit" name="btnSubmit" value="Update book" style="padding:5px;margin:5px">
			</form>
			<form action="/first_web_project/deleteBooks?id=<%=id %>" method="POST">
				<input type="submit" name="btnSubmit" value="Delete book" style="padding:5px;margin:5px">
			</form>
		</div>
		<div style="margin:10px;padding:10px">
		<a href="admin.jsp">
			<button style=";background-color:lightblue">
				<h3>Home</h3>	
			</button>
		</a>
	</div>
		<% 
	}
	%>
</div>


<%@ include file="projectFooter.html" %>
</body>
</html>