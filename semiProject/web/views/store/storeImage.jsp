<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="storeError.jsp"
	import="store.model.vo.Store, store.model.vo.StoreImage, store.model.service.StoreService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 필수!!!!!!!!!!!!!!!!!! -->
<script>
	var imgCount;
</script>

<title>emos Project</title>
</head>
<body style="background: #ddd;">
	<%@ include file="/header.jsp"%>
	<%
		StoreImage simg = new StoreService().selectStoreImg(store.getStoreNum());
	%>
	
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
			<a href="/emos/views/store/storeImage.jsp" class="w3-bar-item w3-button">매장 사진 추가/삭제</a>
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
	
	
	<!-- ---------------------------------------------------------------------------------------------- -->
	


	<div class="w3-content" style="background:#fff; box-shadow: 5px 5px 5px grey;">
		<div class="w3-row w3-center">
			<div class="w3-col m12">
				<h1>IMAGE</h1>
			</div>
		</div>
		
		
		
		<!-- MAIN IMAGE -->
		<% if(simg.getImgMain() != null) { %>
		<div class="w3-row">
			<div class="w3-display-container" style="top:0; left:0; width:100%; height:100%">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImgMain() %>" width="100%" height="300px">
				<a href="/emos/simgdel?storeNum=<%= store.getStoreNum() %>&img=<%= simg.getImgMain() %>" class="w3-button w3-large w3-hover-gray w3-display-topright" style="text-decoration: none;">&times;</a>
					<div class="w3-container w3-center w3-padding-16 w3-large" style="margin-top: -60px; margin-left:10%; margin-right:10%; background: #fff; border-radius: 8px; opacity: 0.8; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
						<h1 class="w3-xxlarge"><b><%=store.getStoreName()%></b></h1>
					</div>
			</div>
		</div>
		<% } else {%>
		<div class="w3-display-container" style="height: 300px; width:100%">
			<div class="w3-col m8 w3-display-container w3-display-middle" style="width: 100%; height: 100%;">
				<div class="dropzone" id="mainImg" style="width : 100%; height: 100%; text-align: center; padding-top: 140px; border: dotted black 2px;">
					Drag & Drop Image Here
				</div>
			</div>
		</div>
		<div class="w3-container w3-center w3-padding-16 w3-large" style="margin-top: -60px; margin-left:10%; margin-right:10%; background: #fff; border-radius: 8px; opacity: 0.8; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
			<h1 class="w3-xxlarge"><b><%=store.getStoreName()%></b></h1>
		</div>
		
		<% } %>
		<!-- DETAIL VIEW -->
		<div class="w3-row">
			<div class="" style="padding-left:50px;">
				<h3>상세정보</h3>
				<p>
					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					<%=store.getAddress().substring(6).replace(",", " ")%><br>
				</p>
	
	
				<%
					if(store.getStoreBusinessTime() != null) {
				%>
				<p>
					<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
					영업시간 : <%=store.getStoreBusinessTime()%><br>
				</p>
				<%
					}
				%>
	
	
				<%
					if (store.getHomepage() != null) {
				%>
				<p>
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					홈페이지 : <a href="<%=store.getHomepage()%>" target="_blank"><%=store.getHomepage()%></a><br>
				</p>
				<%
					}
				%>
				
	
				<p>
					<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
					대표번호 : <%=store.getPhone()%><br>
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
	
	
	<div class="w3-content" style="background: #fff;  box-shadow: 5px 5px 5px grey;">
		<!-- PICTURE -->
		
		
		
		<% if(simg.getImg3() != null){ %>
			<div class="" style="height: 200px;">
				<div class="w3-col m4 w3-display-container" style="height:100%; border:solid white 1px;">
					<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg1() %>" style="width: 100%; height: 100%;">
				</div>
				<div class="w3-col m4" style="height:100%; border:solid white 1px;">
					<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg2() %>" style="width: 100%; height: 100%;">
				</div>
				<div class="w3-col m4 w3-display-container" style="height:100%; border:solid white 1px;">
					<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg3() %>" style="width: 100%; height: 100%;">
					<a href="/emos/simgdel?storeNum=<%= store.getStoreNum() %>&img=<%= simg.getImg3() %>" class="w3-button w3-large w3-hover-gray w3-display-topright" style="text-decoration: none;">&times;</a>
				</div>
			</div>
		<% }else if(simg.getImg2() != null){ %>
			
		<!-- 2개일 때 -->
		<script>
			imgCount = 2;
		</script>		
		<div class="" style="height: 250px;">
			<div class="w3-col m4" style="height:100%; border:solid white 1px;">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg1() %>" style="width: 100%; height: 100%;">
			</div>
			<div class="w3-col m4 w3-display-container" style="height:100%; border:solid white 1px;">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg2() %>" style="width: 100%; height: 100%;">
				<a href="/emos/simgdel?storeNum=<%= store.getStoreNum() %>&img=<%= simg.getImg2() %>" class="w3-button w3-large w3-hover-gray w3-display-topright" style="text-decoration: none;">&times;</a>
			</div>
			<div class="w3-col m4" style="height:100%">
				<div class="dropzone" style="height: 100%; text-align: center; padding-top: 120px; border: dotted black 2px;">
					Drag & Drop Image Here
				</div>
			</div>
		</div>
			
		<% }else if(simg.getImg1() != null){ %>
		<!-- 1개일 때 -->
		<script>
			imgCount = 1;
		</script>
		<div class="w3-display-container" style="height: 300px;">
			<div class="w3-col m6 w3-display-container" style="height: 300px; border:solid white 1px;">
				<img src="/emos/storeImg/<%= simg.getStoreNum() %>/<%= simg.getImg1() %>" style="width: 100%; height: 100%;">
				<a href="/emos/simgdel?storeNum=<%= store.getStoreNum() %>&img=<%= simg.getImg1() %>" class="w3-button w3-large w3-hover-gray w3-display-topright" style="text-decoration: none;">&times;</a>
			</div>
			<div class="w3-col m6 dropzone" style="height: 300px; text-align: center; padding-top: 140px; border: dotted black 2px;">
				Drag & Drop Image Here
			</div>
		</div>
		
		<% }else{ %>
		<script>
			imgCount = 0;
		</script>
		<!-- 0개일 때 -->
		<div class="w3-display-container" style="height: 300px;">
			<div class="w3-col m8 w3-display-container w3-display-middle" style="height: 100%; border: solid black 1px;">
				<div class="dropzone" style="height: 100%; text-align: center; padding-top: 140px; border: dotted black 2px;">
					Drag & Drop Image Here
				</div>
			</div>
		</div>
		<% } %>
		<script>
		$(function () {
		     var obj = $(".dropzone");
		     $('#mainImg').on('drop', function(e){
		    	 e.stopPropagation();
		          e.preventDefault();
		          imgCount = 99;
		     })
		    	 
		     

		     obj.on('dragenter', function (e) {
		          e.stopPropagation();
		          e.preventDefault();
		          $(this).css('border', '2px solid #5272A0');
		     });

		     obj.on('dragleave', function (e) {
		          e.stopPropagation();
		          e.preventDefault();
		          $(this).css('border', '2px dotted #8296C2');
		     });

		     obj.on('dragover', function (e) {
		          e.stopPropagation();
		          e.preventDefault();
		     });

		     obj.on('drop', function (e) {
		          e.preventDefault();
		          $(this).css('border', '2px dotted #8296C2');

		          var files = e.originalEvent.dataTransfer.files;
		          if(files.length < 1){
		        	  return;
		          }

		          F_FileMultiUpload(files, obj);
		     });
		     
		  
		     
		     

		});
		
		function F_FileMultiUpload(files, obj) {
		     if(confirm("파일을 업로드 하시겠습니까?")) {
				var data = new FormData();
				data.append('imgCount', imgCount);
				for (var i = 0; i < files.length; i++) {
		            data.append('file', files[i]);
		         }

				
		         var url = "/emos/simg?storeNum=" + <%= store.getStoreNum() %> + "&up=2";
		         $.ajax({
		            url: url,
		            method: 'post',
		            enctype: 'multipart/form-data',
		            data: data,
		            processData: false,
		            contentType: false,
		            success: function() {
		            	window.location.reload();
		            }
		         });
		     }
		}

		// 파일 멀티 업로드 Callback
		function F_FileMultiUpload_Callback(files) {
		     for(var i=0; i < files.length; i++)
		         console.log(files[i].file_nm + " - " + files[i].file_size);
		}



		</script>
		
		
		
		
		
		
		
		<!-- REVIEW -->
		<div class="w3-row">
			<div class="w3-display-container"
				style=" height:500px; width:90%; margin-bottom:-490px; margin-left:5%; opacity: 0.9; background: white; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
				<div class="w3-display-middle">
					<h1>미리보기</h1>
				</div>
			</div>
			<div id="score" style="">
				<h3>- 평가하기 -</h3>
				<h4>4.1 점 ★★★★☆</h4>
				<form id="review" style="position: relative">

					<textarea id="reviewfield" readonly></textarea>
					<button class="w3-button w3-yellow w3-display-bottomright"
						onclick="submit" disabled>입력하기</button>

				</form>
				<hr>

				<table class="w3-table w3-bordered" id="reviewtable">
					<tr>
						<td>★★★</td>
						<td>걸래판 물인줄~ 이래서 평양냉면 평양냉면 하는구나</td>
						<td>user9**</td>
					</tr>
					<tr>
						<td>★</td>
						<td>암이 나았어요.~ 뭘 넣은거지..;; 그리고 한여름에 따뜻한 물은 좀..;;</td>
						<td>923b**</td>
					</tr>
					<tr>
						<td>★★★★★</td>
						<td>delicious!!! korean is hell~</td>
						<td>jjih****</td>
					</tr>

					<tr>
						<td>★★</td>
						<td>여름엔 따뜻하고 겨울엔 시원한 가게..</td>
						<td>jjih****</td>
					</tr>

					<tr>
						<td>★</td>
						<td>손맛 손맛 하더니 정말로 손톱이 나왔어요!! ㅅㅂ..</td>
						<td>jjih****</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- REVIEW CLOSE -->
		
		
		
	</div>
	
	
	
	
	
	
	<!-- script -->

	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=c9peV05tyKffEh9bvxes&submodules=geocoder"></script>

	<script>
      var map = new naver.maps.Map('map');
      var myaddress = '<%= store.getAddress().substring(6, store.getAddress().lastIndexOf(",")) %>';
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
              content: '<h4><a href="<%= store.getHomepage() %>" target="_blank"><%= store.getStoreName() %></a></h4><br><%= store.getAddress() %>'
          });
      });
      </script>
	

</body>
</html>