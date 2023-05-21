<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
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
<%@ include file="projectHeader.html" %>
<div style="padding:1em">
	<h1>Admin Mode</h1>
</div>
<div style="flex-direction:row;display:flex">
	<div style="margin:1em">
		<form action="addbooks.jsp" method="POST">
			<input style="padding:0.5em" name="create" value="Create books" type="submit"/>
		</form>
	</div>
	<div style="margin:1em">
		<form action="login.jsp" method="POST">
			<input style="padding:0.5em" name="create" value="Read" type="submit"/>
		</form>
	</div>
	<div style="margin:1em">
		<form action="search.jsp" method="POST">
			<input style="padding:0.5em" name="create" value="Update books/Delete books" type="submit"/>
		</form>
	</div>
</div>
		
<%@ include file="projectFooter.html" %>
</body>
</html>