<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList,dataBaseJava.databaseCodes"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<String> bookList = (ArrayList<String>) session.getAttribute("cartList");


if(!(bookList == null)){
	for(int i=0;i<(bookList.size());i++){
		
	}
	
	%>
	<h2>Your Cart:</h2>
	<table border="1">
	<tr>
	<td>Number</td>
	<td>Title</td>	
	<td>ISBN</td>
	<td>Author</td>
	<td>Price</td>
	<td>Rating</td>
	<td>Category</td>
	</tr>
	<%
	for(int i=0;i<(bookList.size());i++){
		Object[] book = databaseCodes.getBooks(bookList.get(i));
		String title = (String) book[0];
		String author = (String) book[1];
		String isbn = (String) book[6];
		String category = (String) book[7];
		double price = (Double) book[2];
		double rating = (Double) book[8];
		%><tr>
		<td><%=(i+1)%></td>
		<td><%=title%></td>
		<td><%=isbn%></td>
		<td><%=author%></td>
		<td><%=price%></td>
		<td><%=rating%></td>
		<td><%=category%></td>
		</tr><%
	}
	%>
	</table>
	<%
} else {
	%><h2>Your Cart is empty</h2><%
}
%>
	<form action="search.jsp">
			<input type="submit" name="back" value="back" style="padding:5px;margin:5px"/>
		</form>
</body>
</html>