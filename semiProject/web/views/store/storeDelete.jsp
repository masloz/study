<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="storeError.jsp"%>
<%@ page import="store.model.vo.Store" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Store</title>
</head>
<body>
<%@ include file="/header.jsp"%>
	<!-- 미완성... -->
	<!-- 로그인 -->
	<!-- 불러왔다는 가정하에 -->
	<form method="post" action="/emos/sdelete?storeNum=<%= store.getStoreNum() %>">
		<input type="text" value="<%= store.getStoreId() %>" readonly><br>
		탈퇴 전 비밀번호 확인 <br>
		<input type="password" name="storePwd"><br>
		<input type="submit" value="탈퇴하기">
	</form>
</body>
</html>