<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
 
<!DOCTYPE html>
<html lang="en">
<head>
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
</head>
<body>

<div id="wrap">
  <%@include file="./header.jsp" %>

  <center>
    <div class="login">
      <form action="<%=request.getContextPath() + "/FindIDProc.do"%>" method="post">
      <input type="hidden" name="category" value="MemLogin">
      
        <table>
          <tr>
            <th colspan="3">아이디 찾기</th>
          </tr>
          <tr>
            <td>이름</td>
            <td><input type="text" name="name" class="ins"></td>
            <td rowspan="2"><input type="submit" value="FIND" class="btn"></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td><input type="email" name="email" class="ins"></td>
          </tr>
          <tr>
            <td colspan="3">
              <button><a href="<%=request.getContextPath() + "/Find_PW.do"%>">비밀번호 찾기</a></button>
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
