<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<%
request.setCharacterEncoding("UTF-8");

String vId = (String)request.getAttribute("vId");
String result = (String)request.getAttribute("result");

if(result.equals("OK")){
	//로그인 성공
	session.setAttribute("id", vId);
	response.sendRedirect(request.getContextPath() + "/Index.do");
	
} else {%>
<script>
	alert('로그인에 실패하였습니다');
	
	location.href='<%=request.getContextPath() + "/Login.do"%>';
</script>
<% } %>