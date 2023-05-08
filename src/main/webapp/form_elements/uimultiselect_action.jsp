<%
String buttonpressed = request.getParameter("submit");
String sel1 = request.getParameter("mlist1");
String[] mlist1 = request.getParameterValues("mlist1");
%>
<html><head><title>UI Multiselect</title></head>
<body>
Submit Button pressed is: <%= buttonpressed %><br>
First Selected item is: <%= sel1 %><br>
Selected Items are:<br>
<% for(int i=0;i<mlist1.length;i++) { %>
<%= mlist1[i] %><br>
<% } %>
</body>
</html>