<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<%

// ArrrayLists of data
ArrayList<String> titles = new ArrayList<>();
ArrayList<Double> prices = new ArrayList<>();
ArrayList<Double> ratings = new ArrayList<>();
ArrayList<String> genres = new ArrayList<>();




try {
	
	// mySQL Database 
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
	
	Connection connection = DriverManager.getConnection(connURL);
	
	Statement statement = connection.createStatement();
	
	// SQL statement (take first 200 datasets)
	
	String sqlStr = "SELECT title,price,rating,genre FROM books limit 0, 199";
	PreparedStatement ps = connection.prepareStatement(sqlStr);

	ResultSet resultSet = ps.executeQuery();

	while(resultSet.next()){
		String title = resultSet.getString("title");
		double price = resultSet.getDouble("price");
		double rating = resultSet.getDouble("rating");
		String genre = resultSet.getString("genre");

		titles.add(title);
		prices.add(price);
		ratings.add(rating);
		genres.add(genre);
	}

	connection.close();
}catch(SQLException e){
	
}
%>
<body>
<%@ include file="projectHeader.html" %>
<div>
<table border="1" style="width:100%">
<%
	for(int b=0;b<50;b++){
		%><tr><% 
		for(int i=0;i<4;i++){
			%>
			<td style="width:25%">
			<div>
				<div style="display:flex;flex-direction:row;justify-content:center;">
					<h3>title</h3><p style="justify-content:center;font-size:1.2em"> : <%=titles.get((b*8)+i) %></p>
				</div>
				<div style="display:flex;flex-direction:row;justify-content:center;">
					<h3>price</h3><p style="justify-content:center;font-size:1.2em"> : <%=prices.get((b*8)+i) %></p>
				</div>
				<div style="display:flex;flex-direction:row;justify-content:center;">
					<h3>rating</h3><p style="justify-content:center;font-size:1.2em"> : <%=ratings.get((b*8)+i) %></p>
				</div>
				<div style="display:flex;flex-direction:row;justify-content:center;">
					<h3>genre</h3><p style="justify-content:center;font-size:1.2em"> : <%=genres.get((b*8)+i) %></p>
				</div>
			</div>
			</td>
			<%
		}
		%></tr><% 
	}
%>
</table>
</div>
<%@ include file="projectFooter.html" %>
</body>
</html>