<%@page import="com.spring.Product.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<script type="text/javascript">
		alert('로그아웃 되었습니다.');
		<%
			CartDAO dao = new CartDAO();
			dao.cartAllDel();
		%>
		location.href="<%=request.getContextPath() + "/Index.do"%>";
	</script>
</body>
</html>