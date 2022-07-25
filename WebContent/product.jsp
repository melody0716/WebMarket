<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="exceptionNoProductId.jsp"%>  <!-- id값이 유효하지 않으면 에러 페이지로 이동시킴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> --%>
<!DOCTYPE html>
<% 
	request.setCharacterEncoding("UTF-8"); 
   	DecimalFormat dfFormat = new DecimalFormat("###,###"); //숫자를 천단위 구분하게끔...		
%>
<html>
<head>
<!-- CDN 방식 = 인터넷이 되는 곳만 허용되기 때문에 파일로 링크 지정 -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>상품 상세 정보</title>

<script type="text/javascript">
	//confirm()함수는 사용자의 선택을 할 때 사용
	function addToCart() {
		if(confirm("해당 상품을 거래하시겠습니까?")){
			document.addForm.submit();
		}
		else {
			document.addForm.reset();
		}
	}
</script>

</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
        <div class="container">
            <h1 class="display-4">상품 목록</h1>
        </div>
    </div>
    
   <%@ include file="dbconn.jsp" %> <!-- db를 연동하는 부분 -->		
		<% 
			//어떤 제품을 편집할지 id값이 넘어오는 것을 받고 있다.
			String productId = request.getParameter("id");
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from product where p_id = ?";
			//Connection객체로 부터 쿼리문를 주고 PreparedStatement를 얻고 있다.
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			
			//쿼리문의 결과를 받아오고 있다.
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
		%>
	
		<div class="container">
			<div class="row">
				<!-- 이미지 추가 -->
				<div class="col-md-5">
					<img src="c:/upload/<%= rs.getString("p_filename") %>"
						 style="width: 100%" />
						 				
				<%-- 	<img src="${pageContext.request.contextPath}/resources/images/<%= product.getFilename() %>" 
						 style="width: 100%">	 --%>			
				</div>
        	
	            <div class="col-md-6">
					<h3><%= rs.getString("p_name") %> </h3>
					<p><%= rs.getString("p_description") %></p>
					<p><b>상품 코드 : </b><span class="badge badge-danger"><%= rs.getString("p_id")%></span></p>
					<p><b>제조사 : </b><%= rs.getString("p_manufacturer")%></p>			
					<p><b>분류 : </b><%= rs.getString("p_category") %></p>
					<p><b>재고 수 : </b><%= dfFormat.format(rs.getLong("p_unitsInStock")) %></p>
					<h4><%= dfFormat.format(rs.getInt("p_unitprice"))%>원</h4>
					
					<p><form name="addForm" action="./addCart.jsp?id=<%= rs.getString("p_id") %>" method="post">
						<!-- 상품 주문을 클릭하면 자바스크립트의 핸들러 함수 addToCart()호출되도록 만들었다. -->
						<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 ></a>
						<!-- 장바구니 버튼을 추가하였다.클릭하면 /cart.jsp로 이동하게 만들어 주었다. -->
						<a href="./cart.jsp" class="btn btn-warning" >장바구니 &raquo;</a>					
						<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
					</form>				
				</div>
				<%
				}
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				%>				
			</div>
	        </div>
	
    

    <jsp:include page="footer.jsp" />
    
    
</body>
</html>