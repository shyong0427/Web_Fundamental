<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
<%
	MemberDao dao = MemberDao.getInstance();
	ArrayList<MemberDto> list = dao.select(0, 100);
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
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i ++) {
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