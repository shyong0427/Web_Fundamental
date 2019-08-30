<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Notice</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">공지사항</h5>

						<form class="form-horizontal" role="form">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="inputName">작성자</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="이름을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="inputName">제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="제목을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="inputName">내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="inputName" placeholder="내용을 입력해 주세요"></textarea>
								</div>
							</div>
						</form>
						<div class="text-right">
							<a href="" id="modifyNotice" class="btn btn-outline-primary">수정</a>
							<a href="" id="deleteNotice" class="btn btn-outline-danger">삭제</a>
							<a href="list.jsp" class="btn btn-outline-success">리스트</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "../inc/footer.jsp" %>