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
	<div style="display:flex;flex-direction:row">
		<h2>Description :</h2><p style="justify-content:center;font-size:1.4em"><%=description %></p>
	</div>
</div>


<%@ include file="projectFooter.html" %>
</body>
</html>