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
									<input type="text" class="form-control" name="num" value="<%=num %>" id="num" placeholder="사원번호를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">사원이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="name" value="<%=name %>" id="name" placeholder="사원의 이름을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="position">직책</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="position" value="<%=position %>" id="position" placeholder="직책을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="manager">담당사수</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="manager" value="<%=manager %>" id="manager" placeholder="담당사수를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="hiredate">입사날짜</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="hiredate" value="<%=hiredate %>" id="hiredate" placeholder="입사날짜를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="sal">월급</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="sal" value="<%=sal %>" id="sal" placeholder="월급을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="comm">성과금</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="comm" value="<%=comm %>" id="comm" placeholder="성과금을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="deptno">부서번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="deptno" value="<%=deptno %>" id="deptno" placeholder="부서번호를 입력해 주세요">
								</div>
							</div>
							<input type="hidden" name="num" value="<%=num%>"/>
						</form>
						<div class="text-right">
							<a href="" id="modifyEmp" class="btn btn-outline-primary">수정</a>
							<a href="" id="deleteEmp" class="btn btn-outline-danger">삭제</a>
							<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
						<script>
							$(function() {
								$("#modifyEmp").on("click", function(event) {
									event.preventDefault();
									// 유효성 검사
									let num = $("#num").val();
									if (num == "") {
										alert("사원번호를 입력해주세요.");
										return;
									}
									
									let name = $("#name").val();
									if (name == "") {
										alert("사원의 이름을 입력해주세요.");
										$("name").focus();
										return;
									}
									
									let position = $("#position").val();
									if (position == "") {
										alert("직책을 입력해주세요.");
										$("position").focus();
										return;
									}
									
									let manager = $("#manager").val();
									if (manager == "") {
										alert("담당사수를 입력해주세요.");
										$("manager").focus();
										return;
									}
									
									let hiredate;
									if (hiredate == "") {
										alert("입사날짜를 입력하세요");
										$("hiredate").focus();
										return;
									}
									
									let sal;
									if (sal == "") {
										alert("월급을 입력하세요");
										$("sal").focus();
										return;
									}
									
									let comm;
									if (comm == "") {
										alert("성과금을 입력하세요");
										$("comm").focus();
										return;
									}
									
									let deptno;
									if (deptno == "") {
										alert("부서번호를 입력하세요");
										$("comm").focus();
										return;
									}

									f.action = "modify.jsp";
									f.submit();
								});
								$("#deleteEmp").on("click", function(event) {
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