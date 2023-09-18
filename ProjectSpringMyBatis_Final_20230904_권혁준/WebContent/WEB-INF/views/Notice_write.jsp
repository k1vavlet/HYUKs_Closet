<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String pd_name = request.getParameter("pd_name");
	String pd_img = request.getParameter("pd_img");
	String vURL = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">

<head>
  <title>Review Write</title>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/board_DS.css" %>">

  <style>
    .notice {
      background-image: url('<%=request.getContextPath() + "/resources/img/Notice_IMG.PNG"%>');
      background-size: cover;
    }
  </style>
  
  <script>
	function mInit() {
		if ("<%=session.getAttribute("vId") %>" != 'admin') {
			alert('공지사항 작성, 수정, 삭제는 관리자만 접근 가능합니다 !');
			location.href="<%=vURL%>/Notice.do";
			return;
		}
	}
  </script>
</head>

<body onLoad="mInit();">
<div id="wrap">
  <%@include file="./header.jsp" %>

  <center>
    <div class="notice">
    <div class="bg_opac">
    <form action="<%=vURL %>/Notice_write_Proc.do" method="post" name="frmRV">
    <input type="hidden" name="nt_writer" value="<%=session.getAttribute("vId") %>">
    
      <table>
        <tr>
          <th colspan="2" class="title" style='height: 5%;'><h3>Notice Write</h3></th>
        </tr>
        
        <tr>
          <td style=' width: 100px; height: 10%;'>작성자 정보</td>
          <td colspan="2" style='height: 10%;'><%=session.getAttribute("vId") %></td>
        </tr>
        
        <tr>
          <td style='height: 10%;'>제목</td>
          <td colspan="2" style='height: 10%;'><input type="text" placeholder="필수 입력 항목입니다." name="nt_title"></td>
        </tr>

        <tr>
          <td>내용</td>
          <td colspan="2"><textarea name="nt_content"></textarea></td>
        </tr>

        <tr>
          <td colspan="3" style='height: 10%;'>
          	<input type="submit" value="등록">
          </td>
        </tr>
      </table>
      </form>
      </div>
    </div>
  </center>

  <%@include file="./footer.jsp" %>
</div>
</body>



</html>
