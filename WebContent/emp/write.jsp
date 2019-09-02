<%@ page pageEncoding="UTF-8"%>
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
						<form class="form-horizontal" role="form" name="f" method="post" action="save.jsp">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="num">사원번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="num" id="num" placeholder="사원번호를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">사원이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="name" id="name" placeholder="사원이름을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="position">직책</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="position" id="position" placeholder="직책을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="manager">담당사수</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="manager" id="manager" placeholder="담당사수를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="sal">월급</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="sal" id="sal" placeholder="월급을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="comm">성과금</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="comm" id="comm" placeholder="성과금을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="deptno">부서번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="deptno" id="deptno" placeholder="부서번호를 입력해 주세요">
								</div>
							</div>
						</form>
						<div class="text-right">
							<a href="http://www.naver.com" id="saveEmp" class="btn btn-outline-primary">등록</a>
							<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
						<script>
							$(function() {
								$("#saveEmp").on("click", function(event) {
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