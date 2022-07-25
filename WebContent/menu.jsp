<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

	<nav class="navbar navbar-expand navbar-dark bg-dark"> <!-- 네비게이션 바를 만듦 -->
		<div class="container">
			<div class="navbar-header">
                <a class="navbar-brand" href="./welcome.jsp">HOME</a>
            </div>
        <!-- 네비게이션 바의 요소들을 추가등록을 하는 코드 -->
		<div>
			<ul class="navbar-nav mr-auto"> <!-- mr-auto는 마진을 알아서 잡아주는 코드 -->
				<li class="nav-item"><a class="nav-link" href="./products.jsp">상품 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="./addProduct.jsp">상품 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=update">상품 수정</a></li>
				<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=delete">상품 삭제</a></li>		
			</ul>
		</div>
		</div> 
	</nav>