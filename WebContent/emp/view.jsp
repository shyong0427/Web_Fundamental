<%@page import="kr.co.kic.dev1.util.Utility"%>
<%@ page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@ page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	String tempNum = request.getParameter("empnum");
	int num = 0;
	try {
		num = Integer.parseInt(tempNum);
	} catch(NumberFormatException e) {
		num = 0;
	}
	EmpDao dao = EmpDao.getInstance();
	EmpDto dto = dao.select(num);
	
	if (dto != null) {
//		num = dto.getNum(); 위에 num이 선언되어 있어 중복하여 선언하지 않는다.
		String name = dto.getName();
		String position = dto.getPosition();
		int manager = dto.getManager();
		String hiredate = dto.getHiredate();
		int sal = dto.getSal();
		int comm = dto.getComm();
		int deptno = dto.getDeptno();
%>
<%@ include file = "../inc/header.jsp" %>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end"> 
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Employee Information</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-position">사원정보</h5>
						<form class="form-horizontal" role="form" name="f" method="post" action="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="num">사원번호</label>
								<div class="col-sm-10">
									 <p><%=num %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">사원이름</label>
								<div class="col-sm-10">
									 <p><%=name %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="position">직책</label>
								<div class="col-sm-10">
									 <p><%=position %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="manager">담당사수</label>
								<div class="col-sm-10">
									 <p><%=manager %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="hiredate">입사날짜</label>
								<div class="col-sm-10">
 									<p><%=hiredate %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="sal">월급</label>
								<div class="col-sm-10">
									 <p><%=sal %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="comm">성과금</label>
								<div class="col-sm-10">
									 <p><%=comm%></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="deptno">부서번호</label>
								<div class="col-sm-10">
									 <p><%=deptno %></p>
								</div>
							</div>
							<input type="hidden" name="num" id="num" value="<%=num%>"/>
						</form>
						<div class="text-right">
							<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "../inc/footer.jsp" %>
<% } else { %>
	<script>
		for (let i = 0; i < 1; i++) {
			alert("유효하지 않은 페이지입니다.");
		}
		history.back(-1);
	</script>	
<% } %>