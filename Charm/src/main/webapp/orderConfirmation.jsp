<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
request.setCharacterEncoding("UTF-8");

String cartId = session.getId();

String shipping_cartId = "";
String shipping_name = "";
String shipping_shippingDate = "";
String shipping_country = "";
String shipping_zipCode = "";
String shipping_addressName = "";

Cookie[] cookies = request.getCookies();

if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_cartId"))
	shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_name"))
	shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_shippingDate"))
	shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_country"))
	shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_zipCode"))
	shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		if (n.equals("Shipping_addressName"))
	shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
	}
}
%>
<html>
<head>
<link rel="icon" href="ms-icon-310x310.png" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="description" content="BootStrap Demo" />
<link rel="icon" href="ms-icon-310x310.png" />
<title>귀템 스토어</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link href="./resource/css/headers.css" rel="stylesheet">
<title>주문 정보</title>
</head>
<body style="background-color: rgb(224, 224, 224)">
	<jsp:include page="menu.jsp" />
	<jsp:include page="menu2.jsp" />
	<div class="jumbotron">
		<div class="text-center">
			<h4 class="mx-md-auto mb-0" style="color: rgb(125, 125, 255);">주문확인</h4>
		</div>
		<hr/>
		<br>
	</div>

	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h4>주문정보(영수증)</h4>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 :
				<%
 out.println(shipping_name);
 %>
				<br> 우편번호 :
				<%
				out.println(shipping_zipCode);
				%><br> 주소 :
				<%
				out.println(shipping_addressName);
				%>(<%
				out.println(shipping_country);
				%>)
				<br>
			</div>
			<div class="col-4" align="right">
				<p>
					<em>배송일: <%
					out.println(shipping_shippingDate);
					%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
				%>
				<tr>
					<td class="text-center"><em><%=product.getPname()%> </em></td>
					<td class="text-center"><%=product.getQuantity()%></td>
					<td class="text-center"><%=product.getUnitPrice()%>원</td>
					<td class="text-center"><%=total%>원</td>
				</tr>
				<%
				}
				%>
				<tr>
					<td> </td>
					<td> </td>
					<td class="text-right"><strong>총액: </strong></td>
					<td class="text-center text-danger"><strong><%=sum%>
					</strong></td>
				</tr>
			</table>

			<a href="./ShippingInfo.jsp?cartId=<%=shipping_cartId%>"
				class="btn btn-secondary" role="button"> 이전 </a> <a
				href="./thankCustomer.jsp" class="btn btn-success" role="button">
				주문 완료 </a> <a href="./checkOutCancelled.jsp" class="btn btn-secondary"
				role="button"> 취소 </a>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>