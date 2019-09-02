<%@ page pageEncoding="UTF-8"%>
<%@ page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@ page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file = "../inc/header.jsp" %>
<%
	EmpDao dao = EmpDao.getInstance();
	ArrayList<EmpDto> list = dao.select(0, 100);
%>
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
						<h5 class="card-title">사원정보</h5>
						<div class="table-responsive-md">
							<table class="table table-hover">
								<colgroup>
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">사원번호</th>
										<th scope="col">사원이름</th>
										<th scope="col">직책</th>
										<th scope="col">담당사수</th>
										<th scope="col">입사날짜</th>
									</tr>
								</thead>
								<tbody>
									<% 
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i++) {
											EmpDto dto = list.get(i);
											int num = dto.getNum();
											String name = dto.getName();
											String position = dto.getPosition();
											int manager = dto.getManager();
											String hiredate = dto.getHiredate();
									%>
									<tr>
										<th scope="row"><%=num %></th>
										<td><a href="view.jsp?empnum=<%=num %>"><%=name %></a></td>
										<td><%=position %></td>
										<td><%=manager %></td>
										<td><%=hiredate %></td>
									</tr>
									<% 
										}
									} else { 
									%>
										<tr>
										<td class="text-center" colspan="4" scope="row">공지된 게시물이 없습니다.</td>
										</tr>	
									<% 
									}
									%>
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
								<a href="write.jsp" class="btn btn-outline-primary">글쓰기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "../inc/footer.jsp" %>