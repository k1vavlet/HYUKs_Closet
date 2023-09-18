<%@page import="com.spring.Member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">

<head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String vURL = request.getContextPath();
 	String js_url = request.getContextPath() + "/resources/_jQueryLib/jquery-3.7.0.js";
 %>
<script src="<%=js_url%>"></script>
    <title>MyPage</title>

    <style>
        section {
            width: 100%;
            height: 100%;
            background-image: url('<%=request.getContextPath() + "/resources/img/Join_img.PNG"%>');
            background-size: cover;
        }

        .inserting {
            color: orange;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 0px;
            float: left;
        }

        table {
            width: 80%;
            height: 150px;
            padding: 40px 60px;
            color: beige;
            font-weight: bold;
        }

        tr,
        th {
            height: auto;
        }

        tr>td {
            width: 20%;
            height: auto;
            padding: 5px;
            text-align: center;
        }

        .info {
            width: 20%;
            height: auto;
            padding: 5px;
            text-align: right;
        }

        .title {
            text-align: left;
            font-size: 20px;
            border: 0px solid;
            padding: 10px;
        }

        input {
            width: 100%;
            font-size: 15px;
            padding: 5px 0;
        }

        .btn, button {
            width: 150px;
            height: 100%;
            font-size: 15px;
            border-radius: 10px;
            background-color: cornflowerblue;
            color: white;
            cursor: pointer;
        }
        
        form {
        	margin: auto;
            padding: 0;
            margin-right: 200px;
        }
    </style>
    
    <script>
    	let info_arr = ['pwd', 'date', 'hp', 'email', 'addr01', 'addr02'];
    	let alert_arr = ['비밀번호', '생년월일', '전화번호', '이메일', '기본주소', '상세주소'];
    	
    	function formChking() {
    		for (let i = 0; i < info_arr.length; i++) {
	    		if (document.getElementsByName(info_arr[i])[0].value == '') {
	    			alert(alert_arr[i] + "을(를) 입력해주세요");
	    			document.getElementsByName(info_arr[i])[0].focus();
	    		}
	    		else {
	    			document.getElementById("updFrm").submit();
	    			<%-- $.ajax({
	    				type: 'post',
	    				async: false,
	    				url: '<%=vURL%>?category=MyPageProc',
	    				dataType: 'text',
	    				data: {
	    					id : document.getElementsByName("id")[0].value,
	    					pwd : document.getElementsByName("pwd")[0].value,
	    					name : document.getElementsByName("name")[0].value,
	    					date : document.getElementsByName("date")[0].value,
	    					hp : document.getElementsByName("hp")[0].value,
	    					email : document.getElementsByName("email")[0].value,
	    					addr01 : document.getElementsByName("addr01")[0].value,
	    					addr02 : document.getElementsByName("addr02")[0].value
	    				},
	    				
	    				success: function(data, textStatus) {
	    					alert(document.getElementsByName("name")[0].value + '님. 회원정보 수정 완료');
	    					location.href = '<%=request.getContextPath()%>/PJT/index.jsp';
	    				},
	    				
	    				error: function(data, textStatus) {
	    					alert(document.getElementsByName("name")[0].value + '님. 회원정보 수정 실패');
	    					location.href = '<%=request.getContextPath()%>/PJT/index.jsp';
	    				}
	    			}) --%>
	    		}
    		}
    	}
    </script>
</head>

<body>
<div id="wrap">
    <jsp:include page="./header.jsp"></jsp:include>

    <section>
        <div class="inserting">
            <h1 align="center">My Page</h1>
            	<%
            	 ArrayList<MemberDTO> dtoL = (ArrayList)request.getAttribute("dtoL");
            	%>
                <form action="<%=vURL %>/MemUpd.do" method="post" id="updFrm" name="regFrm" align="center">
               
                <c:forEach var="dtoLVal" items="${dtoL}">
                    <table>
                        <tr>
                            <td class="info">ID</td>
                            <td><input type="text" name="id" value="${dtoLVal.id}" readonly></td>
                        </tr>

                        <tr>
                            <td class="info">비밀번호</td>
                            <td><input type="password" id="pw" name="pwd" value="${dtoLVal.pwd}"></td>
                        </tr>

                        <tr>
                            <td class="info">이름</td>
                            <td><input type="text" name="name" value="${dtoLVal.name}" readonly></td>
                        </tr>

                        <tr>
                            <td class="info">생년월일</td>
                            <td><input type="text" name="date" value="${fn:substring(dtoLVal.date, 0, 10)}"></td>
                        </tr>

                        <tr>
                            <td class="info">연락처</td>
                            <td><input type="tel" name="hp" value="${dtoLVal.hp}"></td>
                        </tr>

                        <tr>
                            <td class="info">이메일</td>
                            <td><input type="email" name="email" value="${dtoLVal.email}"></td>
                        </tr>

                        <tr>
                            <td class="info">배송지 주소</td>
                            <td><input type="text" name="addr01" value="${dtoLVal.addr01}"></td>
                        </tr>
                        
                        <tr>
                            <td class="info">상세 주소</td>
                            <td><input type="text" name="addr02" value="${dtoLVal.addr02}"></td>
                        </tr>
                        </c:forEach>

                        <tr>
                            <td colspan="2" style='text-align: right; padding-right: 30px;'>
                                <input type="button" class="btn" value="정보 수정" onclick="formChking()">
                                <input type="reset" class="btn" value="다시 작성">
                                <input type="button" class="btn" value="회원탈퇴" onclick="location.href='<%=request.getContextPath() + "/MemDel.do"%>'">
                            </td>
                        </tr>
                    </table>
                </form>
        </div>
    </section>

    <jsp:include page="./footer.jsp"></jsp:include>
</div>
</body>

</html>
