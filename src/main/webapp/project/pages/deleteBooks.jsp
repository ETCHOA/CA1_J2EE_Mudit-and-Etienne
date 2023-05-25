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

int deleted = 0;

try {
	email = (String)session.getAttribute("email");
	status = (boolean)session.getAttribute("isLoggedIn");
}catch(Exception e){
	session.setAttribute("error", error);
	response.sendRedirect("login.jsp");
	return;
}
if(email == null || !(status)){
	response.sendRedirect("login.jsp");
	return;
}

String deletedStr = request.getParameter("result");
deleted = Integer.parseInt(deletedStr);



%>
<body>
<%
if(deleted == 1){
	%>
	<div style="padding:2em">
		<h2>Record successfully deleted!</h2>
	</div>
	<%
} else {
	%>
	<div style="padding:2em">
		<h2>Error Deleting record</h2>
	</div>	
	<%
}
%>
<form action="search.jsp" method="POST">
	<input type="submit" name="btnSubmit" value="Back to home" style="padding:5px;margin:5px">
</form>
</body>
</html>