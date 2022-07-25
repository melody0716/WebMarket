<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문</title>
</head>
<body>
	
<%
	/* 전송된 상품  id를 얻고 있음 */
	String id = request.getParameter("id");

	/* 상품 id가 넘어오지 않았을 때 강제로 products.jsp 이동시키고 종료시키는 코드 */
		if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
	
	/* 상품 데이터 접근 클래스의 인스턴스 받아오는 코드 */
		ProductRepository dao = ProductRepository.getInstance();
	
	/* 해당 id값을 이용해서 상품 상세 정보 얻어오는 코드 */
	Product product = dao.getProductById(id);
	//해당 상품이 없을 때 
		if(product == null){
			response.sendRedirect("exceptionNoProductId.jsp");	
	}
	
	/* 모든 상품 가져오는 코드 */
		ArrayList<Product> goodList = dao.getAllProducts();
		Product goods = new Product();
	
	/* 상품 리스트 중에서 사용자 주문을 한 그 상품과 id가 일치하는 코드를 얻어서 product에 대입 */
		for(int i=0; i<goodList.size(); i++){
			goods = goodList.get(i);
			if(goods.getProductId().equals(id)){
				break;
			}
		}
	
	/* 세션 속성의 이름이 cartlist인 세션 정보(장바구니에 담긴 물품 목록)를 가져와서 ArrayList에 대입  */
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	/* cartlist값이 null이라면 새로운 ArrayList를 만들고 세션에 cartlist이름으로 list라는 값을 대입하고 있음 */
		if(list == null) {
			list = new ArrayList<Product>();
			session.setAttribute("cartlist", list);
		}
		
		int cnt = 0;
		Product goodsQnt = new Product();
	
	/* 사용자가 거래한 상품이 장바구니에 이미 담긴 물품인지 검색해서 있다면 수량 증가 시킴 */
	for(int i=0; i<list.size(); i++){
			goodsQnt = list.get(i);
			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuandity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuandity);
			}
		}
	
	/* 사용자가 주문한 상품이 장바구니에 없다면 수량을 1로 바꿔주고 장바구니 역할을 하고 있는 ArrayList에 추가함 */
		if(cnt == 0){
			goods.setQuantity(1);
			list.add(goods);
		} else {
			response.sendRedirect("product.jsp?id=" + id);	
		}

%>
	
	
	
	
	
	
</body>
</html>