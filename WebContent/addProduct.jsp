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
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<!-- 점보트론은 대형전광판이라는 의미를 지니고 있는데, 다양한 컴포넌트(텍스트, 이미지, 회사로고 등) 포함 가능 -->
	<div class="jumbotron">
        <div class="container">
            <h1 class="display-4">상품 등록</h1>
        </div>
    </div>
    
    <div class="container">
		<div class="text-right">
    		<!-- 로그아웃 버튼 만들기 코드 -->
    		<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
	</div>
    
    <div class="container">
        <!-- class="form-horizontal"은 폼요소들이 수평적으로 배치가 되도록 해줌 -->
        <form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" 
        	method="post" enctype="multipart/form-data">  <!-- 파일 업로드 -->
            <div class="form-group row">
                <!-- 화면 크기가 768px 이상일 때 12컬럼 중 2칸 사용, 반응형으로-->
                <label class="col-sm-2"><b>상품 코드</b></label>
                <div class="col-sm-3">
                	<!-- id 속성을 추가한 것은 유효성 검사를 위해서 이 document에서 자바스크립트 파일에서 참조하기 위함 -->
                    <input type="text" id="productId" name="productId" class="form-control" placeholder="상품 코드를 입력하세요">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2"><b>상품명</b></label>
                <div class="col-sm-3">
                    <input type="text" id="name" name="name" class="form-control" placeholder="상품명을 입력하세요">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2"><b>가격</b></label>
                <div class="col-sm-3">
                    <input type="text" id="unitPrice" name="unitPrice" class="form-control" placeholder="가격을 입력하세요">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2"><b>상세정보</b></label>
                <div class="col-sm-5">
                    <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2"><b>제조사</b></label>
                <div class="col-sm-3">
                    <input type="text" name="manufacturer" class="form-control" placeholder="제조사를 입력하세요">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2"><b>분류</b></label>
                <div class="col-sm-3">
                    <input type="text" name="category" class="form-control" placeholder="분류를 입력하세요">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2"><b>재고 수</b></label>
                <div class="col-sm-3">
                    <input type="text" id="unitsInStock" name="unitsInStock" class="form-control" placeholder="재고 수를 입력하세요">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="col-sm-2"><b>상태</b></label>
                <div class="col-sm-5">
                    <input type="radio" name="condition" value="New"> 신규 제품 &nbsp;
                    <input type="radio" name="condition" value="Old"> 중고 제품 &nbsp;
                    <input type="radio" name="condition" value="Refurbished"> 재생 상품 &nbsp;
                </div>
            </div>
            
            <!-- 상품 이미지 업로드 부분 -->
            <div class="form-group row">
                <label class="col-sm-2"><b>이미지</b></label>
                <div class="col-sm-3">
                    <input type="file" name="productImage" class="form-control">
                </div>
            </div>
            
            <div class="form-group row">
            	<!-- offset : col의 2만큼 띄워라 -->
                <div class="col-sm-offset-2 col-sm-10">
                	<!-- 타입을 submit에서 button으로 바꾸는 이유는 submit 타입은 유효성 검사하다 오류가 발생해도
                	action 속성 값으로 페이지 이동이 일어나기 때문 -->
                    <input type="button" class="btn btn-primary" value="등록" 
                    onclick="CheckAddProduct()">
                </div>
            </div>
            
        </form>
    </div>
    
    <jsp:include page="footer.jsp" />
    
</body>
</html>