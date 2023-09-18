<%@page import="com.spring.Product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
  <%
	String vUrl = request.getContextPath();
	
	ArrayList<ProductDTO> dtoL = (ArrayList<ProductDTO>)request.getAttribute("dtoS");
	
	String snum, name, price, img, info_img, category;
   	int many;
%>

<head>
  <title>상품 정보</title>

  <style>
    .notice {
      width: 100%;
      background-image: url('<%=request.getContextPath() + "/resources/img/Outer_img.PNG"%>');
      background-size: 100% 100%;
      height : 700px;
    }

    table {
      width: 90%;
      height: 630px;
      padding: 35px 0;
      display: grid;
      overflow: scroll;
    }

    tr, th {
      height: auto;
      border-bottom: 2px solid white;
      color: orange;
      font-weight: bold;
    }

    tr > td {
      height: auto;
      padding : 5px;
      text-align: center;
      color : white;
      border-bottom: 2px solid white;
    }

    .title {
      text-align: left;
      font-size: 20px;
      border: 0px solid;
      padding: 10px;
    }
    
    .bg_opac {
      background-color: rgba(0, 0, 0, 0.7);
      padding: 40px 0;
    }
    
    .product_img {
    	width: 100px;
    	height : 100px;
    }
    
    .introduce_img {
    	width: 1400px;
    	height : 100%;
    }
    
    input[type="submit"], input[type="button"] {
    	font-size : 20px;
    	color : #FFF;
    	background-color : pink;
    	border : 0px;
    	padding : 10px;
    	cursor : pointer;
    	border-radius : 10px;
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
		for (ProductDTO i : dtoL) {
			snum = i.getSnum();
    		name = i.getName();
    		price = i.getPrice();
    		many = i.getMany();
    		img = i.getImg();
    		info_img = i.getInfo_img();
    		category = i.getCategory();
   		%>
    <form action="<%=vUrl %>/Review_write.do" id="Frm">
    <input type="hidden" name="category" value="Review_write">
    <input type="hidden" name="pd_name" value="<%=name%>">
    <input type="hidden" name="pd_img" value="<%=img%>">
    <input type="hidden" name="pd_price" value="<%=price%>">
      <table>
        <tr>
          <th colspan="2" class="title" style='height: 5%;'><h3><%=snum + " " + name %></h3></th>
        </tr>

        <tr>
          <td style='width: 30%; height: 20%;'><img class="product_img" src="<%=request.getContextPath() + "/resources/img/" + img%>"></td>
          <td style='width: 70%; height: 20%;'><%=price %></td>
        </tr>

        <tr>
          <td colspan="2"><img class="introduce_img" src="<%=request.getContextPath() + "/resources/img/" + info_img%>"></td>
        </tr>

        <tr>
          <td colspan="2" style='height: 10%;'>
          	<input type="button" value="리뷰 작성" onclick="mChange_Review()">
          	<input type="button" value="상품문의" onclick="mChange_QNA()">
          	<input type="button" value="장바구니 추가" onclick="mChange_cart()">
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
	function mChange_Review() {
		if (<%=session.getAttribute("id") == null%>) {
			alert('로그인이 필요한 서비스입니다.');
			return;
		}
		document.getElementById("Frm").submit();
	}
	
	function mChange_QNA() {
		if (<%=session.getAttribute("id") == null%>) {
			alert('로그인이 필요한 서비스입니다.');
			return;
		}
		document.getElementById("Frm").action = "<%=vUrl %>/QnA_write.do";
		document.getElementById("Frm").submit();
	}
	
	function mChange_cart() {
		if (<%=session.getAttribute("id") == null%>) {
			alert('로그인이 필요한 서비스입니다.');
			return;
		}
		document.getElementById("Frm").action = "<%=vUrl %>/Cart_Add.do";
		document.getElementById("Frm").submit();
	}
</script>
</html>
