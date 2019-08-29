<%@page import="java.util.Calendar"%>
<%@ page pageEncoding = "utf-8"%>

<html>
	<body>
		<h1>Scripting</h1>
		<%!
			// declaration
			private int age;
			public void m() {
				
			}
		%>
		<%
			// scriptlet
			int tt;
			m();
		%>
		<select>
			<%
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				for (int i = 19500; i <= year; i++) {
			%>
			<option value = '<%=i%>' <%if((year-20)==i){ %>selected="selected"<%} %>><%=i %></option>
			<%
			}
			%>
		</select>
		
	</body>
</html>