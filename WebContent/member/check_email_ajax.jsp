<%@ page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page contentType="application/json;charset=utf-8" %>

<%
	String email = request.getParameter("email");
	MemberDao dao = MemberDao.getInstance();
	boolean isExisted = dao.isEmail(email);
	
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
