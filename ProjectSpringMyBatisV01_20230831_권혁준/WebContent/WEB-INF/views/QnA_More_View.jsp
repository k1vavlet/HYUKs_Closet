<%@page import="com.spring.Product.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
  <%
	String vUrl = request.getContextPath();
	
	ArrayList<QnADTO> dtoL = (ArrayList<QnADTO>)request.getAttribute("dtoS");
	
	String rv_pd_name, rv_pd_img, rv_title, rv_date, rv_writer, rv_content;
	int rv_no;
%>

<head>
  <title>상품 문의</title>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/board_DS.css" %>">

  <style>
    .notice {
      background-image: url('<%=request.getContextPath() + "/resources/img/CS_Center_img.PNG"%>');
      background-size: cover;
    }
  </style>
</head>

<body>
<div id="wrap">
  <%@include file="./header.jsp" %>

  <center>
    <div class="notice">
    <div class="bg_opac">
      <%
		for (QnADTO i : dtoL) {
			rv_no = i.getQna_no();
			rv_pd_name = i.getQna_pd_name();
			rv_pd_img = i.getQna_pd_img();
			rv_title = i.getQna_title();
			rv_date = i.getQna_date();
			rv_writer = i.getQna_writer();
    		rv_content = i.getQna_content();
   		%>
    <form action="<%=vUrl %>/CS_Center.do" id="frmUpdDel">
    <input type="hidden" name="rv_pd_name" value="<%=rv_pd_name%>">
    <input type="hidden" name="rv_pd_img" value="<%=rv_pd_img%>">
    <input type="hidden" name="rv_writer" value="<%=rv_writer%>">
    <input type="hidden" name="rv_content" value="<%=rv_content%>">
    <input type="hidden" name="rv_title" value="<%=rv_title%>">
    <input type="hidden" name="rv_no" value="<%=rv_no%>">
      <table>
        <tr>
          <td style='width: 30%; height: 20%;'><img class="info" src="<%=request.getContextPath() + "/resources/img/" + rv_pd_img%>"></td>
          <td style='width: 70%; height: 20%;'><%=rv_pd_name %></td>
        </tr>

        <tr>
          <td style='width: 20%; height: 10%;'><%=rv_writer %></td>
          <td style='width: 80%; height: 10%;'><%=rv_title %></td>
        </tr>
        
        <tr>
          <td colspan="2"><textarea><%=rv_content %></textarea></td>
        </tr>

        <tr>
          <td colspan="2" style='height: 10%;'>
          	<input type="button" value="수정" onclick="mUpdDel('Upd')">
          	<input type="button" value="삭제" onclick="mUpdDel('Del')">
          </td>
        </tr>
      </table>
      </form>
        <%
	      }
		%>
      </div>
    </div>
  </center>

  <%@include file="./footer.jsp" %>
</div>
</body>

<script>
var frm = document.getElementById("frmUpdDel");

function mUpdDel(val) {
	if (val == 'Upd') {
		frm.action = "<%=vUrl%>/QnA_Upd.do";
		frm.submit();
	}
	else {
		frm.action = "<%=vUrl%>/QnA_Del.do";
		frm.submit();
	}
}
</script>

</html>
