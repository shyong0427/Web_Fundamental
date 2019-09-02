<%@ page pageEncoding="UTF-8"%>
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
						<h5 class="card-local">부서정보</h5>

						<form class="form-horizontal" role="form" name="f" method="post" action="save.jsp">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="num">부서번호</label>
								<div class="col-sm-10">
								<input type="text" class="form-control" name="num" id="num" placeholder="부서번호를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">부서이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="name" id="name" placeholder="부서이름을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="local">지역</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="local" id="local" placeholder="지역을 입력해 주세요">
								</div>
							</div>
						</form>
						<div class="text-right">
							<a href="http://www.naver.com" id="saveNotice" class="btn btn-outline-primary">등록</a>
							<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
						<script>
							$(function() {
								$("#saveNotice").on("click", function(event) {
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