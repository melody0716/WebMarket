<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> --%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8");
DecimalFormat dfFormat = new DecimalFormat("###,###"); //숫자를 천단위 구분하게끔...
%>
<html>
<head>
<!-- CDN 방식 = 인터넷이 되는 곳만 허용되기 때문에 파일로 링크 지정 -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
        <div class="container">
            <h1 class="display-4">상품 목록</h1>
        </div>
    </div>
    
<%--     <%
    	ProductRepository dao = ProductRepository.getInstance();
    
    	//상품 목록을 다 가져옴
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%> --%>
    
    <div class="container">
        <div class="row" align="center">
        	<%@ include file = "dbconn.jsp" %> <!-- db연동 부분 -->
                <%
                	/* for(int i=0; i<listOfProducts.size(); i++) {
                		Product product = listOfProducts.get(i); */
                		PreparedStatement pstmt = null;
                		ResultSet rs = null;
                		
                		String sql = "select * from product";
                		//Connection객체로 부터 쿼리문을 주고 prepareStatement 얻음
                		pstmt = conn.prepareStatement(sql);
                		
                		rs = pstmt.executeQuery();
                		
                		while(rs.next()) {
                		
                %>
                <div class="col-md-4">
               <img src="C:\upload\<%= rs.getString("p_filename") %>"
               style="width:100%; padding-bottom:10px">
               
               <h3><%= rs.getString("p_name") %></h3>
               <p><%= rs.getString("p_description") %></p>
               <p><%= dfFormat.format(Integer.parseInt(rs.getString("p_unitPrice"))) %>원</p> 
                    	
<%--                 	<div class="col-md-4">
                		<!-- 경로를 지정해 이미지 출력 -->
       	 				<img src="c:/upload/<%= product.getFilename()%> " 
       	 					style="width: 100%; padding-bottom:20px; padding-top:20px"> 
       	 				<!-- 주석처리 된 부분으로 하게 되면 일반 웹브라우저에서는 적용이 되지 않음
       	 				웹어플리케이션에서 적용이 되려면 상대적 경로로 제시 해주어야 경로가 제대로 인식이 됨 -->
       	 				<img src="${pageContext.request.contextPath}/resources/images/
       	 				<%= product.getFilename() %>" style="width:100%"> 
                    
                    	<h3><%= product.getPname() %></h3>
                    	<p><%= product.getDescription() %></p>
                    	<p><%= product.getUnitPrice() %>원</p>  --%>
                    	<!-- 상품의 아이디에 대한 상세정보 페이지를 연결시키기 위한 코드	 -->	
                    	<p>
                    		<a href="./product.jsp?id=<%= rs.getString("p_id")%>"
                    		class="btn btn-secondary" role="button">상세보기 ></a>
                    	</p>
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
    
    
	
	<%-- <h1><%= greeting %></h1>
	<h3><%= tagline %></h3> --%>
</body>
</html>
