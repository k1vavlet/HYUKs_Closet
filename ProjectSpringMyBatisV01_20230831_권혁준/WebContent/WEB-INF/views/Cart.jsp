<%@page import="com.spring.Product.CartDAO"%>
<%@page import="com.spring.Product.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");

	String vURL = request.getContextPath() + "/Cart.do";
 	String vUrl = request.getContextPath();

	String vFileDir = "/PJT";
	String vFile = "/Product_List_ds.css?after";
 	
	String vImgDir = "/PJT/img";
	
	ArrayList<CartDTO> dtoL = (ArrayList<CartDTO>)request.getAttribute("dtoST");
	CartDAO dao = new CartDAO();
 %>
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">

<head>
    <title>SHOPPING CART LIST</title>
</head>

<style>
    section {
        width: 100%;
        height : 700px;
        background-image: url('<%=request.getContextPath() + "/resources/img/Cart_img.PNG"%>');
        background-size: cover;
    }

    .notice {
    	display: block;
        color: orange;
        width: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        padding: 40px 0px;
        float: left;
    }

    table {
    	display: block;
        width: 90%;
        height: 450px;
        padding: 20px 30px;
        color: beige;
        overflow: scroll;
    }
    
    tbody {
    	margin: auto;
    	padding: 0;
    }

    tr, th {
	    width: 1000px;
        height: auto;
        margin: 5px 0px;
        border-bottom: 2px solid beige;
    }

    th {
        color: orange;
    }

    tr > td {
        width: auto;
        height: auto;
        text-align: center;
        border-bottom: 2px solid beige;
        padding: 5px;
    }

    .title {
        text-align: left;
        font-size: 20px;
        border: 0px solid;
        padding: 10px;
    }

    img.cart_img {
        width: 100px;
        height: 100px;
    }

    .cart_idx {
        width: 10%;
    }

    .img_td {
        width: 80px;
        height: 80px;
        text-align: center;
    }

    .cart_info {
        text-align: left;
        width: 400px;
    }

    .cart_info_option {
        text-align: left;
        width: 250px;
    }

    .cart_row_price {
        font-weight: bold;
        width: 100px;
    }

    .btn {
        width: 150px;
        height: 100%;
        font-size: 15px;
        border: 0px;
        background-color: cornflowerblue;
        color: white;
        cursor: pointer;
        padding: 10px 0px;
    }
</style>

<script>
	function mInit() {
		if (<%=session.getAttribute("id") == null%>) {
			alert('로그인이 필요한 서비스입니다.');
			location.href="<%=request.getContextPath()%>/Index.do";
		}
	}
</script>

<body onLoad="mInit()">
<div id="wrap">
    <%@include file="./header.jsp" %>

    <section>
        <div class="notice">
            <h1>&nbsp;&nbsp;&nbsp;&nbsp;SHOPPING CART (MAXIMUM 10 Items)</h1>

            <center>
                <form action="<%=vURL %>" method="post" id="Frm" name="gueFrm">
				<input type="hidden" name="cr_name">
				<input type="hidden" name="cr_img">
				<input type="hidden" name="cr_price">
				<input type="hidden" name="category" value="Buy_Item">
        
			      <table>
				      <tbody>
				        <tr>
				          <th>CHECK</th>
				          <th>이미지</th>
				          <th>상품명</th>
				          <th>가격</th>
				        </tr>
				        
				        <%
						   if (dtoL == null) {
							   response.sendRedirect(vURL);
							   dtoL = (ArrayList)request.getAttribute("dtoST");
						   }
						   else if (dtoL != null) {
							   
							   String cr_name, cr_img, cr_price;
							   
							   if (dtoL != null && dtoL.size() != 0) {
								   for (int idx = 0; idx < dtoL.size(); idx++) {
										
										CartDTO dto = dtoL.get(idx);
										
										cr_name = dto.getCr_name();
										cr_img = dto.getCr_img();
										cr_price = dto.getCr_price();
						   %>
						   
				        <tr style='cursor: pointer;' onclick="valSend('<%=cr_name%>', '<%=cr_img%>', '<%=cr_price%>'')">
				          <td class="cart_idx"><input type="checkbox" name="cart_idx_num" value="<%=cr_name %>"></td>
				          <td class="img_td"><img class="cart_img" src="<%=request.getContextPath() + "/resources/img/" + cr_img %>"></td>
				          <td class="cart_info"><%=cr_name %></td>
				          <td class="cart_row_price"><%=cr_price %></td>
				        </tr>
				        
					        <%
					      	}
							   }
							   
							   else {
							%>
						<tr>
							<td class="cart_idx" colspan="4"><br>장바구니에 상품이 없습니다.<br>♥</td>
						</tr>
							<%
							 	}
							 }
						   %>
				        <tr>
				        	<td colspan="4">
				                 <input type="submit" class="btn" value="상품주문">
				                 <input type="reset" class="btn" value="전체선택 해제">
				                 <input type="button" class="btn" value="선택 삭제" onclick="mChange_DelList()">
				            </td>
				        </tr>
				        </form>
				        </tbody>
			      </table>
            </center>
        </div>
    </section>

    <%@include file="./footer.jsp" %>
</div>
</body>

<script>
	function mChange_DelList() {
		document.getElementById("Frm").action = "<%=request.getContextPath()%>/Cart_Delete.do";
		document.getElementById("Frm").submit();
	}
</script>

</html>