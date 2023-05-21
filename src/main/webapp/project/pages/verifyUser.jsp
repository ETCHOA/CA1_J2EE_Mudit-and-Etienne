<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.ArrayList" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<%
String error = "Invalid session ID / Password cannot be null";
String email = request.getParameter("emailInput");
String password = request.getParameter("passwordInput");
boolean check = false;

if(email == null || password == null || email == "" || password == ""){
	error = "password and email cannot be null";
	response.sendRedirect("login.jsp?msg="+error);
	out.print("hey");
	return;
}

try {
	Class.forName("com.mysql.jdbc.Driver");
	
	String connURL = "jdbc:mysql://localhost:3306/bookstore?user=root&password=root&serverTimezone=UTC";
	
	Connection connection = DriverManager.getConnection(connURL);
	
	Statement statement = connection.createStatement();
	
	String sqlStr = "SELECT * FROM users where email=? and password=?;";
	
	PreparedStatement ps = connection.prepareStatement(sqlStr);
	ps.setString(1, email);
	ps.setString(2, password);
	
	ResultSet resultSet = ps.executeQuery();

	String emailReturn = "";
	String passwordReturn = "";
	
	while(resultSet.next()){
		check = true;
	}

	connection.close();

} catch (SQLException e){
	out.print(e);
}

if(check == false){
	error = "Wrong password / user email does not exist";	
	response.sendRedirect("login.jsp?error="+error);
} else {
	session.setAttribute("email",email);
	session.setAttribute("isLoggedIn", true);
	String sessionId = session.getId();
	String encodedURL = response.encodeURL("admin.jsp;jsessionid="+sessionId);
	response.sendRedirect(encodedURL);
}
%>
<body>
<%@ include file="projectHeader.html" %>
<%@ include file="projectFooter.html" %>
</body>
</html>