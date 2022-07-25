<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>웹쇼핑몰</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<%
		String greeting = "쇼핑몰에 오신 것을 환영합니다.";
		String tagline = "Welcome to Web Market !";
	%>
	
	<div class="jumbotron">
        <div class="container">
            <h1 class="display-4"><%= greeting %></h1>
        </div>
    </div>
    <div class="container">
        <div class="text-center">
            <h3 ><%= tagline %></h3>
            <%	
            	//refresh로 1초에 한 번씩 시간 갱신
            	response.setIntHeader("Refresh", 01);
            	//접속시간 표시를 위한 코드
            	Calendar calendar = Calendar.getInstance();
            	int hour = calendar.get(Calendar.HOUR_OF_DAY);
            	int minute = calendar.get(Calendar.MINUTE);
            	int second = calendar.get(Calendar.SECOND);
            	int am_pm = calendar.get(Calendar.AM_PM);
            	
            	String ampm = null;
            	
            	if(am_pm == 0) {
            		ampm = "오전";
            	} else {
            		ampm = "오후";
            	}
            	
            	String connectTime = ampm + " " + hour + ":" + minute + ":"  + second;
            	out.println("현재 접속 시간    " + connectTime + "\n");
            %>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
    
    
	
	<%-- <h1><%= greeting %></h1>
	<h3><%= tagline %></h3> --%>
</body>
</html>
