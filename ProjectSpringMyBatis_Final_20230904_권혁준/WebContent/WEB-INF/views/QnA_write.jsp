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
  <title>QnA Write</title>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/board_DS.css" %>">

  <style>
    .notice {
      background-image: url('<%=request.getContextPath() + "/resources/img/Shopping_mall_silde003.PNG"%>');
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
    <form action="<%=vURL %>/QnA_write_Proc.do" method="post" name="frmRV">
    <input type="hidden" name="rc_pd_img" value="<%=pd_img %>">
    <input type="hidden" name="rv_pd_name" value="<%=pd_name %>">
    <input type="hidden" name="rv_writer" value="<%=session.getAttribute("vId") %>">
    
      <table>
        <tr>
          <th colspan="2" class="title" style='height: 5%;'><h3>QnA Write</h3></th>
        </tr>

        <tr>
          <td style='width: 90px; height: 10%;'>상품 정보</td>
          <td style='height: 10%;'><img class="info" src=<%=request.getContextPath() + "/resources/img" + "/" + pd_img %>></td>
          <td style='height: 10%;'><%=pd_name %></td>
        </tr>
        <tr>
        
          <td style='height: 10%;'>작성자 정보</td>
          <td colspan="2" style='height: 10%;'><%=session.getAttribute("vId") %></td>
        </tr>
        
        <tr>
          <td style='height: 10%;'>제목</td>
          <td colspan="2" style='height: 10%;'><input type="text" placeholder="필수 입력 항목입니다." name="rv_title"></td>
        </tr>

        <tr>
          <td>내용</td>
          <td colspan="2"><textarea name="rv_content"></textarea></td>
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

<script>
</script>

</html>
