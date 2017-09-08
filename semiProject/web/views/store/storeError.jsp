<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/header.jsp"%>
	<h1 align="center">Board ERROR!!</h1>
	<% if(exception != null){ %>
	JSP 페이지에서 발생한 에러 메세지 : <%= exception.getMessage() %>
	<% } else { %>
	<br>
	Servlet 에서 전송한 에러 메세지 : <%= (String)request.getAttribute("message") %>
	<% } %>	
</body>
</html>