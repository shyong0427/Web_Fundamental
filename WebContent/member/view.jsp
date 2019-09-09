<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8" info="test"%>
<%
	String tempSeq = request.getParameter("seq");
	int seq = 0;
	try{
		seq = Integer.parseInt(tempSeq);
	}catch(NumberFormatException e){
		seq = 0;
	}
	
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
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.select(seq);
	if(dto != null){
		String id = dto.getId();
		String email = dto.getEmail();
		String name = dto.getName();
		String phone = dto.getPhone();	
%>
<%@ include file = "../inc/header.jsp" %>
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
            <h5 class="card-title">회원정보</h5>
            <form class="form-horizontal" role="form" name="f" method="post" action="">
              <div class="form-group row">
	                <label class="col-form-label col-sm-2" for="name">성명</label>
	                <div class="col-sm-10">
	               		<p><%=name %></p>                
	                </div>
              </div>
              <div class="form-group row">
	                <label class="col-form-label col-sm-2" for="id">아이디</label>
	                <div class="col-sm-10">
	                	<p><%=id %></p>
	                </div>
              </div>
              <div class="form-group row">
                <label class="col-form-label col-sm-2" for="email">이메일 주소</label>
                <div class="col-sm-10">
                <p><%=email %></p>
                </div>
              </div>
              <div class="form-group row">
                <label class="col-form-label col-sm-2" for="phone">휴대폰 번호</label>
                <div class="col-sm-10">
                <p><%=phone %></p>                
                </div>
              </div>
              <input type="hidden" name="seq" value="<%=seq%>"/>
              <input type="hidden" name="page" value="<%=cPage%>"/>
            </form>
            <div class="text-right">
				<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">리스트</a>
			</div>
          </div>
        </div>
      </div>
    </div>
  </div>
<%@ include file = "../inc/footer.jsp" %>
<% } else { %>
<script>
	alert("회원정보가 없습니다.");
	history.back(-1);
</script>
<% } %>