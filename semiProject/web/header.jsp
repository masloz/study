<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="store.model.vo.Store"
	errorPage="storeError.jsp"%>

<%
	Store store = (Store) session.getAttribute("store");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/emos/css/style.css">


    
<title>HEADER</title>
</head>
<body>
				<%
					if (store == null) {
				%>
	<div class="col-sm-offset-10 col-sm-2">
		<ul class="nav nav-pills nav-justified">
			<li id="normal" class="active"><a data-toggle="tab" href="#home">일반회원</a></li>
			<li id="company"><a data-toggle="tab" href="#menu1">기업회원</a></li>
		</ul>
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>로그인</h3>
			</div>
			<div id="menu1" class="tab-pane fade">
				
				
				
				<!-- 원래 if (store == null) { 있던곳 -->
				
				
				
				<form action="slogin" method="post">
					<table>
						<tr>
							<td>
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
									<label class="sr-only" for="storeId">Store ID : </label> 
									<input id="text" type="text" class="form-control input-sm" name="storeId" tabindex="1" placeholder="아이디" title="아이디">
								</div>
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
									<label class="sr-only" for="storePwd">Store Password : </label>
									<input type="password" class="form-control input-sm" name="storePwd" placeholder="비밀번호" tabindex="2" title="비밀번호">
								</div>


							</td>
							<td colspan="2"><button type="submit" class="btn btn-default navbar-btn" title="로그인" style="height: 60px;">Sign in</button></td>

						</tr>
						<tr>
							<td colspan="2" align="center"><a href="/emos/views/store/storeRegister.jsp" title="회원가입">회원가입</a>
							&nbsp; &nbsp; <a title="미구현">아이디/비밀번호 찾기</a></td>
						</tr>
					</table>
				</form>
				<%
					} else {
				%>
				 
				<%=store.getStoreId()%>	님이 로그인 하셨습니다.<br> 
				<a href="/emos/slogout">로그아웃</a> &nbsp; &nbsp; <a href="/emos/views/store/storeUpdateView.jsp">회원 정보 수정</a>
				<%
					}
				%>
				 -->
			</div>
		</div>
		
<!-- 
		<hr>


		<form action="/emos/ssearch" method="post">
			<div class="navbar-form navbar-left">
				<input type="search" name="search" id="search" class="form-control" placeholder="search">
				<input type="submit" value="검색" class="btn btn-default">
				<a href="/emos/index.jsp" class="btn btn-default" role="button"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
			</div>
		</form>
		<br>
 -->
	</div>



</body>
</html>