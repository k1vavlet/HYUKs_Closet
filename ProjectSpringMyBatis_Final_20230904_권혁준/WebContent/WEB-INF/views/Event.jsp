<%@page import="com.spring.Notice.EventDAO"%>
<%@page import="com.spring.Notice.EventDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
 	request.setCharacterEncoding("UTF-8");

	String vURL = request.getContextPath() + "/NoticeController.do";
 	String vUrl = request.getContextPath();

	String vFileDir = "/PJT";
	String vFile = "/Product_List_ds.css?after";
 	
	String vImgDir = "/PJT/img";
	
	ArrayList<EventDTO> dtoL = (ArrayList<EventDTO>)request.getAttribute("dtoL");
	EventDAO dao = new EventDAO();
 %>
<!DOCTYPE html>
<html lang="en">
  <meta charset="UTF-8">
<head>
  <title>EVENT</title>

  <style>
    section {
      width: 100%;
      height: 100%;
      background-image: url('<%=request.getContextPath() + "/resources/img/Event_img.PNG"%>');
      background-size: cover;
    }

    .notice {
      color: orange;
      width: 100%;
      height: 75%;
      background-color: rgba(0, 0, 0, 0.7);
      padding: 77px 0px;
      float: left;
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
  <jsp:include page="./header.jsp"></jsp:include>

  <section>
    <div class="notice">
      <form action="<%=vUrl %>/Event_View.do" method="post" id="gueFrm" name="gueFrm">
				<input type="hidden" name="evt_writer">
				<input type="hidden" name="evt_dating">
				<input type="hidden" name="evt_content">
				<input type="hidden" name="evt_title">
				<input type="hidden" name="evt_no">
        
      <table>
        <tr>
          <th class="title" colspan="3"><h1>&nbsp;&nbsp;&nbsp;&nbsp;EVENT</h1></th>
          <th class="title" style='text-align: right'>
          	<span onclick="location.href='<%=request.getContextPath()%>/Event_Write.do'">글쓰기</span>
          </th>
        </tr>
        <tr>
          <th style='width: 10%;'>NO</th>
          <th style='width: 50%;'>제목</th>
          <th style='width: 20%;'>작성자</th>
          <th style='width: 20%;'>행사 기간</th>
        </tr>
        <%
		   if (dtoL == null) {
			   response.sendRedirect(vUrl + "/Event.do");
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
			   
			   String evt_title, evt_dating, evt_writer, evt_content;
			   int evt_no;
			   
			   int no;
			   
			   if (dtoL != null && dtoL.size() != 0) {
				   for (int idx = recOfBeginPage; idx < (recOfBeginPage + recPerPage); idx++) {
						if (idx == totalRecord) {
							break;
						}
						
						EventDTO dto = dtoL.get(idx);
						
						evt_no = dto.getEvt_no();
						evt_writer = dto.getEvt_writer();
						evt_dating = dto.getEvt_dating();
						evt_title = dto.getEvt_title();
						evt_content = dto.getEvt_content();
		   %>
        <tr style='cursor: pointer;' onclick="valSend('<%=evt_no%>', '<%=evt_title%>', '<%=evt_dating%>', '<%=evt_writer%>')">
          <td><%=evt_no %></td>
          <td><%=evt_title %></td>
          <td><%=evt_writer %></td>
          <td><%=evt_dating %></td>
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
		   		<a class="page" href="<%=vUrl %>/Event.do?nowBlock=<%=nowBlock - 1 %>&nowPage=<%=((nowBlock - 1) * pagePerBlock) %>&totalRecord=<%=totalRecord %>">PRE</a>
	       <% } %>
	 	   <%-- -------------------------------------------------------------------------------------- --%>
	 	   
	 	   <% for (int idx = pageOfBeginBlock; idx < (pageOfBeginBlock + pagePerBlock); idx++) { %>
	 			<a class="page" href="<%=vUrl %>/Event.do?nowBlock=<%=nowBlock%>&nowPage=<%=idx%>&totalRecord=<%=totalRecord%>"> <%=(idx + 1)%> </a>
	 	
	 			<% if ((idx + 1) == totalPage) {break;} %>
		   <% } // for문 %> 
		   <%-- -------------------------------------------------------------------------------------- --%>
		   
		   <% if (totalBlock > nowBlock + 1) { %>
			 	<a class="page" href="<%=vUrl %>/Event.do?nowBlock=<%=nowBlock + 1%>&nowPage=<%=((nowBlock + 1) * pagePerBlock)%>&totalRecord=<%=totalRecord%>">NEXT</a>
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

  <jsp:include page="./footer.jsp"></jsp:include>
</div>
</body>

<script>
  	var obj = document.getElementById("gueFrm");
  	
  	function valSend(evt_no, evt_title, evt_dating, evt_writer) {
  		obj.evt_no.value = evt_no;
  		obj.evt_title.value = evt_title;
  		obj.evt_dating.value = evt_dating;
  		obj.evt_writer.value = evt_writer;
  		obj.submit();
  	}
  </script>
</html>
