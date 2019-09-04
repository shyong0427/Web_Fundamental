<%@ page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page contentType="application/json;charset=utf-8" %>

<%
	String id = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	boolean isExisted = dao.isId(id); 
	
	if (isExisted) {
%>
	{"result" : "ok"}
<% 
	} else {
%>
	{"result" : "fail"}
<%
	} 
%>