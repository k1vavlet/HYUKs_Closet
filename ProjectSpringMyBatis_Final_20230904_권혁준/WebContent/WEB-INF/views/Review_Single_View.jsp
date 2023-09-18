<%@page import="com.spring.Product.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
  <%
	String vUrl = request.getContextPath();
	
	ArrayList<ReviewDTO> dtoL = (ArrayList<ReviewDTO>)request.getAttribute("dtoS");
	
	String rv_pd_name, rv_pd_img, rv_title, rv_date, rv_writer, rv_content;
	int rv_no;
%>

<head>
  <title>리뷰 상세보기</title>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/board_DS.css" %>">

  <style>
    .notice {
      background-image: url('<%=request.getContextPath() + "/resources/img/index_img.jpeg"%>');
      background-size: 100%;
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
		for (ReviewDTO i : dtoL) {
			rv_no = i.getRv_no();
			rv_pd_name = i.getRv_pd_name();
			rv_pd_img = i.getRv_pd_img();
			rv_title = i.getRv_title();
			rv_date = i.getRv_date();
			rv_writer = i.getRv_writer();
    		rv_content = i.getRv_content();
   		%>
    <form action="<%=vUrl %>/ProductController.do" id="frmUpdDel">
    <input type="hidden" name="category">
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
          <td colspan="2"><textarea readonly><%=rv_content %></textarea></td>
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
		frm.action = "<%=request.getContextPath()%>/Review_Upd.do";
		frm.submit();
	}
	else {
		frm.action = "<%=request.getContextPath()%>/Review_Del.do";
		frm.submit();
	}
}
</script>

</html>
