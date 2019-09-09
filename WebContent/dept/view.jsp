<%@ page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@ page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	String tempNum = request.getParameter("deptnum");
	int num = 0;
	try {
		num = Integer.parseInt(tempNum);
	} catch(NumberFormatException e) {
		num = 0;
	}
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = dao.select(num);
	
	if (dto != null) {
//		num = dto.getNum(); 위에 num이 선언되어 있어 중복하여 선언하지 않는다.
		String name = dto.getName();
		String local = dto.getLocal();
%>
<%@ include file = "../inc/header.jsp" %>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Department Information</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">부서정보</h5>
						<form class="form-horizontal" role="form" name="f" method="post" action="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="num">부서번호</label>
								<div class="col-sm-10">
									 <p><%=num %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">부서이름</label>
								<div class="col-sm-10">
									 <p><%=name %></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="local">지역</label>
								<div class="col-sm-10">
									 <p><%=local %></p>
								</div>
							</div>
							<input type="hidden" name="num" value="<%=num%>"/>
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