<%@page import="com.spring.Product.QnADAO"%>
<%@page import="com.spring.Product.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");

	String vURL = request.getContextPath() + "/CS_Center.do";
 	String vUrl = request.getContextPath();

	String vFileDir = "/resources";
	String vFile = "/Product_List_ds.css?after";
 	
	String vImgDir = "/resources/img";
	
	ArrayList<QnADTO> dtoL = (ArrayList<QnADTO>)request.getAttribute("dtoL");
	QnADAO dao = new QnADAO();
 %>
<!DOCTYPE html>
<html lang="en">
  <meta charset="UTF-8">

<head>
  <title>CS Center</title>
</head>
<style>
  section {
    width: 100%;
    height: 60%;
    background-image: url('<%=request.getContextPath() + "/resources/img/CS_Center_img.PNG"%>');
  	background-size: cover;
  }

  .notice2 {
    width: 100%;
    height: 75%;
    background-color: rgba(0, 0, 0, 0.7);
    padding: 76px 0px;
    float: right;
  }

  table {
    width: 100%;
    height: 200px;
    padding: 20px 30px;
    color: beige;
  }

  tr,
  th {
    height: auto;
    border-bottom: 2px solid beige;
  }
  
  th {
  	color: orange;
  }

  tr>td {
    height: auto;
    padding: 5px;
    text-align: center;
    border-bottom: 2px solid beige;
  }

  .title {
    text-align: left;
    font-size: 20px;
    border: 0px solid;
    padding: 10px;
  }

  .title2 {
    font-size: 20px;
    border: 0px solid;
    padding: 10px;
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
   
   h1 {
   	color: orange;
   }
</style>

<body>
<div id="wrap">
  <jsp:include page="./header.jsp"></jsp:include>

  <section>
    <div class="notice2">
      <h1>&nbsp;&nbsp;&nbsp;&nbsp; 상품문의</h1>

      <form action="<%=vUrl %>/QnA_View.do" method="post" id="gueFrm" name="gueFrm">
				<input type="hidden" name="rv_pd_img">
				<input type="hidden" name="rv_pd_name">
				<input type="hidden" name="rv_writer">
				<input type="hidden" name="rv_date">
				<input type="hidden" name="rv_content">
				<input type="hidden" name="rv_title">
				<input type="hidden" name="rv_no">
        
      <table>
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
						
						QnADTO dto = dtoL.get(idx);
						
						rv_no = dto.getQna_no();
						rv_writer = dto.getQna_writer();
						rv_date = dto.getQna_date();
						rv_title = dto.getQna_title();
						rv_pd_img = dto.getQna_pd_img();
						rv_content = dto.getQna_content();
						rv_pd_name = dto.getQna_pd_name();
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
		   out.print("<h1>등록된 게시물이 없습니다.</h1>");
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

  <%-- <%@include file="./footer.jsp" %> --%>
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
