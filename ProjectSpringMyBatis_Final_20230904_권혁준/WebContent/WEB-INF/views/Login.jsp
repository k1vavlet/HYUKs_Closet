<%@page import="com.spring.Member.MemberDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");
	String vURL = request.getContextPath() + "/MemberController.do";
	String js_url = request.getContextPath() + "/PJT/_jQueryLib/jquery-3.7.0.js";
 %>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <script src="<%=js_url%>"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <style>
    .login {
      width: 100%;
      height: 100%;
      background-image: url('<%=request.getContextPath() + "/resources/img/login_img.jpeg"%>');
      background-size: cover;
      padding: 175px 0;
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
  <% MemberDTO dto = new MemberDTO(); %>
  
  <script>
  	function loginChk() {
  		if (document.getElementsByName("id")[0].value == '') {
  	  		alert('아이디를 입력해주세요.');
  	  	}
  	  	else if (document.getElementsByName("pwd")[0].value == '') {
  	  		alert('비밀번호를 입력해주세요.');
  	  	}
  	  	else {
  	  		document.getElementById("Frm").submit();
  	  	}
  	}
  </script>
</head>
<body>

<div id="wrap">
  <%@include file="./header.jsp" %>

  <center>
    <div class="login">
      <form action="<%=request.getContextPath() + "/LoginProc.do"%>" method="post" id="Frm">

        <table>
          <tr>
            <th colspan="3">LOGIN</th>
          </tr>
          <tr>
            <td>ID</td>
            <td><input type="text" name="id" class="ins"></td>
            <td rowspan="2"><input type="button" value="LOGIN" onclick="loginChk()" class="btn"></td>
          </tr>
          <tr>
            <td>PW</td>
            <td><input type="password" name="pwd" class="ins"></td>
          </tr>
          <tr>
            <td colspan="3">
              <button><a href="<%=request.getContextPath() + "/Join.do"%>">회원가입</a></button>
              <button><a href="<%=request.getContextPath() + "/Find_IDPW.do"%>">ID/PW 찾기</a></button>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </center>
  <%@include file="./footer.jsp" %>
</div>
</body>
</html>
