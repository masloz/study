<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE</title>
</head>
<body>


	<% String[] arr = {"a", "b", "c"}; %>

	<table border="1">
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>첨부파일</th>
		</tr>
			
		
		
		<c:forEach items="${ list }" var="item">
		<tr>
			<td>${ item.noticeNo }</td>
			<td>${ item.noticeTitle }</td>
			<td>${ item.noticeDate }</td>
			<td>${ itme.filePath }</td>
		</tr>	
		</c:forEach>
		
		
	</table>
</body>
</html>