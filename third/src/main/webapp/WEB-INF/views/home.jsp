<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Sprint test project : third</h1>
	<c:if test="${ empty sessionScope.member }">
	<form action="login.do" method="post">
		아아디 : <input type="text" name="id"><br> 암호 : <input
			type="password" name="passwd"><br> 
			<input type="submit" value="확인">
	</form>
	
	
	
	
	<a href="enroll.do">회원가입</a> &nbsp; &nbsp;
	<br>
	<br>
	<a href="notice.do">공지사항</a>
	
	
	
	
	
	</c:if>
	<c:if test="${ !empty sessionScope.member }">
		<h3>${ sessionScope.member.name }님 <a href="logout.do" >Logout</a></h3>
	</c:if>
</body>
</html>
