<%@page import="com.spring.Product.ProductDTO"%>
<%@page import="com.spring.Product.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");

	String vURL = request.getContextPath() + "/Search_Result.do";
 	String vUrl = request.getContextPath();

	String vFileDir = "/resources";
	String vFile = "/Product_List_ds.css";
 	
	String vImgDir = "/resources/img";
	
	ArrayList<ProductDTO> dtoL = (ArrayList<ProductDTO>)request.getAttribute("dtoSR");
	String pd_topic = (String)request.getAttribute("pd_topic");
	ProductDAO dao = new ProductDAO();
 %>
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">
<head>
    <title>PRODUCT SEARCH RESULT</title>
    <link rel="stylesheet" href="<%=vUrl + vFileDir + vFile %>">
    
    <style>
    section {
	    background-image: url('<%=request.getContextPath() + "/resources/img/Product_Result.PNG"%>');
	    background-size: cover;
    }
  a {
 	color : orange;
 	padding : 0 5px;
 	text-decoration: none;
  }
 
   a.page:hover {
	background-color: orange;
	color : #FFF;
	transition : background-color .5s;
	border-radius : 5px;
   }
 
   a.page:focus {
	background-color : hotpink;
	border-radius : 5px;
	color : white;
   }
  </style>
</head>
<body>
<div id="wrap">
    <%@include file="./header.jsp" %>

    <section>
        <div class="notice">
            <h1>&nbsp;&nbsp;&nbsp;&nbsp;PRODUCT SEARCH </h1>

            <form action="<%=request.getContextPath() %>/More_info.do" method="post" id="gueFrm" name="gueFrm">
				<input type="hidden" name="pd_snum">
				<input type="hidden" name="pd_name">
				<input type="hidden" name="pd_price">
				<input type="hidden" name="pd_many">
				<input type="hidden" name="pd_img">
				<input type="hidden" name="pd_info_img">
				<input type="hidden" name="pd_category">
				
		      <table>
		      
		      <%
		   if (dtoL == null) {
			   response.sendRedirect(vURL);
			   dtoL = (ArrayList)request.getAttribute("dtoSR");
		   }
		   else if (dtoL != null) {
			   int totalRecord = dtoL.size();
			   
			   int recPerPage = 5;
			   int pagePerBlock = 10;
			   
			   int totalPage = (int)Math.ceil((double)totalRecord / recPerPage);
			   int totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
			   
			   int nowPage = 0;
			   int nowBlock = 0;
			   
			   if (request.getAttribute("nowPage") != null) {
				   nowPage = Integer.parseInt((String)request.getAttribute("nowPage"));
			   }
			   if (request.getAttribute("nowBlock") != null) {
				   nowBlock = Integer.parseInt((String)request.getAttribute("nowBlock"));
			   }
			   
			   int recOfBeginPage = nowPage * recPerPage;
			   int pageOfBeginBlock = nowBlock * pagePerBlock;
			   
			   String snum, name, price, img, info_img, category;
			   int many;
			   
			   int no;
			   
			   if (dtoL != null && dtoL.size() != 0) {
				   for (int idx = recOfBeginPage; idx < (recOfBeginPage + recPerPage); idx++) {
						if (idx == totalRecord) {
							break;
						}
						
						ProductDTO dto = dtoL.get(idx);
						
						snum = dto.getSnum();
			    		name = dto.getName();
			    		price = dto.getPrice();
			    		many = dto.getMany();
			    		img = dto.getImg();
			    		info_img = dto.getInfo_img();
			    		category = dto.getCategory();
		   %>
	        <tr onclick="valSend('<%=snum%>', '<%=name%>', '<%=price%>', '<%=many%>', '<%=img%>', '<%=info_img%>', '<%=category%>')">
	          <td class="list_info">
	          <input type="hidden" name="gue_no" value="<%=snum %>">
	            <img src=<%=vUrl + vImgDir + "/" + img %> class="product_list_pic">
	          </td>
	          <td><h5><%=name %><br><%=price %></h5></td>
	        </tr>
	        </form>
	        <%
	      	}
			%>
		
		<tr>
	 <td class="div_nav" colspan="2">
	  <%
	   if (dtoL.size() != 0) {
		   if (nowBlock > 0) { %>   
		   		<a class="page" href="<%=vURL %>?pd_topic=<%=pd_topic %>&nowBlock&<%=nowBlock - 1 %>&nowPage=<%=((nowBlock - 1) * pagePerBlock) %>&totalRecord=<%=totalRecord %>">PRE</a>
	       <% } %>
	 	   <%-- -------------------------------------------------------------------------------------- --%>
	 	   
	 	   <% for (int idx = pageOfBeginBlock; idx < (pageOfBeginBlock + pagePerBlock); idx++) { %>
	 			<a class="page" href="<%=vURL %>?pd_topic=<%=pd_topic %>&nowBlock=<%=nowBlock%>&nowPage=<%=idx%>&totalRecord=<%=totalRecord%>"> <%=(idx + 1)%> </a>
	 	
	 			<% if ((idx + 1) == totalPage) {break;} %>
		   <% } // for문 %> 
		   <%-- -------------------------------------------------------------------------------------- --%>
		   
		   <% if (totalBlock > nowBlock + 1) { %>
			 	<a class="page" href="<%=vURL %>?pd_topic=<%=pd_topic %>&nowBlock=<%=nowBlock + 1%>&nowPage=<%=((nowBlock + 1) * pagePerBlock)%>&totalRecord=<%=totalRecord%>">NEXT</a>
		   <% } %>
		   <%-- -------------------------------------------------------------------------------------- --%>
		   
		   <%
	   } else {
		   out.println("등록된 게시물이 없습니다.");
	   }
	  %>
	 </td>
	</tr>
	<%
	   }
	}
   %>
      </table>
        </div>
    </section>

    <%@include file="./footer.jsp" %>
</div>
</body>

<script>
  	var obj = document.getElementById("gueFrm");
  	
  	function valSend(snum, name, price, many, img, info_img, category) {
  		obj.pd_snum.value = snum;
  		obj.pd_name.value = name;
  		obj.pd_price.value = price;
  		obj.pd_many.value = many;
  		obj.pd_img.value = img;
  		obj.pd_info_img.value = info_img;
  		obj.pd_category.value = category;
  		obj.submit();
  	}
  </script>
</html>