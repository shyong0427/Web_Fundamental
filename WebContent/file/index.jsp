<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if (tempPage == null || tempPage.length() == 0) {
		cPage = 1;	
	}
	try {
		cPage = Integer.parseInt(tempPage);
	} catch (NumberFormatException e) {
		cPage = 1;
	}
%>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="/">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Member</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">파일업로드</h5>
            <form class="form-horizontal" role="form" name="f" action="save.jsp">
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요">
                <div = id="nameMessage"></div>
                <div class="custom-file">
				    <input type="file" class="custom-file-input" id="validatedCustomFile" required>
				    <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
				    <div class="invalid-feedback">Example invalid custom file feedback</div>
				  </div>
              </div>
            </form>
            <div class="text-right">
				<a href="" id="saveMember" class="btn btn-outline-primary">등록</a>
			</div>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file = "../inc/footer.jsp" %>