<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="storeError.jsp"%>
<%@ page import="store.model.vo.Store, java.util.ArrayList, store.model.vo.StoreImage, store.model.service.StoreService"%>
<%
	ArrayList<Store> list = (ArrayList<Store>)request.getAttribute("list");
	String category = (String)request.getAttribute("category");
	String[] cateArr = {"전체메뉴", "피자", "치킨", "햄버거", "중국집", "한식", "양식", "일식"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>emos Project</title>
</head>
<body style="background: white;">
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
	<div class="w3-row" style="margin-top: 25px;">
		<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-left"
			style="display: none" id="leftMenu">
			<button onclick="closeLeftMenu()"
				class="w3-bar-item w3-button w3-large">&times;</button>

			<%
				for (String cate : cateArr) {
			%>
			<a href="/emos/slist?category=<%=cate%>" class="w3-bar-item w3-button"><%=cate%></a>
			<%
				}
			%>
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

	
	<!-- CONTENTS -->
	<div class="w3-content" id="listContent" style="background:#fff;">
		<div class="w3-row w3-center">
			<div class="w3-col m12">
				<h1><%= category %></h1>
			</div>
		</div>
		
		
		<!-- STORE LIST -->
		<%
			for(Store s : list){
		%>
		<a href="/emos/sdetail?storeNum=<%= s.getStoreNum() %>">
			<div class="w3-third">
				<div class="w3-card-4">
				<%
					StoreImage simg = new StoreService().selectStoreImg(s.getStoreNum());
				%>
				<% if(simg.getImgMain() != null) {%>
					<img src="/emos/storeImg/<%= s.getStoreNum() %>/main.jpg" style="height: 200px; width: 100%">
				<% }else { %>
					<img src="/emos/storeImg/common/main.jpg" style="height: 200px; width: 100%">
				<% } %>
					<div class="w3-container w3-white" style="height: 200px;">
						<h4><%= s.getStoreName() %></h4>
						<p>
							업 종 :
							<%= s.getCategory() %><br>
							<!-- 주   소 : <%= s.getAddress().substring(6).replace(",", " ") %><br> -->
							주 소 :
							<%= s.getAddress().substring(6, s.getAddress().lastIndexOf(",")) %><br>
							전화번호 :
							<%= s.getPhone() %><br> 대표메뉴 :
						</p>
					</div>
				</div>
			</div>
		</a>
		<%
			}
		%>
		
	</div>
	<!-- CONTENTS CLOSE -->
	
	<%@ include file="/totop.jsp"%>

	<!-- MORE LIST SCRIPT -->
	<script>
				var page = 0;
				var category = "<%= category %>";
					$(window).scroll(function(){ 
				        if  ($(window).scrollTop() == $(document).height() - $(window).height()){ 
				        	 page++;
				        	 $.ajax({
				        		 url : "/emos/slistmore",
				        		 data : {
				        			page : page,
				        	 		category : category
				        		 },
				        		 type : "post",
				        		 dataType : "json",
				        		 success : function(data){
				        			 var jsonStr = JSON.stringify(data); //객체를 문자열로 변환
				     				 var json = JSON.parse(jsonStr);
				        			 
				     				var values = $("#listContent").html();
				     				
				     				for(var i in json.list){
				     					values += "<a href='/emos/sdetail?storeNum=" + json.list[i].storeNum + "'><div class='w3-third'><div class='w3-card-4'>";
				     					if(json.list[i].main != null) {
				     						values +="<img src='/emos/storeImg/" + json.list[i].storeNum + "/main.jpg' style='height: 200px; width: 100%'>";
				     						} else {
				     						values +="<img src='/emos/storeImg/common/main.jpg' style='height: 200px; width: 100%'>";
				     						}
				     					
				     					values += "<div class='w3-container w3-white' style='height: 200px;'><h4>" + decodeURIComponent(json.list[i].storeName) + "</h4><p>업   종 : " + decodeURIComponent(json.list[i].category) + "<br>주   소 : " + decodeURIComponent(json.list[i].address) + "<br>전화번호 : " + decodeURIComponent(json.list[i].phone) + "<br>대표메뉴 : </p></div></div></div></a>";
				     				}
				     				
				     				$("#listContent").html(values);
				        			 
				        		 },
				        		 error : function(){
				        			 alert("fail");
				        		 }
				        	 });
				        }
					});
				</script>

</body>
</html>