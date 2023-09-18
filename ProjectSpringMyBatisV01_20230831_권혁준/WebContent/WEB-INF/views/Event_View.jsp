<%@page import="com.spring.Notice.EventDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
  <%
	String vUrl = request.getContextPath();
	
	ArrayList<EventDTO> dtoL = (ArrayList<EventDTO>)request.getAttribute("dtoL");
	
	String evt_title, evt_dating, evt_writer, evt_content;
	int evt_no;
%>

<head>
  <title>이벤트 상세보기</title>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/board_DS.css" %>">

  <style>
    .notice {
      background-image: url('<%=request.getContextPath() + "/resources/img/Event_img.PNG"%>');
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
		for (EventDTO i : dtoL) {
			evt_no = i.getEvt_no();
			evt_title = i.getEvt_title();
			evt_dating = i.getEvt_dating();
			evt_writer = i.getEvt_writer();
			evt_content = i.getEvt_content();
   		%>
    <form action="<%=vUrl %>/Event_Upd.do" id="frmUpdDel">
    <input type="hidden" name="category">
    <input type="hidden" name="evt_writer" value="<%=evt_writer%>">
    <input type="hidden" name="evt_content" value="<%=evt_content%>">
    <input type="hidden" name="evt_dating" value="<%=evt_dating%>">
    <input type="hidden" name="evt_title" value="<%=evt_title%>">
    <input type="hidden" name="evt_no" value="<%=evt_no%>">
      <table>
        <tr>
          <td style='width: 10%; height: 10%;'>작성자</td>
          <td style='width: 20%; height: 10%; color: orange;'><%=evt_writer %></td>
          <td style='width: 10%; height: 10%;'>제목</td>
          <td style='width: 80%; height: 10%; color: orange;'><%=evt_title %></td>
        </tr>
        
        <tr>
          <td style='width: 10%; height: 10%;'>행사 기간</td>
          <td style='width: 80%; height: 10%; color: orange;' colspan="3"><%=evt_dating %></td>
        </tr>
        
        <tr>
          <td colspan="4"><textarea readonly><%=evt_content %></textarea></td>
        </tr>

        <tr>
          <td colspan="4" style='height: 10%;'>
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
		frm.action = "<%=request.getContextPath()%>/Event_Upd.do";
		frm.submit();
	}
	else {
		frm.action = "<%=request.getContextPath()%>/Event_Del.do";
		frm.submit();
	}
}
</script>

</html>
