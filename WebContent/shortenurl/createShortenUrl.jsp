<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@page contentType="utf-8"%>

<%
	String clientId = "IhTVcehWG3YYeg5kiH8H"; // 애플리케이션 클라이언트 아이디값";
	String clientSecret = "YV9g0ApiTS"; // 애플리케이션 클라이언트 시크릿값";
	String oriUrl = request.getParameter("url");
	String url = Utility.getShortenURL(clientId, clientSecret, oriUrl);
	if(url != null && url.trim().length()>0){
%>
	{"path" : "<%=url %>"}
<%
	} else {
%>
	{"path" : "<%="" %>"}
<%
	}
%>