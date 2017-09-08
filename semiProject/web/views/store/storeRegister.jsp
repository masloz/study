<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="storeError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function(){
		
		// ID CHECK
		$('#storeId').focusout(function(){
			var value = $('#storeId').val();
			var regex = /^[A-Za-z0-9+]{6,16}$/;
			
			if(value == "" || value == null){
				$('#checkID').text("필수 입력");
			}else if(!regex.test(value)){
				// 4자리 이상 16자리 이하, 영문과 숫자만
				$('#checkID').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			}else{
				// 중복확인
				$.ajax({
					url : "/emos/sidcheck",
					data : {
						storeId : $('#storeId').val()
					},
					type : "post",
					dataType : "text",
					success : function(data){
						if(data == 1){
							$('#checkID').text("사용가능한 아이디입니다.");
							$('#storePwd').focus();
							$('#storeIdCheck').val($('#storeId').val());
						}else{
							$('#checkID').text("이미 사용중입니다.").css("color", "red");
						}
					}
				});
			}
		}); // ID CHECK close
		
		
		// PASSWORD CHECK
		$('#storePwd1').focusout(function(){
			var password1 = $('#storePwd1').val();
			var password2 = $('#storePwd2').val();
			var regex = /^[A-Za-z0-9+]{6,16}$/;
			
			if(password1 == "" || password1 == null){
				$('#checkPwd').text('필수입력');
			}else if(!password2 && password1 != password2){
				$('#checkPwd').text('필수입력');
			}else if(password1 != password2){
				$('#checkPwd').text('안 맞음');
			}else if(!regex.test(password1)){
				$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			}else if(password1 == password2){
				$('#checkPwd').text('일치');
			}
		});
		$('#storePwd2').focusout(function(){
			
			var password1 = $('#storePwd1').val();
			var password2 = $('#storePwd2').val();
			var regex = /^[A-Za-z0-9+]{6,16}$/;
			
			if(password2 == "" || password2 == null){
				$('#checkPwd').text('필수입력');
			}else if(password1 != password2){
				$('#checkPwd').text('안 맞음');
			}else if(!regex.test(password1)){
				$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			}else if(password1 == password2){
				$('#checkPwd').text('일치');
			}
		}); // PASSWORD CHECK close
		
		// COUNT LETTER LENGTH
		 $('#storeIntro').on('keyup', function() {
			 $('#checkStoreInfo').html($(this).val().length + "/200");
		        if($(this).val().length > 200) {
		            $(this).val($(this).val().substring(0, 200));
		        }
		    });
	}); // ready close
	

    function checkAll(){
    	var regex = /^[A-Za-z0-9+]{6,16}$/;
    	var password1 = $('#storePwd1').val();
    	var password2 = $('#storePwd2').val();
    	
		if($('#storeId').val() != $('#storeIdCheck').val()){
			$('#storeId').focus();
			return false;
		}
		// ID CHECK
		if(!$('#storeId').val()){
			$('#checkID').html('아이디를 입력하세요');
			$('#storeId').focus();
			return false;
		}else{
			$('#checkID').html('');
		}
		// PASSWORD CHECK
		if(!password1){
			$('#checkPwd').html('비밀번호를 입력하세요');
			$('#storePwd1').focus();
			return false;
		}else if(!regex.test(password1)){
			$('#checkPwd').text("6자리 이상 16자리 이하, 영문과 숫자만 가능합니다.");
			return false;
		}else {
			$('#checkPwd').html('');
		}
		
		if(!password2){
			$('#checkPwd').html('비밀번호 확인란을 입력하세요');
			$('#storePwd2').focus();
			return false;
		}else {
			$('#checkPwd').html('');
		}
		
		if(password1 != password2){
			$('#storePwd1').focus();
			$('checkPwd').html('비밀번호가 일치하지 않습니다.');
			return false;
		}
		
		
		// NAME CHECK
		if(!$('#storeName').val()){
			$('#checkName').html('상호명을 입력하세요');
			$('#storeName').focus();
			return false;
		}else{
			$('#checkName').html('');
		}
		
		// SERIAL CHECK
		if(!$('#storeSerial').val()){
			$('#checkSerial').html('사업자번호를 입력하세요');
			$('#storeSerial').focus();
			return false;
		}else{
			$('#checkSerial').html('');
		}
		
		// CEO CHECK
		if(!$('#ceo').val()){
			$('#checkCEO').html('대표자명을 입력하세요');
			$('#ceo').focus();
			return false;
		}else{
			$('#checkCEO').html('');
		}
		
		// PHONE CHECK
		if(!$('#phone').val()){
			$('#checkPhone').html('전화번호를 입력하세요');
			$('#phone').focus();
			return false;
		}else{
			$('#checkPhone').html('');
		}
		
		// ADDRESS CHECK
		if(!$('#postcode').val()){
			$('#checkAddress').html('주소를 정확히 입력하세요');
			$('#postcode').focus();
			return false;
		}else{
			$('#checkAddress').html('');
		}
		
		if(!$('#address').val()){
			$('#checkAddress').html('주소를 정확히 입력하세요');
			$('#address').focus();
			return false;
		}else{
			$('#checkAddress').html('');
		}
		
		
	}// checkAll() close
    
	
	
	function caps_lock(e) {
        var keyCode = 0;
        var shiftKey = false;
        keyCode = e.keyCode;
        shiftKey = e.shiftKey;
        if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
            show_caps_lock();
            setTimeout("hide_caps_lock()", 3500);
        } else {
            hide_caps_lock();
        }
    }// caps_lock(e) close

	function show_caps_lock() {
	     $("#capslock").show();
	}
	
	function hide_caps_lock() {
	     $("#capslock").hide();
	}
	
</script>

<title>Store Resister</title>
</head>
<body>
<br>
<br>
<br>
<div class="container">
	<form method="post" action="/emos/sinsert">
		<!-- storeNum, storeJoinDate 제외한 전부-->
		(필수)<br>
		<!-- ID -->
		<input type="text" name="storeId" id="storeId" maxlength="20" autofocus="autofocus" tabindex="1" placeholder="아이디(영문 소, 대문자, 숫자 조합)" pattern="[A-Za-z0-9]{4,10}">
		<input type="hidden" id="storeIdCheck">
		<div id="checkID"></div><br>
		 
		<!-- PASSWORD -->
		<input type="password" name="storePwd1" id="storePwd1" maxlength="20" placeholder="비밀번호(영문 소, 대문자, 숫자 조합)" pattern="[A-Za-z0-9]{4,10}" onkeypress="caps_lock(event)"><br>
		<p id="capslock" style="position:relative; border:2px solid #003b83; width:300px; bottom:0px; display:none"> 
    	&nbsp;<b>CapsLock</b> 키가 눌려있습니다.&nbsp;</p>
		
		<!-- PASSWORD CHECK -->
		<input type="password" name="storePwd2" id="storePwd2" maxlength="20" placeholder="비밀번호 재확인" pattern="[A-Za-z0-9]{4,10}"><br>
		<div id="checkPwd"></div>
		
		<!-- STORE NAME -->
		<input type="text" name="storeName" id="storeName" placeholder="상호명" ><br>
		<div id="checkName"></div><br>
		
		<!-- STORE SERIAL -->
		<input type="text" name="storeSerial" id="storeSerial" placeholder="사업자등록번호" ><br>
		<div id="checkSerial"></div><br>
		
		<!-- CEO -->
		<input type="text" name="ceo" id="ceo" placeholder="대표자명" ><br>
		<div id="checkCEO"></div><br>
		
		<!-- PHONE -->
		<input type="tel" name="phone" id="phone" placeholder="대표 전화번호" ><br>
		<div id="checkPhone"></div><br>
		
		<!-- ADDRESS -->
		<input type="text" id="postcode" name="postcode" placeholder="우편번호">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address" name="address" placeholder="주소">
		<input type="text" id="address2" name="address2" placeholder="상세주소"><br>
		<div id="checkAddress"></div><br>

		<!-- CATEGORY -->
		<select id="category" name="category">
			<option value="피자">피자</option>
			<option value="치킨">치킨</option>
			<option value="햄버거">햄버거</option>
			<option value="중국집">중국집</option>
			<option value="양식">양식</option>
			<option value="한식">한식</option>
			<option value="일식">일식</option>
		</select><br>
		
		
		<br>(선택)<br>
		<!-- QR -->
		<input type="text" name="qr" id="qr" placeholder="QR코드 주소?"><br>
		
		<!-- HOMEPAGE -->
		<input type="url" name="homepage" id="homepage" placeholder="인터넷도메인"><br>
		
		<!-- STORE NOTICE -->
		<input type="text" name="storeNotice" id="storeNotice" placeholder="공지사항"><br>
		
		<!-- STORE INTRO -->
		<textarea rows="10" cols="50" name="storeIntro" id="storeIntro" placeholder="기업소개"></textarea><br>
		<div id="checkStoreInfo">0/200</div>
		
		<!-- STORE ORIGIN INFO -->
		<textarea rows="10" cols="50" name="storeOriginInfo" id="storeOriginInfo" placeholder="원산지정보"></textarea><br>
		
		<!-- STORE BUSINESSTIME -->
		<input type="text" name="storeBusinessTime" id="storeBusinessTime" placeholder="운영시간"><br>
		
		<!-- STORE MIN PRICE -->
		<input type="number" name="storeMinPrice" id="storeMinPrice" placeholder="최소주문가격" step="1000"><br>
		
		
		<!-- confirm, cancel 으로 재확인 -->
		<input type="submit" value="register" id="submitBtn" onclick="return checkAll();">
	</form>
	
	</div>
	
	
	
	
	
	
	
	
	
	
<!-- ADDRESS SCRIPT -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    } // ADDRESS API Close
</script>
	
	
</body>
</html>