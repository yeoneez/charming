<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>

<header style="background-color: rgb(235, 211, 234);">
	<!-- <header class="mb-auto" style="background-color:rgb(235,211,234); border: 1px solid black;"> -->
	<div style="display: flex; flex-direction: column;">

		<div class="text-center">
			<!-- <div class="text-center" style="text-align:center; font-size:25px; border:1px solid aqua;"> -->

<%-- 			<a href="<c:url value='/main.jsp'/>"> --%>
				<div class="fs-2 display-3" style="color:rgb(125,125,255);"><a class="text-decoration-none"  href="<c:url value="/main.jsp" />">Charming Items Store</a></div>
			
			<!-- <h3 class="mx-md-auto mb-0" style="color:rgb(125,125,255);" href="main.jsp">Charming Items Store</h3> -->
		</div>

		<nav
			style="width: 100%; text-align: right; display: flex; flex-direction: row; justify-content: end;">
			<!--     <nav class="nav nav-masthead justify-content-center float-md-end" style="width:100%; text-align: right; border:1px solid red;"> -->

			<c:choose>
				<c:when test="${empty sessionId}">
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/member/loginMember.jsp"/>"
						style="color: rgb(26, 140, 255);">Login</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/products.jsp"/>"
						style="color: rgb(26, 140, 255);">Products</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/member/addMember.jsp"/>"
						style="color: rgb(26, 140, 255);">sign up</a>


				</c:when>


				<c:when test="${sessionId eq 'admin'}">
					<li style="padding-top: 7px; color: white">[<%=sessionId%>님]
					</li>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/member/logoutMember.jsp"/>"
						style="color: rgb(26, 140, 255);">로그아웃</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/products.jsp"/>"
						style="color: rgb(26, 140, 255);">Products</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/member/addProduct.jsp"/>"
						style="color: rgb(26, 140, 255);">상품 등록</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/editProduct.jsp?edit=update"/>"
						style="color: rgb(26, 140, 255);">상품 수정</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/deleteProduct.jsp?edit=delete"/>"
						style="color: rgb(26, 140, 255);">상품 삭제</a>
				</c:when>

				<c:otherwise>
					<li style="padding-top: 7px; color: white">[<%=sessionId%>님]
					</li>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/member/logoutMember.jsp"/>"
						style="color: rgb(26, 140, 255);">로그아웃</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/products.jsp"/>"
						style="color: rgb(26, 140, 255);">Products</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/member/updateMember.jsp"/>"
						style="color: rgb(26, 140, 255);">My page</a>
					<a class="nav-link fw-bold py-1 px-2"
						href="<c:url value="/cart.jsp"/>"
						style="color: rgb(26, 140, 255);">Cart</a>
				</c:otherwise>
			</c:choose>

		</nav>

	</div>
</header>
<div>