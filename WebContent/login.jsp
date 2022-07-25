<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CDN 방식 = 인터넷이 되는 곳만 허용되기 때문에 파일로 링크 지정 -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<!-- 외부 자바스크립트 파일을 가져오기 위해서 아래와 같이 코드를 입력하도록 함 -->
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<body>
	<jsp:include page="menu.jsp" />
	
	<!-- 점보트론은 대형전광판이라는 의미를 지니고 있는데, 다양한 컴포넌트(텍스트, 이미지, 회사로고 등) 포함 가능 -->
	<div class="jumbotron">
        <div class="container">
            <h1 class="display-4">로그인</h1>
        </div>
    </div>
    
   <div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			
			<%
				/* 로그인 인증에서 실패를 했을 때 작동하는 코드를 아래와 같이 작성함 */
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요!");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<!-- 아이디를 입력하는 부분 -->
				<div class="form_group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" 
					       name='j_username' required autofocus>
				</div>
				<!-- 비밀번호를 입력하는 부분 -->
				<div class="form_group">
					<!-- sr-only클래스는 웹접근성을 위한 코드이며 역할은 Label내용을 숨긴다. -->
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" 
					       name='j_password' required >
				</div>
				<!-- btn-lg버튼 크기, btn-success초록색 버튼 -->
				<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>			
			</form>			
		</div>		
	</div>	
    
    <jsp:include page="footer.jsp" />
</body>
</html>