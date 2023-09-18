<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<script>
		alert('알림 : <%=request.getAttribute("vMsg")%>');
		location.href="<%=request.getContextPath() + "/Index.do"%>";
	</script>
	
	<%
	 request.setAttribute("su", request.getAttribute("su"));
	%>
	
	<form action="/Servlet_PJT/PJT/header.jsp">
		<input type="hidden" name="isLogin" value="<%=request.getAttribute("su") %>>">
	</form>
</body>
</html>