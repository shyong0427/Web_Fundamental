<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
<%
	/*
		page = 1 -> 1 ~ 10 / limit 0, 10 
		page = 2 -> 11 ~ 20 / limit 10, 10
		page = 3 -> 21 ~ 30 / limit 20, 10
		등차수열 공식 : An = a1 + (n-1)*d
		 >> a1 = 0, n = page, d = 10 
		 >> 0 + (page-1)*10 = (page-1)*10
	*/
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
	int length = 10;
	int start = (cPage - 1) * length;
	
	MemberDao dao = MemberDao.getInstance();
	ArrayList<MemberDto> list = dao.select(start, length);
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
						<h5 class="card-title">회원</h5>
						<div class="table-responsive-md">
							<table class="table table-hover">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="15%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">이름</th>
										<th scope="col">아이디</th>
										<th scope="col">이메일</th>
										<th scope="col">핸드폰번호</th>
										<th scope="col">등록날짜</th>
									</tr>
								</thead>
								<tbody>
								<%
									if(list.size() != 0){
										for(int i=0;i<list.size();i++){
											MemberDto dto = list.get(i);
											int seq = dto.getSeq();
											String name = dto.getName();
											String id = dto.getId();
											String email = dto.getEmail();
											String phone = dto.getPhone();
											String regdate = dto.getRegdate();
								%>
									<tr>
										<th scope="row"><%=seq %></th>
										<td><%=name %></td>
										<td><a href="view.jsp?seq=<%=seq%>"><%=id %></a></td>
										<td><%=email %></td>
										<td><%=phone %></td>
										<td><%=regdate %></td>
									</tr>
								<% 		} 
									} else { %>
									<tr>
										<td class="text-center" colspan = "6">회원정보가 없습니다.</td>
									</tr>
									<% } %>
								</tbody>
							</table>
							<%
							/*
								totalRows -> 258개 / totalPage = 26;
								
								cPage = 1 -> startPage = 1, endPage = 10;
								cPage = 2 -> startPage = 1, endPage = 10;
								cPage = 11 -> startPage = 11, endPage = 13;
								cPage = 12 -> startPage = 11, endPage = 13;
								cPage = 21 -> startPage = 21, endPage = 26;
							*/
							
								int totalRows = dao.getRows(); // 27개
								int totalPage = 0;
								int startPage = 0;
								int endPage = 0;
								
								totalPage = totalRows % length == 0 ? totalRows / length : totalRows / length + 1;
								
								if (totalPage == 0) {
									totalPage = 1;
								}
								
							%>
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-lg justify-content-center">
									<li class="page-item disabled">
										<a class="page-link" href="#" tabindex="-1">&laquo;</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">6</a></li>
									<li class="page-item"><a class="page-link" href="#">7</a></li>
									<li class="page-item"><a class="page-link" href="#">8</a></li>
									<li class="page-item"><a class="page-link" href="#">9</a></li>
									<li class="page-item"><a class="page-link" href="#">10</a></li>
									<li class="page-item">
										<a class="page-link" href="#">&raquo;</a>
									</li>
								</ul>
							</nav>
							<div class="text-right">
								<a href="register.jsp" class="btn btn-outline-primary">등록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@ include file = "../inc/footer.jsp" %>