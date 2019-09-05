<%@ page pageEncoding="utf-8" %>

<%
	/*
		HttpSession 객체를 종료하는 3가지 방법
		1. 브라우저 종료했을 경우. 
		2. 해당 페이지의 시간(30분)이 경과되어 자동으로 세선객체 삭제 (세션이 만료되었을 경우).
		3. invalidate() 메서드를 호출하면 
	
	*/

	session.invalidate();
	response.sendRedirect("/");
%>