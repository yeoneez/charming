<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Product" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.ProductRepository" %>

<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>

<%-- <%@ page errorPage = "exceptionNoProductId.jsp" %> --%>

<jsp:useBean id = "productDAO" class = "dao.ProductRepository" scope = "session" /> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="./resource/css/headers.css" rel="stylesheet">
<link rel="icon" href="ms-icon-310x310.png"/>
<title>상품 상세 정보</title>

<script type = "text/javascript">

   function addToCart(){
      
      if(confirm("상품을 장바구니에 추가하시겠습니까?")){         
         document.addForm.submit();
      }
      else{
         document.addForm.reset();
      }
   }

</script>
</head>
<body style="background-color:rgb(224, 224, 224)">
   <jsp:include page = "menu.jsp" />
   <jsp:include page = "menu2.jsp" />

   <div class = "jumbotron">
      <div class = "container">
         <p class = "fs-2 text-center">상품 정보</p>
      </div>
   </div>
   
   <div class = "container">
      <div class = "row">    
         <%@ include file = "dbconn.jsp" %>
         
         <%
                        
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            String sql = "select * from product where p_id = ?";
            String id = request.getParameter("id");
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
                     
            while(rs.next()){
         %>         
         <div class="col-md-12">
         	<h5>재고 수 : <%=rs.getLong("p_unitsInStock") %> <h5>
         </div>
         <div class = "col-md-5">
            <img src = "./upload/<%=rs.getString("p_fileName")%>" style = "width: 60%">   
         </div>
         <div class = "col-md-7">
            <h3><%=rs.getString("p_name") %></h3>
            <p><%=rs.getString("p_description") %></p> 
            <p> <b>상품 코드 : </b> <span class = "badge badge-danger"> <%=rs.getString("p_id") %>
            </span>
            <p> <b>분류</b> : <%=rs.getString("p_category") %>
            
            <h4><%=rs.getInt("p_unitPrice") %>원</h4>
            <p> 
               <form name = "addForm" action = "addCart.jsp?id=<%=rs.getString("p_id") %>" method = "post">
               
               <a href = "#" class="btn btn-info" onclick = "addToCart()">상품 주문 &raquo;</a>
               <a href = "cart.jsp" class = "btn btn-warning">장바구니 &raquo;</a>
               <a href = "products.jsp" class = "btn btn-secondary"> 상품 목록 &raquo;</a>
               </form>
         </div>
                
         <%
            }            
            if(rs != null){
               rs.close();
            }            
            if(pstmt != null){
               pstmt.close();
            }            
            if(conn != null){
               conn.close();
            }
         %>       
         
      </div>
      <hr>
   </div>
   
   <jsp:include page = "footer.jsp" />
</body>
</html>