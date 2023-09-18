<%@page import="com.spring.Notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
  <%
	String vUrl = request.getContextPath();
	
	ArrayList<NoticeDTO> dtoL = (ArrayList<NoticeDTO>)request.getAttribute("dtoL");
	
	String nt_title, nt_date, nt_writer, nt_content;
	int nt_no;
%>

<head>
  <title>공지사항 상세보기</title>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/board_DS.css" %>">
  
  <style>
    .notice {
      background-image: url('<%=request.getContextPath() + "/resources/img/Notice_IMG.PNG"%>');
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
		for (NoticeDTO i : dtoL) {
			nt_no = i.getNt_no();
			nt_title = i.getNt_title();
			nt_date = i.getNt_date();
			nt_writer = i.getNt_writer();
			nt_content = i.getNt_content();
   		%>
    <form action="<%=vUrl %>/NoticeUpd.do" id="frmUpdDel">
    <input type="hidden" name="nt_writer" value="<%=nt_writer%>">
    <input type="hidden" name="nt_content" value="<%=nt_content%>">
    <input type="hidden" name="nt_title" value="<%=nt_title%>">
    <input type="hidden" name="nt_no" value="<%=nt_no%>">
      <table>
        <tr>
          <td style='width: 20%; height: 10%;'><%=nt_writer %></td>
          <td style='width: 80%; height: 10%;'><%=nt_title %></td>
        </tr>
        
        <tr>
          <td colspan="2"><textarea readonly><%=nt_content %></textarea></td>
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
		frm.action = "<%=vUrl %>/NoticeUpd.do";
		frm.submit();
	}
	else {
		frm.action = "<%=vUrl %>/NoticeDel.do";
		frm.submit();
	}
}
</script>

</html>
