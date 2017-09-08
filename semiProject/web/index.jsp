<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="storeError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/emos/css/style.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">
<link href="css/plugins/morris.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<title>emos Project</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
	<h1>HOME</h1>
	
	<ul>
		<li><a href="/emos/views/store/storeMainView.jsp">STORE</a></li>
	</ul>
	</div>
	

<script>
	$(window).scroll(function(){ 
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){ 
        	 alert("a");
        } 
	});
</script>
	
	
	
</body>
</html>