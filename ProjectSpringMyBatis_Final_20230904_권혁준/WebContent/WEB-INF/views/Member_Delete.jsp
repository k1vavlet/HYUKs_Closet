<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
 
<!DOCTYPE html>
<html lang="en">
<head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String vURL = request.getContextPath() + "/MemberController.do";
 	String js_url = request.getContextPath() + "/resources/_jQueryLib/jquery-3.7.0.js";
 %>
<script src="<%=js_url%>"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <style>
    body {
      display: flex;
    }

    #wrap {
      width: 1200px;
      height: 360px;
      margin: auto;
      padding: 0;
    }

    .login {
      width: 100%;
      height: 100%;
      background-image: url('<%=request.getContextPath() + "/resources/img/login_img.jpeg"%>');
      background-size: cover;
      padding: 100px 0;
    }

    table {
      width : 40%;
      height : 230px;
      color :white;
      background-color: rgba(0, 0, 0, 0.7);
    }

    input.ins {
      width: 100%;
      height: 100%;
      font-size: 20px;
      border-radius: 10px;
    }

    input.btn {
      width: 100%;
      height: 100%;
      font-size: 15px;
      border-radius: 10px;
      background-color:cornflowerblue;
      color: white;
      cursor: pointer;
    }

    button {
      width : 220px;
      height: 100%;
      font-size: 15px;
      border-radius: 10px;
      background-color:cornflowerblue;
      color: white;
      cursor: pointer;
    }

    tr > td {
      padding : 10px;
      text-align: center;
    }

    th {
      font-size: 25px;
      color:orange;
    }

    button > a {
      text-decoration: none;
      color :white;
    }
  </style>
  
  <script>
   function delChk() {
	   if (document.getElementsByName("id")[0].value == null) {
		   alert('회원탈퇴를 진행할 수 없습니다.');
	   }
	   else if (document.getElementsByName("pwd")[0].value == '') {
		   alert('비밀번호를 입력해주세요.');
	   }
	   else {
		   document.getElementById("DelFrm").submit();
	   }
   }
  </script>
</head>
<body>

<div id="wrap">
  <%@include file="./header.jsp" %>
  <center>
    <div class="login">
      <form action="<%=request.getContextPath() + "/MemDelProc.do"%>" method="post" id="DelFrm">
      
        <table>
          <tr>
            <th colspan="3">회원탈퇴</th>
          </tr>
          <tr>
            <td>ID</td>
            <td><input type="text" name="id" class="ins" value="<%=session.getAttribute("id") %>"></td>
            <td rowspan="2"><input type="button" value="COMMIT" class="btn" onclick="delChk()"></td>
          </tr>
          <tr>
            <td>PW</td>
            <td><input type="password" name="pwd" class="ins"></td>
          </tr>
          <tr>
            <td colspan="3">
            </td>
          </tr>
        </table>
      </form>
    </div>
  </center>
  <%-- <%@include file="./footer.jsp" %> --%>
  <jsp:include page="./footer.jsp"></jsp:include>
</div>
</body>
</html>
