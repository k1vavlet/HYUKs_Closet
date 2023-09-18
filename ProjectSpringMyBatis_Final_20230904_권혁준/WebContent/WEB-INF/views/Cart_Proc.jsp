<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('알림 : <%= request.getAttribute("vMsg")%>');
		location.href="<%=request.getContextPath() + "/Cart.do"%>";
	</script>
</body>
</html>