<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<%
String error = (String) session.getAttribute("error");

%>
<body> 
<%@ include file="projectHeader.html" %>
	<form action="/first_web_project/verifyUserServlet">
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Email :</label>
			<input style="padding:0.5em" name="emailInput" value="" placeholder="Enter email" type="text"/>
		</div>
		<div style="display:flex;flex-direction:row;padding:1.5em">
			<label style="padding:0.5em">Password :</label>
			<input style="padding:0.5em" name="passwordInput" value="" placeholder="Enter password" type="password"/>
		</div>
		<div>
			<input type="submit" name="btnSubmit" value="login" style="padding:5px;margin:5px">
			<input type="Reset" value="Clear" style="padding:5px;margin:5px">
		</div>
	</form>
	<%
	if(!(error == null || error == "")){
		%>
		<div>
		<p><%=error %></p>
		</div>
		<%
	}
	%>
<%@ include file="projectFooter.html" %>
</body>
</html>