<%@ page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@ page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");	

	String name = request.getParameter("name");
	String local = request.getParameter("local");
	
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = new DeptDto(name, local);
	boolean isSuccess = dao.insert(dto);
	if (isSuccess) {
%>
	<script>
		alert("성공");
		location.href = "list.jsp";
	</script>
<% } else {%>
	<script>
		alert("실패");
		history.back(-1);
	</script>
<% } %>