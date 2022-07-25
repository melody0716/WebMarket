<%@ page import="java.sql.* "%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "dbconn.jsp" %>

	<%
		request.setCharacterEncoding("UTF-8");	
		
		//addProduct.jsp에서 사용자가 업로드한 이미지 부분을 받아 저장
		String filename = "";
		
		String realFolder = "C:\\upload";   //웹 어플리케이션에서 절대 경로  -> 대신에 밑에 코드 사용*/
		//사용자가 추가한 상품들의 이미지를 현재 프로젝트의 images폴더로 잡아서 저장을해야
		//진정한 서버의 역할을 함과 동시에, 이미지를 뿌려줄 때 이미지를 가지고 오는 데 문제가 없음
		/* String realFolder = "D:\이정연2022\자바\최종 프로젝트\JSP 강의\WebMarket\WebContent\resources\images"; */
		
		int maxSize = 10 * 1024 * 1024;  //최대 업로드 크기(10M)
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, 
				encType, new DefaultFileRenamePolicy());
		
	
		//addProduct.jsp에서 사용자가 입력한 부분을 받아 저장
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		
		Integer price;
		long stock;
		
		//가격(unitPrice) 입력창에 미 입력 시
		if(unitPrice.isEmpty()) {
			price = 0;  //자동박싱
		} else {
			//String을 숫자로 변환
			price = Integer.valueOf(unitPrice);
		}
		
		//재고 수량(unitsInstock) 입력창에 미 입력 시
		if(unitsInStock.isEmpty()) {
			stock = 0;  //자동박싱
		} else {
			//String을 long 타입으로 변환
			stock = Long.valueOf(unitsInStock);
		}
		System.out.println("1212");
		
		Enumeration<?> files = multi.getFileNames();
		String fname = (String)files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		String sql = "insert into product values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		
		//아래 9개의 사용자로부터 입력받은 데이터를 
		//price, stock은 위에서 따로 지정
		pstmt.setString(1, productId);
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, description);
		pstmt.setString(5, manufacturer);
		pstmt.setString(6, category);
		pstmt.setLong(7, stock);
		pstmt.setString(8, condition);
		pstmt.setString(9, fileName);
		
		pstmt.executeUpdate();
		System.out.println("상품 등록 완료");
		
		//자원해제
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		
		//아래 내용을 DB 삽입 내용으로 바꾸어 줌
		/* ProductRepository dao = ProductRepository.getInstance();
		Product newProduct = new Product(); */
		
		//Product객체에 사용자가 입력한 내용 저장
		/* newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(stock);
		newProduct.setCondition(condition); */
		//이미지 저장 부분
		/* newProduct.setFilename(fileName); */
		
		//ArrayList에 새 상품을 추가하고 있음
		/* dao.addProduct(newProduct); */
		
		//강제로 페이지 이동을 시키고 있음
		response.sendRedirect("products.jsp");
		
		
		
	%>

	
	
	
	
	
	
	
	
	
	
	
	
	