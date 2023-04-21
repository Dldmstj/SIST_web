<%@page import="frontWeb.Person"%> <!-- Person 클래스 import -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- 
	 	The superclass "javax.servlet.http.HttpServlet",
	 	determined from the Dynamic Web Module facet version (4.0),
	 	was not found on the Java Build Path
	 		프로젝트 properties -> project facets -> dynamic ... virsion 5.0 으로 변경
 	--> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<%
		Person p01 = new Person();
		p01.name = "마길동";
		p01.age = 25;
		p01.loc = "서울 강남";
		String name = "홍길동";
	%>	<!-- 자바 코드 -->
	
	<body>
		<h2>안녕하세용 <%=name %></h2>
		<h2>안녕하세용 <%=p01.name %></h2>
		<h2>안녕하세용 <%=p01.age %></h2>
		<h2>안녕하세용 <%=p01.loc %></h2>
	</body>
</html>