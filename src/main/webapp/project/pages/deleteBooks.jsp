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

int resultSet = 0;
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
try{
	Class.forName("com.mysql.jdbc.Driver");
	
	String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
	
	Connection connection = DriverManager.getConnection(connURL);
	
	Statement statement = connection.createStatement();
	
	String sqlStr = "DELETE FROM BOOKS WHERE id=?";
	
	PreparedStatement ps = connection.prepareStatement(sqlStr);
	ps.setString(1,id);
	
	resultSet = ps.executeUpdate();
	connection.close();
		
	
} catch(SQLException e) {
	out.print(e);
}

%>
<body>
<%
if(resultSet == 1){
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