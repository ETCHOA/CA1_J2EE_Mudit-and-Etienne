<%
String buttonpressed = request.getParameter("submit");
String text1 = request.getParameter("text1");
String textarea1 = request.getParameter("textarea1");
%>
<html>
<head><title>UI TextArea</title></head>
<body>
Submit Button pressed is: <%= buttonpressed %> <br>
text1 is: <%= text1 %> <br>
textarea1 is:<br>
<p><%= textarea1 %></p>
</body>
</html>