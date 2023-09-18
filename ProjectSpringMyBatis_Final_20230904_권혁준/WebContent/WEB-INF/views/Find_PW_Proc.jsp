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
String href = "";
String vMsg = "";

for (int i = 0; i < list.size(); i++) {
	dto = list.get(i);
	id = dto.getId();
}

if (list.size() != 0) {
	vMsg = id + "비밀번호 변경 화면으로 이동합니다.";
	href = request.getContextPath() + "/New_Setting_PWD.do";
}
else {
	vMsg = id + "회원 내역이 존재하지 않습니다.";
	href = request.getContextPath() + "/Index.do";
}

request.setAttribute("vId", id);

%>

</head>
<body>
<form action="<%=href%>" id="Frm">
 <input type="hidden" name="vId" value="<%= id%>">
</form>
	<script>
		document.getElementById("Frm").submit();
		alert('<%=vMsg %>');
	</script>
</body>
</html>