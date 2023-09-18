<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String nt_writer = request.getParameter("nt_writer");
	String nt_title = request.getParameter("nt_title");
	String nt_content = request.getParameter("nt_content");
	int nt_no = Integer.parseInt(request.getParameter("nt_no"));
	String nt_date = request.getParameter("nt_date");
	String vURL = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">

<head>
  <title>Notice Update</title>
  
  <script>
	function mInit() {
		if ("<%=session.getAttribute("vId") %>" != "<%=nt_writer %>") {
			alert('공지사항 작성, 수정, 삭제는 관리자만 접근 가능합니다 !');
			location.href="<%=request.getContextPath()%>/Notice.do";
			return;
		}
	}
  </script>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/board_DS.css" %>">

  <style>
    .notice {
      background-image: url('<%=request.getContextPath() + "/resources/img/Notice_IMG.PNG"%>');
      background-size: cover;
    }
  </style>
</head>

<body onLoad="mInit()">

<div id="wrap">
  <%@include file="./header.jsp" %>

  <center>
    <div class="notice">
    <div class="bg_opac">
    <form action="<%=vURL %>/Notice_Upd_Proc.do" method="post" name="frmRV">
    <input type="hidden" name="nt_writer" value="<%=session.getAttribute("vId") %>">
    <input type="hidden" name="nt_no" value="<%=nt_no %>">
    <input type="hidden" name="nt_date" value="<%=nt_date %>">
    
      <table>
        <tr>
          <th colspan="2" class="title" style='height: 5%;'><h3>Notice Update</h3></th>
        </tr>
        
        <tr>
        
          <td style='width: 100px; height: 10%;'>작성자 정보</td>
          <td colspan="2" style='height: 10%;'><%=session.getAttribute("vId") %></td>
        </tr>
        
        <tr>
          <td style='height: 10%;'>제목</td>
          <td colspan="2" style='height: 10%;'><input type="text" placeholder="필수 입력 항목입니다." name="nt_title" value="<%=nt_title %>"></td>
        </tr>

        <tr>
          <td>내용</td>
          <td colspan="2"><textarea name="nt_content"><%=nt_content %></textarea></td>
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
