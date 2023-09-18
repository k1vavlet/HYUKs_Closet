<%@page import="com.spring.Member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
ArrayList<MemberDTO> list = (ArrayList)request.getAttribute("dtoL");
MemberDTO dto = new MemberDTO();
String id = "";

for (int i = 0; i < list.size(); i++) {
	dto = list.get(i);
	
	id = dto.getId();
}
%>


</head>
<body>
	<script>
		alert('알림 : 회원님의 아이디는 <%= id%> 입니다.');
		location.href = '<%=request.getContextPath() + "/Login.do"%>';
	</script>
</body>
</html>