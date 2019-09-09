<%@ page pageEncoding="UTF-8"%>
<%@ page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@ page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page import="java.util.ArrayList"%>
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
   int length = 5;
   int totalPage = 0;
   int startPage = 0;
   int endPage = 0;
   int pageLength = 5;
   int start = (cPage - 1) * length;
   int pageNum = 0;

   DeptDao dao = DeptDao.getInstance();
   ArrayList<DeptDto> list = dao.select(start, length);

   int totalRows = dao.getRows();
  
   pageNum = totalRows + (cPage - 1) * (-length);
   totalPage = totalRows % length == 0 ? totalRows / length : totalRows / length + 1;
   
   if (totalPage == 0) {
      totalPage = 1;
   }
   
   int currentBlock = cPage % pageLength == 0 ? cPage / pageLength : cPage / pageLength + 1;
   int totalBlock = totalPage % pageLength == 0 ? totalPage / pageLength : totalPage / pageLength + 1;

   startPage = 1 + (currentBlock - 1) * pageLength;

   endPage = pageLength + (currentBlock - 1) * pageLength;
   
   if (currentBlock == totalBlock) {
      endPage = totalPage;
   }
%>
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
						<div class="table-responsive-md">
							<table class="table table-hover">
								<colgroup>
									<col width="30%" />
									<col width="40%" />
									<col width="30%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">부서번호</th>
										<th scope="col">부서명</th>
										<th scope="col">지역</th>
									</tr>
								</thead>
								<tbody>
									<% 
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i++) {
											DeptDto dto = list.get(i);
											int num = dto.getNum();
											String name = dto.getName();
											String local = dto.getLocal();
									%>
									<tr>
										<th scope="row"><%=pageNum-- %></th>
										<td><a href="view.jsp?deptnum=<%=num%>"><%=name %></a></td>
										<td><%=local %> </td>
									</tr>
									<% 
										}
									} else { 
									%>
										<tr>
										<td class="text-center" colspan="3" scope="row">공지된 게시물이 없습니다.</td>
										</tr>	
									<% 
									}
									%>
								</tbody>
							</table>
							<nav aria-label="Page navigation example">
		                        <ul class="pagination pagination-lg justify-content-center">
		                           <% if (currentBlock != 1) { %>
		                           <li class="page-item"> <!-- "javascript:util.pageLoading -->
		                              <a class="page-link" href="list.jsp?page=('<%=startPage - 1%>','<%=length%>')" tabindex="-1">&laquo;</a>
		                           </li>
		                           <% } else { %>
		                           <li class="page-item disabled">
		                              <a class="page-link" href="#" tabindex="-1">&laquo;</a>
		                           </li>
		                           <% } %>
		                           <% for (int i = startPage; i <= endPage; i++) { %><!-- href="javascript:util.pageLoading('<%=i%>','<%=length%>')"><%=i %> -->
		                           <li class="page-item <%if (cPage ==i) { %>active<%}%>"><a class="page-link" href="list.jsp?page=<%=i %>"><%=i %></a></li>
		                           <% } %>
		                           <% if (currentBlock != totalBlock) { %>
		                           <li class="page-item"> <!-- href="javascript:util.pageLoading('<%=endPage + 1%>','<%=length%>') -->
		                              <a class="page-link" href="list.jsp?page=<%=endPage+1 %>">&raquo;</a>
		                           </li>
		                           <% } else {%>
		                           <li class="page-item disabled">
		                              <a class="page-link" href="#">&raquo;</a>
		                           </li>
		                           <% } %>
		                        </ul>
		                     </nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file = "../inc/footer.jsp" %>