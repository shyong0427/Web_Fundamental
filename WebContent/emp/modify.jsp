<%@ page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@ page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");	
	int num = Integer.parseInt(request.getParameter("empnum"));
	String name = request.getParameter("name");
	String position = request.getParameter("position");
	int manager = Integer.parseInt(request.getParameter("manager"));
	String hiredate = request.getParameter("hiredate");
	int sal = Integer.parseInt(request.getParameter("sal"));
	int comm = Integer.parseInt(request.getParameter("comm"));
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = new EmpDto(name, position, manager, hiredate, sal, comm, deptno);
	dto.setNum(num);
	boolean isSuccess = dao.update(dto);
	if (isSuccess) {
%>
	<script>
		alert("성공");
		location.href = "view.jsp?empnum=<%=num%>";
	</script>
<% } else {%>
	<script>
		alert("실패");
		history.back(-1);
	</script>
<% } %>
