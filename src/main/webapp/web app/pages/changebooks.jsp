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

String id = request.getParameter("id");


String title = "";
String author = "";
String publisher = "";
String isbn = "";
String category = "";
String desc = "";
String date = "";
double price = 0;
Integer quantity = 0;
double rating = 0;

try {
	Class.forName("com.mysql.jdbc.Driver");
	
	String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
	
	Connection connection = DriverManager.getConnection(connURL);
	
	Statement statement = connection.createStatement();
	
	String sqlStr = "SELECT * FROM BOOKS WHERE id=?";
	
	PreparedStatement ps = connection.prepareStatement(sqlStr);
	ps.setString(1,id);
	
	ResultSet resultSet = ps.executeQuery();
	
	while (resultSet.next()){
		title = resultSet.getString("title");
		author = resultSet.getString("author");
		price = resultSet.getDouble("price");
		quantity = resultSet.getInt("quantity");
		publisher = resultSet.getString("publisher");
		date = resultSet.getString("publication_date");
		isbn = resultSet.getString("isbn");
		category = resultSet.getString("genre");
		rating = resultSet.getDouble("rating");
		desc = resultSet.getString("description");
	}

}catch(SQLException e){
	out.print(e);
}
%>
<body>
<div style="padding:1em">
	<h2>Update Book</h2>
	<%
	String msg = request.getParameter("msg");
	if(msg != null){
		%><h3><%=msg %></h3><%
	}
	%>
</div>
<div style="width:50%">
	<form action="addTable.jsp?id=<%=id %>&type=update" method="POST">
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Enter title :</label>
			<input style="padding:0.5em" name="titleInput" value="<%=title %>" placeholder="Enter title" type="text" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">author's name :</label>
			<input style="padding:0.5em" name="authorInput" value="<%=author %>" placeholder="Enter author's name" type="text" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">price :</label>
			<input style="padding:0.5em" name="priceInput" value="<%=price %>" placeholder="Enter price" type="text" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Quantity :</label>
			<input style="padding:0.5em" name="quantityInput" value="<%=quantity %>" placeholder="Enter quantity" type="number" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Publisher :</label>
			<input style="padding:0.5em" name="publisherInput" value="<%=publisher %>" placeholder="Enter publisher" type="text" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">publication-date :</label>
			<input style="padding:0.5em" name="dateInput" value="<%=date %>" placeholder="Enter date" type="date" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">IBSN-number :</label>
			<input style="padding:0.5em" name="isbnInput" value="<%=isbn %>" placeholder="Enter IBSN in digit only format" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label for="categorySelect">Category</label>
				  <select id="cat" name="categorySelect" required="required">
				  <% 
				  String selected = "selected";
				  if(category.equals("Romance")){
				  %>
					    <option value="Romance" <%=selected %> >Romance</option>
					    <option value="Non-fiction">Non-fiction</option>
					    <option value="Fiction">Fiction</option>
					    <option value="Sci-Fi">Sci-Fi</option>
				  <%}else if(category.equals("Non-fiction")){ %>
					    <option value="Romance">Romance</option>
					    <option value="Non-fiction"  <%=selected %> >Non-fiction</option>
					    <option value="Fiction">Fiction</option>
					    <option value="Sci-Fi">Sci-Fi</option>
					<%}else if(category.equals("Fiction")){ %>
					    <option value="Romance">Romance</option>
					    <option value="Non-fiction">Non-fiction</option>
					    <option value="Fiction"   <%=selected %> >Fiction</option>
					    <option value="Sci-Fi">Sci-Fi</option>
					<%} else if(category.equals("Sci-Fi")){ %>
					    <option value="Romance">Romance</option>
					    <option value="Non-fiction" >Non-fiction</option>
					    <option value="Fiction">Fiction</option>
					    <option value="Sci-Fi"  <%=selected %> >Sci-Fi</option>
				 <%
					}
				 %>
				  </select>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Rating :</label>
			<input style="padding:0.5em" name="ratingInput" value="<%=rating %>" placeholder="Enter rating" type="number" min="1" max="5" required="required"/>
		</div>
		<div style="display:flex;flex-direction:column;padding:1.5em">
			<label style="padding:0.5em">description :</label>
			<textarea type="text" name="descInput" style="width:30em;padding:10px;height:10em"><%=desc%></textarea>
		</div>
		<div>
			<input type="submit" name="btnSubmit" value="login" style="padding:5px;margin:5px">
			<input type="Reset" value="Clear" style="padding:5px;margin:5px">
		</div>
	</form>
</div>
</body>
</html>