<%@ page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@ page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");	
	int num = Integer.parseInt(request.getParameter("deptnum"));
	String name = request.getParameter("name");
	String local = request.getParameter("local");
	
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = new DeptDto(name, local);
	dto.setNum(num);
	boolean isSuccess = dao.update(dto);
	if (isSuccess) {
%>
	<script>
		alert("성공");
		location.href = "view.jsp?deptnum=<%=num%>";
	</script>
<% } else {%>
	<script>
		alert("실패");
		history.back(-1);
	</script>
<% } %>