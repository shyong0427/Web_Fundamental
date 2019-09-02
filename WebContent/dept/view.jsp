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
									<input type="text" class="form-control" name="num" value="<%=num %>" id="num" placeholder="부서번호를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">부서이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="name" value="<%=name %>" id="name" placeholder="부서이름을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="local">지역</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="local" value="<%=local %>" id="local" placeholder="지역을 입력해 주세요">
								</div>
							</div>
							<input type="hidden" name="num" value="<%=num%>"/>
						</form>
						<div class="text-right">
							<a href="" id="modifyDept" class="btn btn-outline-primary">수정</a>
							<a href="" id="deleteDept" class="btn btn-outline-danger">삭제</a>
							<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
						<script>
							$(function() {
								$("#modifyDept").on("click", function(event) {
									event.preventDefault();
									// 유효성 검사
									let num = $("#num").val()
									if (num == "") {
										alert("부서번호를 입력해주세요.");
										return;
									}
									
									let name = $("#name").val();
									if (name == "") {
										alert("부서이름을 입력해주세요.");
										$("name").focus();
										return;
									}
									
									let local = $("#local").val();
									if (local == "") {
										alert("지역을 입력해주세요.");
										$("local").focus();
										return;
									}
									
									f.action = "modify.jsp";
									f.submit();
								});
								$("#deleteDept").on("click", function(event) {
									event.preventDefault();
									// 유효성 검사 불필요
									f.action = "delete.jsp";
									f.submit();
								});					
							});
						</script>
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