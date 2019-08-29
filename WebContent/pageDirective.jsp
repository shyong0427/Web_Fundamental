<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.BufferedReader, java.util.ArrayList"%>
<!-- 응답 MIME타입과 문자인코딩을 지정한다. -->
<%@ page contentType="text/html;charset=utf-8"%>
<!-- 문자인코딩을 지정한다. -->
<%@ page pageEncoding="utf-8"%>
<!-- HttpSession객체 사용여부를 결정한다. -->
<%@ page session = "false"%>
<%@ page isErrorPage = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP page directive Demo</title>
</head>
<body>
	<h1>Page Directive11213</h1>
	<%
		HttpSession ses = null;
		ArrayList list = new ArrayList();
		BufferedReader br = null;
		
		request.setAttribute("name", "shim");
		String id = request.getParameter("id");
		if (id == null) {
			id = "";
		}
	%>
	
	당신의 이름은? ${param.id}, <%=id %>
</body>
</html>