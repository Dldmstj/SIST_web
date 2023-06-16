<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="frontWeb.A05_MemberDao"
    import="frontWeb.vo.ShMember"
    %>
<%
A05_MemberDao dao = new A05_MemberDao();
// ?inputId==@@@&inputpw=@@@
String id = request.getParameter("inputId");
String pw = request.getParameter("inputpw");

ShMember mem = dao.login(id, pw);
boolean isSuccess = mem!=null;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			var isSuccess = <%=isSuccess%>;
			if(isSuccess){
				alert("로그인 성공")
			}else{
				alert("로그인 실패")
				location.href="a04_login.html"
			}
		</script>
	</head>
	<body>
	
		<h1>서버로 온 데이터</h1>
		<!-- 서버에서 요청값을 받아, 자바 데이터 + html코드를 합쳐 다시 client에 전송 처리 -->
		<h2>로그인한 아이디: ${param.inputId}</h2>
		<h2>로그인한 패스워드: ${param.inputPw}</h2>
	</body>
</html>