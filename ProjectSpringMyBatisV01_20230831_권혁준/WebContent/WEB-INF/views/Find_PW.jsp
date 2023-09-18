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
      <form action="<%=request.getContextPath() + "/Find_PW_Proc.do"%>" method="post">
      
        <table>
          <tr>
            <th colspan="3">비밀번호 찾기</th>
          </tr>
          <tr>
            <td>아이디</td>
            <td><input type="text" name="id" class="ins"></td>
            <td rowspan="3"><input type="submit" value="FIND" class="btn"></td>
          </tr>
          <tr>
            <td>이름</td>
            <td><input type="text" name="name" class="ins"></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td><input type="email" name="email" class="ins"></td>
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
