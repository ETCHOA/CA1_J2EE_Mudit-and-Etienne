<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

%>
<body>
<div style="padding:1em">
	<h2>Add Book</h2>
	<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null){
		%><h3><%=msg %></h3><%
	}
	%>
</div>
<div style="width:50%">
	<form action="/first_web_project/addBooks" method="POST">
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Enter title :</label>
			<input style="padding:0.5em" name="titleInput" value="" placeholder="Enter title" type="text" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">author's name :</label>
			<input style="padding:0.5em" name="authorInput" value="" placeholder="Enter author's name" type="text" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">price :</label>
			<input style="padding:0.5em" name="priceInput" value="" placeholder="Enter price" type="text" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Quantity :</label>
			<input style="padding:0.5em" name="quantityInput" value="" placeholder="Enter quantity" type="number" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Publisher :</label>
			<input style="padding:0.5em" name="publisherInput" value="" placeholder="Enter publisher" type="text" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">publication-date :</label>
			<input style="padding:0.5em" name="dateInput" value="" placeholder="Enter date" type="date" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">IBSN-number :</label>
			<input style="padding:0.5em" name="isbnInput" value="" placeholder="Enter IBSN in digit only format" type="number" required="required"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label for="categorySelect">Choose a category/genre for the book:</label>
				  <select id="cat" name="categorySelect" required="required">
				    <option value="Romance">Romance</option>
				    <option value="Non-fiction">Non-fiction</option>
				    <option value="Fiction">Fiction</option>
				    <option value="Sci-Fi">Sci-Fi</option>
				  </select>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Rating :</label>
			<input style="padding:0.5em" name="ratingInput" value="" placeholder="Enter rating" type="number" min="1" max="5" required="required"/>
		</div>
		<div style="display:flex;flex-direction:column;padding:1.5em">
			<label style="padding:0.5em">description :</label>
			<textarea type="text" name="descInput" style="width:30em;padding:10px;height:10em"></textarea>
		</div>
		<div>
			<input type="submit" name="btnSubmit" value="Submit" style="padding:5px;margin:5px">
			<input type="Reset" value="Clear" style="padding:5px;margin:5px">
		</div>
	</form>
	<div style="margin:10px;padding:10px">
		<a href="admin.jsp">
			<button style=";background-color:lightblue">
				<h3>Home</h3>	
			</button>
		</a>
	</div>
</div>
</body>
</html>