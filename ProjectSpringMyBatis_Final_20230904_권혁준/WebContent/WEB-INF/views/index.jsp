<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
 	request.setCharacterEncoding("UTF-8");

	String vURL = request.getContextPath() + "/MemberController.do";
 	String vUrl = request.getContextPath();

	String vFileDir = "/PJT";
	String vFile = "/index_ds.css";
 	
	String vImgDir = "/PJT/img";
 %>
<html>
    <meta charset="UTF-8">

<head>
<script>
    var arr_img = ["<%=request.getContextPath() + "/resources/img/Shopping_mall_silde001.PNG"%>", "<%=request.getContextPath() +  "/resources/img/Shopping_mall_silde002.PNG"%>", 
    "<%=request.getContextPath() + "/resources/img/Shopping_mall_silde003.PNG"%>", "<%=request.getContextPath() + "/resources/img/Shopping_mall_silde004.PNG"%>", "<%=request.getContextPath() + "/resources/img/Shopping_mall_silde005.PNG"%>"];
    var i = 0;
    let myVar;

    function mImg_move() {
    	if (i != arr_img.length) {
    		document.getElementsByTagName("img")[1].src = arr_img[i];

    		myVar = setTimeout(mImg_move, 1500);
    		i++;

    		if (i == arr_img.length) {
    			i = 0;
    		}
    	}
    }

    function mStart() {
    	myVar = setTimeout(mImg_move, 1500);
    }

    function mStop() {
    	clearTimeout(myVar);
    }

    var cnt = 0;

    function mBack() {
    	if (i == 0) {
    	}
    	else {
    		mStop();

    		i--;
    		document.getElementsByTagName("img")[1].src = arr_img[i];

    		mStart();

    		if (i == 0) {
    			i = arr_img.length;
    		}
    	}
    }

    function mNext() {
    	if (i != arr_img.length && i < arr_img.length) {
    		mStop();

    		document.getElementsByTagName("img")[1].src = arr_img[i];
    		i++;

    		mStart();

    		if (i == arr_img.length) {
    			i = 0;
    		}
    	}
    	else { }
    }
    </script>
    <title>:: HYUK's Closet ::</title>
    <link rel="stylesheet" href="<%=vUrl%>/resources/index_ds.css">
    
    <style>
     table {
     	padding: 40px 0px;
     }
    </style>
</head>

<body onLoad="mImg_move()">

<div id="wrap">
<%@include file="./header.jsp" %>

    <section>
        <table align="center">
            <tr>
            	<td><button class="idx_btnDS" onclick="mBack();">&lt;</button></td>
                <td><img class="slide" src=<%=vUrl + "/resources/img/Shopping_mall_silde006.PNG"%> onmouseover="mStop()" onmouseout="mStart()"/></td>
                <td><button class="idx_btnDS" onclick="mNext();">&gt;</button></td>
            </tr>
        </table>
    </section>
    
    <%@include file="./footer.jsp" %>
    
</div>
</body>
</html>
