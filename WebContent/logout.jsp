<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<!-- 로그인 인증 실패하면 error 값이 1로 설정되어 다시 로그인 페이지로 이동 -->
	<% 
		session.invalidate();  //모든 사용자를 삭제함.
		response.sendRedirect("addProduct.jsp");		
	%>
</body>
</html>