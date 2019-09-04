<%@ page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page pageEncoding="utf-8"%>
<%
	int cPage = Integer.parseInt(request.getParameter("page"));
	int length = 10;
	int pageLength = 5;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = (cPage-1) * length;
	
	MemberDao dao = MemberDao.getInstance();
	ArrayList<MemberDto> list = dao.select(start,length);
	int totalRows = dao.getRows();//63개
	
	totalPage = totalRows%length == 0 ? 
				totalRows/length : totalRows/length + 1 ;
	if(totalPage == 0){
		totalPage = 1;
	}
	
	int currentBlock = cPage % pageLength == 0 ?
			cPage/pageLength : cPage/pageLength + 1;
	int totalBlock = totalPage % pageLength == 0 ?
			totalPage/pageLength : totalPage/pageLength +1;
	//An = a1 + (n-1)*d        n => currentBlock
	//startPage => 1, 11, 21
	startPage = 1 + (currentBlock - 1) * pageLength;
	//endPage => 10, 20, 30, .....
	endPage = pageLength + (currentBlock - 1) * pageLength;
	
	if(currentBlock == totalBlock){
		endPage = totalPage;
	}
	
%>
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
				<td><a href="view.jsp?seq=<%=seq%>&page=<%=cPage%>"><%=id %></a></td>
				<td><%=email %></td>
				<td><%=phone %></td>
				<td><%=regdate %></td>
			</tr>
		<%
				}
			}else{ 
		%>	
			<tr>
				<td class="text-center" colspan="6">회원정보가 없습니다.</td>
			</tr>
		<%	} %>
		</tbody>
	</table>
	<nav aria-label="Page navigation example">
		<ul class="pagination pagination-lg justify-content-center">
			<%if(currentBlock != 1){ %>
			<li class="page-item">
				<a class="page-link" href="javascript:util.pageLoading('<%=startPage-1%>');" tabindex="-1">&laquo;</a>
			</li>
			<%}else{ %>
			<li class="page-item disabled">
				<a class="page-link" href="#" tabindex="-1">&laquo;</a>
			</li>
			<%} %>
			
			<%for(int i=startPage;i<=endPage;i++){ %>
			<li class="page-item <%if(cPage==i){ %>active<%}%>"><a class="page-link" href="javascript:util.pageLoading('<%=i%>');"><%=i %></a></li>
			<%} %>
			<%if(currentBlock != totalBlock){ %>
			<li class="page-item">
				<a class="page-link" href="javascript:util.pageLoading('<%=endPage+1%>');">&raquo;</a>
			</li>
			<%}else{ %>
			<li class="page-item disabled">
				<a class="page-link" href="#">&raquo;</a>
			</li>
			<%} %>
			
		</ul>
	</nav>
	