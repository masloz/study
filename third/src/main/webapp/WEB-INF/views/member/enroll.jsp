<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#checkId').click(function(){
			$.ajax({
				url : "dupid.do",
				type : "post",
				data : {userid : $('#userid').val()},
				dataType : "text",
				success : function(value){
					//alert("서블릿이 보낸 값 : " + data);
					if(value === "ok"){
						alert("사용 가능한 아이디입니다.");
						$('#username').focus();
					}
					if(value === "fail"){
						alert("이미 존재하는 아이디입니다. 다른 아이디로 정하십시오.");
						$('#userid').select();
					}
				}, 
				error : function(value){
					alert("에러 : " + value);
				}
			});
			
			
			return false;
		});
	});
</script>
</head>
<body>
<h1 align="center">회원 가입 페이지</h1>
<center>
<!-- <form action="../../minsert" method="post"> -->
<form action="minsert.do" method="post">
<table width="600" cellspacing="5" bgcolor="#3399ff">
<tr><td width="150">아이디</td>
<td width="450"><input type="text" name="id" id="userid"> &nbsp; &nbsp; <button id="checkId">중복확인</button></td></tr>
<tr><td>이 름</td><td><input type="text" name="name" id="username"></td></tr>
<tr><td>암 호</td><td><input type="password" name="passwd" id="userpwd"></td></tr>
<tr><td>암호확인</td><td><input type="password" name="passwd2" id="userpwd2"></td></tr>
<tr><td>성 별</td>
<td><input type="radio" name="gender" value="M"> 남
<input type="radio" name="gender" value="F"> 여</td></tr>
<tr><td>나 이</td>
<td><input type="number" min="20" max="100" name="age" id="age"></td></tr>
<tr><td>이메일</td><td><input type="email" name="email"></td></tr>
<tr><td>전화번호</td><td><input type="tel" name="phone"></td></tr>
<tr><td>우편번호</td><td><input type="text" name="address" size="10"></td></tr>
<tr><td>기본주소</td><td><input type="text" name="address"></td></tr>
<tr><td>상세주소</td><td><input type="text" name="address"></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="가입하기"> &nbsp;
	<input type="reset" value="취소하기">
</td></tr>
</table>
</form>

<br><br>
<a href="../home.jsp">시작페이지로 이동</a>
</center>

</body>
</html>