<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
	//세션의 id값을 가져오는 코드
	String cartId = session.getId();
	System.out.println("cart.jsp_session_id : " + cartId);
%>
<meta charset="UTF-8">
<title>관심 목록</title>
</head>
<body>

	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
        <div class="container">
            <h1 class="display-4">관심 목록</h1>
        </div>
    </div>

	<div class="container">
    <div class="row">
        <table style="width: 100%;">
            <tr>
                <td align="left"><a href="./deleteCart.jsp?cartId=<%= cartId %>" class="btn btn-danger">삭제하기</a></td>
                <td align="right"><a href="#" class="btn btn-success">주문하기</a></td>
            </tr>
        </table>
    </div>
    
    <div style="padding-top: 50px">
    <table class="table table-hover">
        <tr>
            <th>상품</th>
            <th>가격</th>
            <th>수량</th>
            <th>소계</th>
            <th>비고</th>
        </tr>
        <%
            int sum=0; 

        	/* 장바구니인 cartlist에 등록된 모든 상품을 가져오도록 session내장객체의 getArribute() 사용 */
        	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
        	
        	/* cart.jsp파일에서 전체상품을 삭제하는 deleteCart.jsp에서 session.invalidate()호출하게 되면
        	carlist는 null이 되기 때문에 적용 */
        	if(cartList == null) {
        		cartList = new ArrayList<Product>();
        	}
        	
        	/* 상품 리스트를 하나씩 출력 */
			for(int i=0; i<cartList.size(); i++){
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum += total;	
        %>
	       	<tr>
	    		<td><%= product.getProductId() %>-<%= product.getPname() %></td>
	    		<td><%= product.getUnitPrice() %></td>
	    		<td><%= product.getQuantity() %></td>
	    		<td><%= total %></td>
	    		<td><a href="./removeCart.jsp?id=<%= product.getProductId()%>" class="badge badge-danger">삭제</a></td>
			</tr>
		<%
        	}
		%>
		<tr>
            <th></th>
            <th></th>
            <th>총액</th>
            <th><%= sum %></th>
            <th></th>
        </tr>
   		</table>
    	<a href="./products.jsp" class="btn btn-secondary">상품 목록 ></a>
	</div>
	<hr>
</div>



    <jsp:include page="footer.jsp" />
    

</body>
</html>