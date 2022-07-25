<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 오류</title>  <!-- 페이지가 유효하지 않으면 에러 페이지로 이동시킴 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
        <div class="container">
            <h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
        </div>
    </div>
    
    <div class="container">
    	<!-- 요청 URL을 표식하는 부분 -->
    	<p><%= request.getRequestURL() %>?</p>
    	<p><a href="products.jsp" class="btn btn-secondary">상품 목록 ></a></p>
    </div>
    
    <jsp:include page="footer.jsp" />
	
</body>
</html>