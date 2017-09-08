<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="storeError.jsp"
	import="store.model.vo.Store"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>emos Project</title>
</head>
<body style="background: darkgray;">
	<%@ include file="/header.jsp"%>


	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div id="header02">
			<a href="/emos/index.jsp"> <img id="logo2"
				src="/emos/image/logo/logo.png"></a>
			<div class="w3-display-right" style="margin-right: 20px">
				<button class="w3-button"
					style="border: solid 1px white; border-radius: 3px"
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
	</nav>


	<!-- SIDE MENU BAR -->
	<div class="w3-row" style="margin-top: 70px;">
		<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left"
			style="display: none" id="leftMenu">
			<button onclick="closeLeftMenu()"
				class="w3-bar-item w3-button w3-large">&times;</button>
			<a href="/emos/slist?category=전체메뉴" class="w3-bar-item w3-button">STORE</a>
			<a href="/emos/views/store/storeUpdateView.jsp" class="w3-bar-item w3-button">기업정보 수정</a> 
			<a href="#" class="w3-bar-item w3-button">메뉴 추가/삭제</a>
			<a href="/emos/simg?storeNum=<%= store.getStoreNum() %>&up=0" class="w3-bar-item w3-button">매장 사진 추가/삭제</a>
		</div>


		<!-- SIDE MENU BUTTON -->
		<div class="w3-left">
			<button class="w3-button w3-xlarge w3-left" onclick="openLeftMenu()">&#9776;</button>
		</div>

		<!-- MENU SCRIPT -->
		<script>
			function openLeftMenu() {
				document.getElementById("leftMenu").style.display = "block";
			}
			function closeLeftMenu() {
				document.getElementById("leftMenu").style.display = "none";
			}
		</script>
	</div>


	<div class="w3-content" style="background:#fff">
		<div class="w3-row w3-center">
			<div class="w3-col m12">
				<h1>Table</h1>
			</div>
		</div>
		<div class="w3-row">
			a
		</div>
	</div>
	
	
	
	
	
	
	

</body>
</html>