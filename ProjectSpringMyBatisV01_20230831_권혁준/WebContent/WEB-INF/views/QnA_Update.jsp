<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String rv_pd_name = request.getParameter("rv_pd_name");
	String rv_pd_img = request.getParameter("rv_pd_img");
	String rv_writer = request.getParameter("rv_writer");
	String rv_title = request.getParameter("rv_title");
	String rv_content = request.getParameter("rv_content");
	int rv_no = Integer.parseInt(request.getParameter("rv_no"));
	String rv_date = request.getParameter("rv_date");
	String vURL = request.getContextPath() + "/CS_Center.do";
%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">

<head>
  <title>QnA Update</title>
  
  <script>
	function mInit() {
		if ("<%=session.getAttribute("vId") %>" != "<%=rv_writer %>") {
			alert('해당 게시물은 작성자만 수정 및 삭제 가능합니다 !');
			location.href="<%=vURL%>";
			return;
		}
	}
  </script>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/board_DS.css" %>">

  <style>
    .notice {
      background-image: url('<%=request.getContextPath() + "/resources/img/CS_Center_img.PNG"%>');
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
    <form action="<%=request.getContextPath() %>/QnA_Upd_Proc.do" method="post" name="frmRV">
    <input type="hidden" name="rc_pd_img" value="<%=rv_pd_img %>">
    <input type="hidden" name="rv_pd_name" value="<%=rv_pd_name %>">
    <input type="hidden" name="rv_writer" value="<%=session.getAttribute("vId") %>">
    <input type="hidden" name="rv_no" value="<%=rv_no %>">
    <input type="hidden" name="rv_date" value="<%=rv_date %>">
    
      <table>
        <tr>
          <th colspan="2" class="title" style='height: 5%;'><h3>QnA Update</h3></th>
        </tr>

        <tr>
          <td style='width: 90px; height: 10%;'>상품 정보</td>
          <td style='height: 10%;'><img class="info" src=<%=request.getContextPath() + "/resources/img" + "/" + rv_pd_img %>></td>
          <td style='height: 10%;'><%=rv_pd_name %></td>
        </tr>
        <tr>
        
          <td style='height: 10%;'>작성자 정보</td>
          <td colspan="2" style='height: 10%;'><%=session.getAttribute("vId") %></td>
        </tr>
        
        <tr>
          <td style='height: 10%;'>제목</td>
          <td colspan="2" style='height: 10%;'><input type="text" placeholder="필수 입력 항목입니다." name="rv_title" value="<%=rv_title %>"></td>
        </tr>

        <tr>
          <td>내용</td>
          <td colspan="2"><textarea name="rv_content"><%=rv_content %></textarea></td>
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
