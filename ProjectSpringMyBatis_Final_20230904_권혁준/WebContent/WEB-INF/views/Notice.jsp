<%@page import="com.spring.Notice.NoticeDAO"%>
<%@page import="com.spring.Notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");

	String vURL = request.getContextPath() + "/NoticeController.do";
 	String vUrl = request.getContextPath();

	String vFileDir = "/PJT";
	String vFile = "/Product_List_ds.css?after";
 	
	String vImgDir = "/PJT/img";
	
	ArrayList<NoticeDTO> dtoL = (ArrayList<NoticeDTO>)request.getAttribute("dtoL");
	NoticeDAO dao = new NoticeDAO();
 %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">

<head>
  <title>Notice</title>

  <style>
    section {
      background-image: url('<%=request.getContextPath() + "/resources/img/Notice_IMG.PNG"%>');
      background-size: cover;
    }

    .notice {
      color: orange;
      width: 100%;
      height: 75%;
      background-color: rgba(0, 0, 0, 0.7);
      padding: 77px 0px;
      text-align: center;
    }

    table {
      width: 100%;
      height: 200px;
      padding: 20px 30px;
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
      height: 100%;
      
      padding: 40px 0;
    }
    
    span {
     background-color: orange;
     padding : 10px;
     color: #FFF;
     cursor: pointer;
     border-radius: 10px;
     font-weight: bold;
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
  <%-- <%@include file="./header.jsp" %> --%>
  <jsp:include page="./header.jsp"></jsp:include>

    <section>
    <div class="notice">
        <form action="<%=vUrl %>/Notice_view.do" method="post" id="gueFrm" name="gueFrm">
				<input type="hidden" name="nt_writer">
				<input type="hidden" name="nt_date">
				<input type="hidden" name="nt_content">
				<input type="hidden" name="nt_title">
				<input type="hidden" name="nt_no">
        
     <table>
        <tr>
          <th class="title" colspan="3"><h1>&nbsp;&nbsp;&nbsp;&nbsp;NOTICE</h1></th>
          <th class="title" style='text-align: right'>
          	<span onclick="location.href='<%=request.getContextPath()%>/Notice_write.do'">글쓰기</span>
          </th>
        </tr>
        <tr>
          <th>NO</th>
          <th>제목</th>
          <th>작성자</th>
          <th>게시일자</th>
        </tr>
        <%
		   if (dtoL == null) {
			   response.sendRedirect(request.getContextPath() + "/Notice.do");
			   dtoL = (ArrayList)request.getAttribute("dtoL");
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
			   
			   String nt_title, nt_date, nt_writer, nt_content;
			   int nt_no;
			   
			   int no;
			   
			   if (dtoL != null && dtoL.size() != 0) {
				   for (int idx = recOfBeginPage; idx < (recOfBeginPage + recPerPage); idx++) {
						if (idx == totalRecord) {
							break;
						}
						
						NoticeDTO dto = dtoL.get(idx);
						
						nt_no = dto.getNt_no();
						nt_writer = dto.getNt_writer();
						nt_date = dto.getNt_date();
						nt_title = dto.getNt_title();
						nt_content = dto.getNt_content();
		   %>
        <tr style='cursor: pointer;' onclick="valSend('<%=nt_no%>', '<%=nt_title%>', '<%=nt_date%>', '<%=nt_writer%>')">
          <td><%=nt_no %></td>
          <td><%=nt_title %></td>
          <td><%=nt_writer %></td>
          <td><%=nt_date %></td>
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
		   		<a class="page" href="<%=vUrl %>/Notice.do?nowBlock=<%=nowBlock - 1 %>&nowPage=<%=((nowBlock - 1) * pagePerBlock) %>&totalRecord=<%=totalRecord %>">PRE</a>
	       <% } %>
	 	   <%-- -------------------------------------------------------------------------------------- --%>
	 	   
	 	   <% for (int idx = pageOfBeginBlock; idx < (pageOfBeginBlock + pagePerBlock); idx++) { %>
	 			<a class="page" href="<%=vUrl %>/Notice.do?nowBlock=<%=nowBlock%>&nowPage=<%=idx%>&totalRecord=<%=totalRecord%>"> <%=(idx + 1)%> </a>
	 	
	 			<% if ((idx + 1) == totalPage) {break;} %>
		   <% } // for문 %> 
		   <%-- -------------------------------------------------------------------------------------- --%>
		   
		   <% if (totalBlock > nowBlock + 1) { %>
			 	<a class="page" href="<%=vUrl %>/Notice.do?nowBlock=<%=nowBlock + 1%>&nowPage=<%=((nowBlock + 1) * pagePerBlock)%>&totalRecord=<%=totalRecord%>">NEXT</a>
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

  <%-- <%@include file="./footer.jsp" %> --%>
  <jsp:include page="./footer.jsp"></jsp:include>
</div>
</body>
<script>
  	var obj = document.getElementById("gueFrm");
  	
  	function valSend(nt_no, nt_title, nt_date, nt_writer) {
  		obj.nt_no.value = nt_no;
  		obj.nt_title.value = nt_title;
  		obj.nt_date.value = nt_date;
  		obj.nt_writer.value = nt_writer;
  		
  		obj.submit();
  	}
  </script>
</html>
