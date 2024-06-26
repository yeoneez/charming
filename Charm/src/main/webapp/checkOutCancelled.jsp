<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="BootStrap Demo"/>
	<link rel="icon" href="ms-icon-310x310.png"/>
    <title>귀템 스토어</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="./resource/css/headers.css" rel="stylesheet">
<title>주문 취소</title>
</head>
<body style="background-color:rgb(224, 224, 224)">
	<jsp:include page="menu.jsp" />
	<jsp:include page="menu2.jsp" />
	<div class="jumbotron">
		<div class="container">
		<div class="text-center">
			<h3 class="mx-md-auto mb-0" style="color:rgb(125,125,255);">주문 취소</h3>
		</div>
		</div>
	</div>
	<br>
	<div class="container">
		<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>		
	</div>	
</body>
</html>