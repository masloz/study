<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="storeError.jsp"%>
<%@ page import="store.model.vo.Store, store.model.service.StoreService, java.util.ArrayList, member.model.vo.Member, member.model.service.MemberService, store.model.vo.StoreImage"%>
<%@ page import="reply.model.vo.Reply, java.util.*, java.sql.Date"%>
<%
	Store s = (Store)request.getAttribute("store");
	ArrayList<Store> list = (ArrayList<Store>)request.getAttribute("list");
	String category = s.getCategory();
	String[] cateArr = {"전체메뉴", "피자", "치킨", "햄버거", "중국집", "한식", "양식", "일식"};
	Member member = new MemberService().selectMember("user", "user");
	StoreImage simg = new StoreService().selectStoreImg(s.getStoreNum());	
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
<script type="text/javascript" src="/emos/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/emos/js/jquery.raty.js"></script>
<style type="text/css">
	label{
		top:0px;
	}
	</style>
<title>STORE DETAIL VIEW</title>
</head>
<body style="background: #ddd">
	
	
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

			<%
				for (String cate : cateArr) {
			%>
			<a href="/emos/slist?category=<%=cate%>"
				class="w3-bar-item w3-button"><%=cate%></a>
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
	<div class="w3-content" style="background: #fff; box-shadow: 5px 5px 5px grey;">
	
		<!-- CATEGORY -->
		<div class="w3-display-container">
			<h4><a href="/emos/slist?category=전체메뉴">Home</a> > <%=s.getCategory()%></h4>
			<div class="w3-display-topright"><a href=""><img src="/emos/storeImg/common/fav1.png" style="width: 40px; height: 20px; text-decoration: none; margin-top:-5px;"> 즐겨찾기</a></div>
		</div>
		
		
		<div class="w3-row">
			<div class="w3-display-container" style="top:0; left:0; width:100%; height:100%">
				<% if(simg.getImgMain() != null) { %>
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImgMain() %>" width="100%" height="300px">
				<% } else {%>
				<img src="/emos/storeImg/common/main.jpg" width="100%" height="300px">
				<% } %>
				<div class="w3-container w3-center w3-padding-16 w3-large" style="margin-top: -60px; margin-left:10%; margin-right:10%; background: #fff; border-radius: 8px; opacity: 0.8; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
					<h1 class="w3-xxlarge"><b><%=s.getStoreName()%></b></h1>
				</div>
			</div>
		</div>
		
		
		
		<!-- DETAIL VIEW -->
		<div class="w3-row">
			<div class="" style="padding-left:50px;">
				<h3>상세정보</h3>
				<p>
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					<%=s.getAddress().substring(6).replace(",", " ")%><br>
				</p>
	
	
				<%
					if(s.getStoreBusinessTime() != null) {
				%>
				<p>
					<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
					영업시간 : <%=s.getStoreBusinessTime()%><br>
				</p>
				<%
					}
				%>
	
	
				<%
					if (s.getHomepage() != null) {
				%>
				<p>
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					홈페이지 : <a href="<%=s.getHomepage()%>" target="_blank"><%=s.getHomepage()%></a><br>
				</p>
				<%
					}
				%>
				
	
				<p>
					<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
					대표번호 : <%=s.getPhone()%><br>
				</p>
	
				<p>
					<span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>
					대표메뉴 : <br>
				</p>
			</div>
			
			<!-- 주소 위치(네이버) -->
			<div id="map" style="width: 100%; height: 400px;">
			</div>
		</div>
		<!-- DETAIL VIEW CLOSE -->
	</div>

	<div class="w3-content">
		<!-- MENU BUTTON -->
		<a href="#" class="w3-btn w3-ripple w3-yellow" style="width: 100%; margin-top: 5px; margin-bottom: 5px;"><b>메뉴판 가기</b></a>
	</div>

	<div class="w3-content" style="background: #fff;">
		<!-- PICTURE -->
		<% if(simg.getImg3() != null){ %>
		<!-- 3개일 때 -->
		<div class="" style="height: 250px;">
			<div class="w3-col m4" style="height:100%; border:solid white 1px;">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg1() %>" style="width: 100%; height: 100%;">
			</div>
			<div class="w3-col m4 w3-display-container" style="height:100%; border:solid white 1px;">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg2() %>" style="width: 100%; height: 100%;">
			</div>
			<div class="w3-col m4" style="height:100%">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg3() %>" style="width: 100%; height: 100%;">
			</div>
		</div>
		<% }else if(simg.getImg2() != null){ %>
		<!-- 2개일 때 -->
		<div class="w3-display-container" style="height: 300px;">
			<div class="w3-col m6 w3-display-container" style="height: 300px; border:solid white 1px;">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg1() %>" style="width: 100%; height: 100%;">
			</div>
			<div class="w3-col m6 dropzone" style="height: 300px; text-align: center; padding-top: 140px; border: dotted black 2px;">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg2() %>" style="width: 100%; height: 100%;">
			</div>
		</div>			
		<% }else if(simg.getImg1() != null){ %>
		<!-- 1개일 때 -->
		<div class="w3-display-container" style="height: 300px;">
			<div class="w3-col m8 w3-display-container w3-display-middle" style="height: 100%; border: solid black 1px;">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg1() %>" style="width: 100%; height: 100%;">
			</div>
		</div>
		
		<% }else{ %>
		
		<% } %>

		<!-- REVIEW -->



		--------------------------------------------------------------------------


		<div id="notice">
			- 공지사항 :
			<%=s.getStoreNotice()%>
		</div>


		<div id="serial">
			- 사업자번호 :
			<%=s.getStoreSerial()%>
		</div>

		<% if(s.getHomepage() != null){ %>
		<div id="qr">
			- QR코드 : <br> <img
				src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=<%= s.getHomepage() %>">
			<!-- https://developers.google.com/chart/infographics/docs/qr_codes (구글 참조) -->
		</div>
		<% } %>

		<% if(s.getHomepage() != null){ %>
		<div id="homepage">
			- 홈페이지 : <a href="<%= s.getHomepage() %>" target="_blank"><%= s.getHomepage() %></a>
		</div>
		<% } %>

		<% if(s.getStoreIntro() != null){ %>
		<div id="introduce">
			- 업소소개 :
			<%= s.getStoreIntro() %>
		</div>
		<% } %>

		<% if(s.getStoreOriginInfo() != null){ %>
		<div id="originInfo">
			- 원산지 :
			<%= s.getStoreOriginInfo() %>
		</div>
		<% } %>

	

		<% if(s.getStoreMinPrice() != 0){ %>
		<div id="minPrice()">
			- 최소주문가격 :
			<%= s.getStoreMinPrice() %>
		</div>
		<% } %>

		
	</div>
	<!-- CONTENTS CLOSE -->






















	<!-- script -->

	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=c9peV05tyKffEh9bvxes&submodules=geocoder"></script>

	<script>
      var map = new naver.maps.Map('map');
      var myaddress = '<%= s.getAddress().substring(6, s.getAddress().lastIndexOf(",")) %>';
      map.setOptions("mapTypeControl", true); // 일반, 위성 옵션
      // 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          
          // 마크 클릭시
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4><a href="<%= s.getHomepage() %>" target="_blank"><%= s.getStoreName() %></a></h4><br><%= s.getAddress() %>'
          });
      });
      </script>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      <!-- 내꺼 아님 -->
      
      
      
      
      
      
      
      
      

</body>
</html>