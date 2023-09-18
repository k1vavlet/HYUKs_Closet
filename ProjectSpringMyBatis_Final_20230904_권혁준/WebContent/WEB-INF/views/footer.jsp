<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<%=request.getContextPath() + "/resources/index_ds.css" %>">
  
  <style>
    b {
      color: orange;
    }
  </style>
</head>

<body>
<div id="wrap" onselectstart="return false;">
  <footer>
    <b>Copyright ⓒ 2023.06 H-Creative Studio Company. All Rights reserved.</b> <br><br>
    주식회사 에이치크리에이티브스튜디오 사업자등록번호 : 000-00-00000 <br>
    통신판매업 등록번호 : 2023-대전-230623 대표자 : 권혁준 <br>
    대표번호 : 010-0000-0000 소재지 : 대전광역시 동구 계족로 000번길 0, 1302호 (용전동, OO아파트)
  </footer>
  
  <div id="floatdiv">
  	<button class="floating_btnDS"><a href="#First">UP</a></button>
  </div>
</div>
</body>

</html>
