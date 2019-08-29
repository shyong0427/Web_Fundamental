<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Comment Demo</title>
</head>
<body>
	<h1>jsp comment111</h1>
	<!-- html 주석입니다. -->
	<%-- jsp 주석입니다. --%>
	<!-- <input type = "text" name = "name1" value = "<%="abc" %>"> -->
	<%-- <input type = "text" name = "name2" value = "abc"> --%>
	<ul>
	<%
	
		for (int i = 0; i < 100; i++){
			out.println("<li>" + i + "</li>");
		}
	%>
	</ul>
</body>
</html>