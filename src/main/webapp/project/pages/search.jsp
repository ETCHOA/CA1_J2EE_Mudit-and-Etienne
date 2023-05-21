<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search page</title>
</head>
<%

String searchStr = request.getParameter("searchStr");
String catStr = request.getParameter("categorySelect");
if(catStr == null){
	catStr = "none";
}

// ArrrayLists of data
ArrayList<Integer> ids = new ArrayList<>();
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
	String sqlStr = "";
	if(searchStr == null && catStr.equals("none")){
		sqlStr = "SELECT id,title,price,rating,genre FROM books limit 0, 199";
	} else 	{
		if(catStr.equals("")){
			sqlStr = "SELECT id,title,price,rating,genre FROM books limit 0, 199";
		}else if(catStr.equals("none")){
			sqlStr = "SELECT id,title,price,rating,genre FROM books where title LIKE ? LIMIT 0,199";
		} else if (searchStr == null) {
			sqlStr = "SELECT id,title,price,rating,genre FROM books where genre=? LIMIT 0,199";
		} else {
			sqlStr = "SELECT id,title,price,rating,genre FROM books where title LIKE ? and genre=? LIMIT 0,199 ";
		}
				
	}
	
	PreparedStatement ps = connection.prepareStatement(sqlStr);
	
	
	if(!(searchStr == null && (catStr.equals("none")))){
		if(!(catStr.equals(""))){
			if(catStr.equals("none")){
				ps.setString(1,"%" + searchStr + "%");
			}else if(searchStr == null){
				ps.setString(1,catStr);
			} else {
				ps.setString(1,"%" + searchStr + "%");
				ps.setString(2,catStr);
			}
		}
	
	}

	
	
	ResultSet resultSet = ps.executeQuery();

	while(resultSet.next()){
		Integer id = resultSet.getInt("id");
		String title = resultSet.getString("title");
		double price = resultSet.getDouble("price");
		double rating = resultSet.getDouble("rating");
		String genre = resultSet.getString("genre");

		ids.add(id);
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
	<form action="search.jsp" method="POST">
		<div style="flex-direction:row;display: flex;padding:5px">
			<div style="padding:5px">
				Search :  
			</div>
			<div style="padding:5px">
				<input type="text" name="searchStr"/>
			</div>
			<div>
			  <label for="categorySelect">Choose a category/genre:</label>
				  <select id="cat" name="categorySelect">
				  	<option value="none">no category</option>	
				    <option value="Romance">Romance</option>
				    <option value="Non-fiction">Non-fiction</option>
				    <option value="Fiction">Fiction</option>
				    <option value="Sci-Fi">Sci-Fi</option>
				  </select>
			</div>
		</div>
		<div style="flex-direction:row;display: flex;padding:5px">
			<input type="submit" name="btnSubmit" value="login" style="padding:5px;margin:5px">
			<input type="Reset" value="Clear" style="padding:5px;margin:5px">
		</div>
	</form>
</div>
<div>
<table border="1" style="width:100%">
<%
	double limit = 0;
	int secondLimit = 0;
	limit = (titles.size()/8);

	for(int b=0;b<(limit+1);b++){
		%><tr><% 
		if((titles.size()) < 4){
			secondLimit = titles.size();
		} else {
			secondLimit = 4;
		}
		for(int i=0;i<secondLimit;i++){
			%>
			<td style="width:25%">
			<a href="details.jsp?id=<%=ids.get((b*8)+i) %>" style="text-decoration:none">
				<div>
					<div style="display:flex;flex-direction:row;justify-content:center;">
						<h3 style="text-decoration:none">title</h3><p style="justify-content:center;font-size:1.2em"> : <%=titles.get((b*8)+i) %></p>
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
				</a>
			</td>
			<%
		}
		%></tr><% 
	}
%>
</table>
<div style="width:100%;justify-content:center;align-items:center">
	<%
	if(titles.size()==0){
		%><p style="font-size:1.1em;text-align:center;align-items:center">No matching results found</p><%
	} else {
		%><p style="font-size:1.1em;text-align:center;align-items:center">End of results</p><%
	}
	%>
</div>
</div>
<%@ include file="projectFooter.html" %>
</body>
</html>