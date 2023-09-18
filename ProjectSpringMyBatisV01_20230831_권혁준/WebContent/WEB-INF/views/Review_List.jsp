<%@page import="com.spring.Product.ReviewDTO"%>
<%@page import="com.spring.Product.ProductDTO"%>
<%@page import="com.spring.Product.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");

	String vURL = request.getContextPath() + "/Review.do";
 	String vUrl = request.getContextPath();

	String vFileDir = "/resources";
	String vFile = "/Product_List_ds.css?after";
 	
	String vImgDir = "/resources/img";
	
	ArrayList<ReviewDTO> dtoL = (ArrayList<ReviewDTO>)request.getAttribute("dtoL");
	ProductDAO dao = new ProductDAO();
 %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">

<head>
  <title>Review List View</title>

  <style>
    section {
    	width: 100%;
    	height : 60%;
	    background-image: url('<%=request.getContextPath() + "/resources/img/index_img.jpeg"%>');
	    background-size: cover;
    }

    .notice {
      width: 100%;
      background-color: rgba(0, 0, 0, 0.7);
      padding: 76px 0px;
      height : 92%;
    }

    table {
      width: 90%;
      height: 230px;
      padding: 35px 30px;
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
      padding: 40px 0;
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
  <jsp:include page="./header.jsp"></jsp:include>

  <center>
  <section>
    <div class="notice">
    <div class="bg_opac">
        
        <form action="<%=vUrl %>/Review_View.do" method="post" id="gueFrm" name="gueFrm">
				<input type="hidden" name="rv_pd_img">
				<input type="hidden" name="rv_pd_name">
				<input type="hidden" name="rv_writer">
				<input type="hidden" name="rv_date">
				<input type="hidden" name="rv_content">
				<input type="hidden" name="rv_title">
				<input type="hidden" name="rv_no">
        
      <table>
        <tr>
          <th class="title">Review List</th>
        </tr>
        <tr>
          <th>NO</th>
          <th>이미지</th>
          <th>제목</th>
          <th>작성자</th>
          <th>게시일자</th>
        </tr>
        <%
		   if (dtoL == null) {
			   response.sendRedirect(vURL);
			   dtoL = (ArrayList)request.getAttribute("dtoST");
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
			   
			   String rv_pd_name, rv_pd_img, rv_title, rv_date, rv_writer, rv_content;
			   int rv_no;
			   
			   int no;
			   
			   if (dtoL != null && dtoL.size() != 0) {
				   for (int idx = recOfBeginPage; idx < (recOfBeginPage + recPerPage); idx++) {
						if (idx == totalRecord) {
							break;
						}
						
						ReviewDTO dto = dtoL.get(idx);
						
						rv_no = dto.getRv_no();
						rv_writer = dto.getRv_writer();
						rv_date = dto.getRv_date();
						rv_title = dto.getRv_title();
						rv_pd_img = dto.getRv_pd_img();
						rv_content = dto.getRv_content();
						rv_pd_name = dto.getRv_pd_name();
		   %>
        <tr style='cursor: pointer;' onclick="valSend('<%=rv_no%>', '<%=rv_pd_img%>', '<%=rv_pd_name%>', '<%=rv_title%>', '<%=rv_date%>', '<%=rv_writer%>')">
          <td><%=rv_no %></td>
          <td><%=rv_pd_img %></td>
          <td><%=rv_title %></td>
          <td><%=rv_writer %></td>
          <td><%=rv_date %></td>
        </tr>
        </form>
	        <%
	      	}
			%>
			<tr>
	 <td class="div_nav" colspan="5">
	  <%
	   if (dtoL.size() != 0) {
		   if (nowBlock > 0) { %>   
		   		<a class="page" href="<%=vURL %>?nowBlock=<%=nowBlock - 1 %>&nowPage=<%=((nowBlock - 1) * pagePerBlock) %>&totalRecord=<%=totalRecord %>">PRE</a>
	       <% } %>
	 	   <%-- -------------------------------------------------------------------------------------- --%>
	 	   
	 	   <% for (int idx = pageOfBeginBlock; idx < (pageOfBeginBlock + pagePerBlock); idx++) { %>
	 			<a class="page" href="<%=vURL %>?nowBlock=<%=nowBlock%>&nowPage=<%=idx%>&totalRecord=<%=totalRecord%>"> <%=(idx + 1)%> </a>
	 	
	 			<% if ((idx + 1) == totalPage) {break;} %>
		   <% } // for문 %> 
		   <%-- -------------------------------------------------------------------------------------- --%>
		   
		   <% if (totalBlock > nowBlock + 1) { %>
			 	<a class="page" href="<%=vURL %>?nowBlock=<%=nowBlock + 1%>&nowPage=<%=((nowBlock + 1) * pagePerBlock)%>&totalRecord=<%=totalRecord%>">NEXT</a>
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
    </div>
    </section>
  </center>

  <jsp:include page="./footer.jsp"></jsp:include>
</div>
</body>

<script>
  	var obj = document.getElementById("gueFrm");
  	
  	function valSend(rv_no, rv_pd_img, rv_pd_name, rv_title, rv_date, rv_writer) {
  		obj.rv_no.value = rv_no;
  		obj.rv_pd_img.value = rv_pd_img;
  		obj.rv_pd_name.value = rv_pd_name;
  		obj.rv_title.value = rv_title;
  		obj.rv_date.value = rv_date;
  		obj.rv_writer.value = rv_writer;
  		obj.submit();
  	}
  </script>

</html>
