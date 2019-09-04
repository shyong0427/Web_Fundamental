<%@ page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}
	try{
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
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
						<h5 class="card-title">회원</h5>

						<div class="table-responsive-md">
							<div  id="table_body">
							
							</div>
							<div class="text-right">
								<a href="register.jsp?page=<%=cPage %>" class="btn btn-outline-primary">등록</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<script>
		const util = {
			pageLoading :  function(p){
					let url ='http://localhost/member/list2.jsp?page='+p;
					history.pushState(null,null,url);
					$.ajax({
						type : 'GET',
						url : 'list_ajax2.jsp?page='+p,
						dataType : 'html',//json , xml, html
						error : function(){
							alert('HTML loading error');
						},
						success : function(html){
							$("#table_body").children().remove();
							$("#table_body").html(html);
						}
					});
			},
			getParameterByName : function(name){
				var value;
				var url = location.search; // ?page= 등이 return;
			    var qs = url.substring(url.indexOf('?') + 1).split('&');
			    for(var i = 0; i < qs.length; i++){
			        var temp = qs[i].split('=')[0];
			        if(temp==name){
			        	value = qs[i].split('=')[1];
			        	break;
			        }
			    }
			    return value;
			}
		}
			
		$(function(){
			let url ='http://localhost/member/list2.jsp?page=<%=cPage%>';
			history.pushState(null,null,url);
			$.ajax({
				type : 'GET',
				url : 'list_ajax2.jsp?page=<%=cPage%>',
				dataType : 'html',//json , xml, html
				error : function(){
					alert('HTML loading error');
				},
				success : function(html){
					$("#table_body").children().remove();
					$("#table_body").html(html);
				}
			});
			
			$(window).on('popstate',function(){
				
				let p = util.getParameterByName("page");
				console.log(p);
				if(p){
					$.ajax({
						type : 'GET',
						url : 'list_ajax2.jsp?page='+p,
						dataType : 'html',//json , xml, html
						error : function(){
							alert('HTML loading error');
						},
						success : function(html){
							$("#table_body").children().remove();
							$("#table_body").html(html);
						}
					});
				}
			});//end of popstate event
		});//end of load event
			
		</script>
		<%@ include file="../inc/footer.jsp"%>
		
		
		
		
		
		
		
		
		
		
		