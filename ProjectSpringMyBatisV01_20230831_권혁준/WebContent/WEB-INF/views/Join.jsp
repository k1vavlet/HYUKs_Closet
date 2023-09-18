<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">

<head>
 <%
 	request.setCharacterEncoding("UTF-8");
 	response.setContentType("text/html;charset=UTF-8");
 	String vURL = request.getContextPath();
 	String js_url = request.getContextPath() + "/resources/_jQueryLib/jquery-3.7.0.js";
 %>
<script src="<%=js_url%>"></script>
    <title>Join Member</title>

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
            padding: 0px;
            float: left;
        }

        table {
            width: 80%;
            height: 150px;
            padding: 20px 60px;
            color: beige;
            font-weight: bold;
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
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
            margin-left: 280px;
            padding-top: 20px;
        }
    </style>
    
    
    <script>
    	let flag_ID = false;
    	function idChk() {
    		let insert_Id = document.getElementById("id");
        	
    		$.get("<%=request.getContextPath()%>/idChking.do", {name : insert_Id.value}, function(data){
		    			alert(data);
		    			
		    			if (data == 'TRUE') {
		    				flag_ID = true;
		    			}
		    		});
    		}
    	
    	function mFrmChk() {
    		let frm = document.getElementById("joinFrm");
    		
    		if (document.getElementsByName("id")[0].value == '') {
    			alert("아이디를 입력해주세요.");
    			document.getElementsByName("id")[0].focus();
    		}
    		else if (document.getElementsByName("pwd")[0].value == '') {
    			alert("비밀번호를 입력해주세요.");
    			document.getElementsByName("pwd")[0].focus();
    		}
    		else if (document.getElementsByName("name")[0].value == '') {
    			alert("이름을 입력해주세요.");
    			document.getElementsByName("name")[0].focus();
    		}
    		else if (document.getElementsByName("date")[0].value == '') {
    			alert("생년월일을 입력해주세요.");
    			document.getElementsByName("date")[0].focus();
    		}
    		else if (document.getElementsByName("hp")[0].value == '') {
    			alert("연락처를 입력해주세요.");
    			document.getElementsByName("hp")[0].focus();
    		}
    		else if (document.getElementsByName("email")[0].value == '') {
    			alert("이메일을 입력해주세요.");
    			document.getElementsByName("email")[0].focus();
    		}
    		else if (document.getElementsByName("addr01")[0].value == '') {
    			alert("기본 주소를 입력해주세요.");
    			document.getElementsByName("addr01")[0].focus();
    		}
    		else if (document.getElementsByName("addr02")[0].value == '') {
    			alert("상세 주소를 입력해주세요.");
    			document.getElementsByName("addr02")[0].focus();
    		}
    		else if (document.getElementsByName("pwchk")[0].value != document.getElementsByName("pwd")[0].value) {
    			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    			document.getElementsByName("pwd")[0].value = '';
    			document.getElementsByName("pwchk")[0].value = '';
    		}
    		else if (flag_ID == false) {
    			alert("아이디 중복체크는 필수입니다.");
    			document.getElementsByName("id")[0].value = '';
    		}
    		else {
    			$.ajax({
    				type: 'post',
    				async: false,
    				url: '<%=vURL%>/MemJoinProc.do',
    				dataType: 'text',
    				data: {
    					name : document.getElementsByName("name")[0].value,
    					id : document.getElementsByName("id")[0].value,
    					pwd : document.getElementsByName("pwd")[0].value,
    					date : document.getElementsByName("date")[0].value,
    					hp : document.getElementsByName("hp")[0].value,
    					email : document.getElementsByName("email")[0].value,
    					addr01 : document.getElementsByName("addr01")[0].value,
    					addr02 : document.getElementsByName("addr02")[0].value
    				},
    				
    				success: function(data, textStatus) {
    					location.href = '<%=request.getContextPath()%>/Index.do';
    				},
    				
    				error: function(data, textStatus) {
    					location.href = '<%=request.getContextPath()%>/Index.do';
    				}
    			})
    		}
    	}
    </script>
</head>

<body>
 
<div id="wrap">
    <%-- <%@include file="./header.jsp" %> --%>
    <jsp:include page="./header.jsp"></jsp:include>

    <section>
        <div class="inserting">
            
                <form action="<%=vURL %>" method="post" name="regFrm" id="joinFrm">
                <input type="hidden" name="category" value="MemJoinProc">
                    <table>
                    	<tr>
                    		<td colspan="3" align="center"><h1 style="color: orange;">Member Join</h1></td>
                    	</tr>
                        <tr>
                            <td class="info">ID</td>
                            <td><input type="text" id="id" name="id"></td>
                            <td><input type="button" value="중복확인" class="btn" onclick="idChk()"></td>
                        </tr>

                        <tr>
                            <td class="info">비밀번호</td>
                            <td><input type="password" id="pw" name="pwd"></td>
                        </tr>

                        <tr>
                            <td class="info">비밀번호 확인</td>
                            <td><input type="password" id="pwchk" name="pwchk"></td>
                            <td><span id="pw_chk_alert"></span></td>
                        </tr>

                        <tr>
                            <td class="info">이름</td>
                            <td><input type="text" name="name"></td>
                        </tr>

                        <tr>
                            <td class="info">생년월일</td>
                            <td><input type="date" name="date"></td>
                        </tr>

                        <tr>
                            <td class="info">연락처</td>
                            <td><input type="tel" name="hp"></td>
                        </tr>

                        <tr>
                            <td class="info">이메일</td>
                            <td><input type="email" name="email"></td>
                        </tr>

                        <tr>
                            <td class="info">배송지 주소</td>
                            <td><input type="text" name="addr01"></td>
                        </tr>
                        
                        <tr>
                            <td class="info">상세 주소</td>
                            <td><input type="text" name="addr02"></td>
                        </tr>

                        <tr>
                            <td colspan="3">
                                <input type="button" class="btn" value="회원가입" onclick="mFrmChk()">
                                <input type="reset" class="btn" value="다시 작성">
                            </td>
                        </tr>
                    </table>
                </form>
        </div>
    </section>

    <%-- <%@include file="./footer.jsp" %> --%>
    <jsp:include page="./footer.jsp"></jsp:include>
</div>
</body>

</html>
