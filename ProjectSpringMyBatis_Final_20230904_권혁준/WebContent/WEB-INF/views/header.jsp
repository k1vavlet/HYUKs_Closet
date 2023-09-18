<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String printing = "";
 	String printing02 = "";
 	String url_id = "";
 	String url_id2 = "";
 	try {
 		if (session.getAttribute("id").equals("")) {
 	 		printing = "로그인";
 	 		printing02 = "회원가입";
 	 		url_id = request.getContextPath() + "/Login.do";
 	 		url_id2 = request.getContextPath() + "/Join.do";
 	 	}
 	 	else {
 	 		printing = "로그아웃";
 	 		printing02 = "마이페이지";
 	 		url_id = request.getContextPath() + "/Logout.do";
 	 		url_id2 = request.getContextPath() + "/MyPage.do";
 	 	}
 	} catch(NullPointerException e) {
 		printing = "로그인";
	 	printing02 = "회원가입";
	 	url_id = request.getContextPath() + "/Login.do";
	 	url_id2 = request.getContextPath() + "/Join.do";
 	} 
 	
 	session.setAttribute("vId", session.getAttribute("id"));
 %>
<!DOCTYPE html>
<html lang="en">
  <meta charset="UTF-8">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/index_ds.css" %>">
  
  <style>
  	.Search {
  		width: 300px;
  		height: 100px;
  	}
  </style>
</head>

<body>
  <div id="First" class="destination"></div>
  <header>

    <nav>
      <ul class="menu">
        <li><a href=<%=request.getContextPath() + "/Index.do"%>><img class="logo_size" src=<%=request.getContextPath() + "/resources/img/Site_Logo.png"%>></a></li>

        <li><a href="<%=request.getContextPath() + "/Notice.do"%>">NOTICE</a></li>

        <li class="dropdown">
          <a href="#" class="dropbtn">PRODUCT</a>
          <div class="dropdown-content">
            <a href="<%=request.getContextPath() + "/Outer.do"%>">OUTER</a>
            <a href="<%=request.getContextPath() + "/Top.do"%>">TOP</a>
            <a href="<%=request.getContextPath() + "/Bottom.do"%>">BOTTOM</a>
            <a href="<%=request.getContextPath() + "/Shoes.do"%>">SHOES</a>
            <a href="<%=request.getContextPath() + "/Acc.do"%>">ACC</a>
          </div>
        </li>

        <li class="dropdown">
          <a href="#" class="dropbtn">RANKING</a>
          <div class="dropdown-content">
            <a href="<%=request.getContextPath() + "/BEST_item.do"%>">BEST ITEM</a>
            <a href="<%=request.getContextPath() + "/NEW_item.do"%>"> NEW ITEM</a>
          </div>
        </li>

        <li><a href="<%=request.getContextPath() + "/Event.do"%>">EVENT</a></li>

        <li><a href="<%=request.getContextPath() + "/CS_Center.do"%>">CS CENTER</a></li>
        
        <li><a href="<%=request.getContextPath() + "/Review.do"%>">REVIEW</a></li>
        
        <li>
    	<form action="<%=request.getContextPath()%>/Search_Result.do" style="margin: 0px; padding-left: 35px; padding-top: 7px;">
    		
    		<label for="searching" style="color: #FFF; font-weight: bold;">상품명 검색</label>
    		<input type="search" name="pd_topic" id="searching" style='font-size: 13px; width: 200px; padding: 6px 10px; border-radius: 10px;' placeholder="입력 후 Enter키 클릭">
    		<!-- <input type="submit" value="검색" style='border: 0px; background-color: orange; color: #FFF; padding: 3px; font-size: 15px; border-radius: 10px;'> -->
    	</form>
        </li>
      </ul>
    </nav>

    <div class="Star_Function" align="right">
      <a href="#" class="link_cust">접속자 : <%=session.getAttribute("id") %></a>
      <a href="<%=url_id%>" class="link_cust" target="_top" id="ID_Link"><%=printing %></a>
      <a href="<%=url_id2%>" class="link_cust" id="ID_Link2"><%=printing02 %></a>
      <a href="<%=request.getContextPath() + "/Cart.do"%>" class="link_cust">장바구니</a>

    </div>
  </header>
</body>

<script>
 let id = document.getElementById("ID_Link");
 let id2 = document.getElementById("ID_Link2");
 
 if (id.innerText == "로그아웃") {
	 id.href = <%=request.getContextPath() + "/Logout.do"%>;
	 id02.href = <%=request.getContextPath() + "/MyPage.do"%>;
 }
 else {
	 id.href = <%=request.getContextPath() + "/Logout.do"%>;
	 id02.href = <%=request.getContextPath() + "/MemJoin.do"%>;
 }
</script>
</html>
