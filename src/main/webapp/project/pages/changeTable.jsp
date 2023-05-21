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


try {
	Class.forName("com.mysql.jdbc.Driver");
	
	String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
	
	Connection connection = DriverManager.getConnection(connURL);
	
	Statement statement = connection.createStatement();
	
	String sqlStr = "SELECT * FROM BOOKS WHERE id=?";
	
	PreparedStatement ps = connection.prepareStatement(sqlStr);
	ps.setString(1,id);
	
	ResultSet resultSet = ps.executeQuery();
} catch (SQLException e){
	
}
%>
<body>

</body>
</html>