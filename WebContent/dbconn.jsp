<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = null;

	try{
		String url = "jdbc:mysql://localhost:3306/webmarketdb";
		String user = "root";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");  //드라이버명
		conn = DriverManager.getConnection(url, user, password); //연결객체를 얻고 있다.		
		System.out.println("데이터베이스 연결이 되었습니다.");
	
	}catch(SQLException e){
		System.out.println("데이터베이스 연결을 실패했습니다.");
		System.out.print("예외 이유 : ");
		e.printStackTrace();
	}

%>