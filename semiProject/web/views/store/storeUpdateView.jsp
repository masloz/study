<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="storeError.jsp" import="store.model.vo.Store"%>
	<%
    	String[] cateArr = {"피자", "치킨", "햄버거", "중국집", "한식", "양식", "일식"};
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>emos Project</title>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div id="header02">
			<a href="/emos/index.jsp"> <img id="logo2" src="/emos/image/logo/logo.png"></a>
			<div class="w3-display-right" style="margin-right: 20px">
				<button href="#" class="w3-button" style="border: solid 1px white; border-radius: 3px"
					onclick="document.getElementById('id02').style.display='block'">로그인</button>
				<a href="#" class="w3-button w3-yellow" style="border-radius: 3px">회원가입</a>
			</div>

			<div id="id02" class="w3-modal">
				<div class="w3-modal-content w3-animate-top">
					<div class="w3-container">
						<span
							onclick="document.getElementById('id02').style.display='none'"
							class="w3-button w3-display-topright">&times;</span>

						<form id="login01" class="w3-display-topmiddle">
							<input type="text" id="id" class="w3-display-topleft"
								value="아이디 입력"> <input type="password" id="pw"
								class="w3-display-bottomleft"> <a href="#"
								class="w3-button w3-display-right">로그인</a>
						</form>

						<div class="w3-display-bottommiddle" id="loginservice">
							<a href="#" class="w3-button w3-indigo">기업회원가입</a> <a href="#"
								class="w3-button w3-green">아이디 찾기</a> <a href="#"
								class="w3-button w3-teal">비밀번호 찾기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse" style="background : #0c0642;">
                <ul class="nav navbar-nav side-nav" style="top:71px; background : #0c0642;">
                    <li>
                        <a href="/emos/views/store/storeMainView.jsp"><i class="fa fa-fw fa-dashboard"></i> Tables</a>
                    </li>
                    <li>
                        <a href="/emos/slist?category=전체메뉴"><i class="fa fa-fw fa-edit"></i>  STORE</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li>
                    <li  class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#ul1"><i class="fa fa-fw fa-arrows-v"></i> Store Information <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="ul1" class="collapse">
                            <li>
                                <a href="/emos/views/store/storeUpdateView.jsp">기업 정보 수정</a>
                            </li>
                            <li>
                                <a href="#">123123</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#ul2"><i class="fa fa-fw fa-arrows-v"></i> Menu Administration <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="ul2" class="collapse">
                            <li>
                                <a href="#">메뉴 추가</a>
                            </li>
                            <li>
                                <a href="#">메뉴 수정/삭제</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-file"></i> ERP</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

		<div id="page-wrapper" style="height : 92.5%; position:absolute; margin-top: 23px;">
			<div class="container-fluid" >
			
			
			
			
			<form method="post" action="/emos/supdate">
				<!-- capslock 눌려있으면 자바스크립트로? -->	
				<!-- 최대 몇 자 계산해서 더 이상 안써지게? -->
				
				<!-- storeNum, storeJoinDate 제외한 전부-->
				<input type="text" name="storeId" id="storeId" maxlength="20" autofocus="autofocus" value="<%= store.getStoreId() %>" readonly><br>
				<input type="text" name="storeName" id="storeName" placeholder="상호명" required value="<%= store.getStoreName() %>" readonly><br>
				<input type="text" name="storeSerial" id="storeSerial" placeholder="사업자등록번호" required value="<%= store.getStoreSerial() %>" readonly><br>
				<input type="text" name="ceo" id="ceo" placeholder="대표자명" required value="<%= store.getCeo() %>"><br>
				<input type="tel" name="phone" id="phone" placeholder="대표 전화번호" required value="<%= store.getPhone() %>"><br>
				<input type="text" name="address" id="address" placeholder="사업장소재지" required value="<%= store.getAddress() %>"><br>
				
				<select id="category" name="category">
				<% for(String category : cateArr){ %>
					<% if(store.getCategory().equals(category)){ %>
						<option value="<%= category %>" selected><%= category %></option>
					<% } else { %>
						<option value="<%= category %>" ><%= category %></option>
					<% } %>
				<% } %>
				</select><br>
				
				<br>(선택)<br>
				<input type="text" name="qr" id="qr" placeholder="QR코드 주소?" value="<%= store.getQr() %>"><br>
				<input type="url" name="homepage" id="homepage" placeholder="인터넷도메인" value="<%= store.getHomepage() %>"><br>
				
				<input type="text" name="storeNotice" id="storeNotice" placeholder="공지사항" value="<%= store.getStoreNotice() %>"><br>
				
				
				<textarea rows="10" cols="50" name="storeIntro" id="storeIntro" placeholder="기업소개"><%= store.getStoreIntro() %></textarea><br>
				<textarea rows="10" cols="50" name="storeOriginInfo" id="storeOriginInfo" placeholder="원산지정보"><%= store.getStoreOriginInfo() %></textarea><br>
				<input type="text" name="storeBusinessTime" id="storeBusinessTime" placeholder="운영시간" value="<%= store.getStoreBusinessTime() %>"><br>
				<input type="number" name="storeMinPrice" id="storeMinPrice" placeholder="최소주문가격" step="1000" value="<%= store.getStoreMinPrice() %>"><br>
				
				
				<!-- confirm, cancel 으로 재확인 -->
				<input type="submit" value="register">
			</form>
			
			<input type="password" name="storePwd1" id="storePwd1" maxlength="20" placeholder="비밀번호(영문 소, 대문자, 숫자 조합)" pattern="[A-Za-z0-9]{4,10}" required><br>
			<input type="password" name="storePwd2" id="storePwd2" maxlength="20" placeholder="비밀번호 재확인" pattern="[A-Za-z0-9]{4,10}" required><br>
			
		<a href="/emos/views/store/storeDelete.jsp">DELETE STORE</a>	
		 	
		 	
				
			</div>
			<!-- /.container-fluid -->
			
		</div>
		<!-- /DIV #page-wrapper -->

	</div>
	<!-- /DIV #wrapper -->
		
		
	
</body>
</html>