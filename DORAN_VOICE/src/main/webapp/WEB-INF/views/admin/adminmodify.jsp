<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script"
   rel="stylesheet">
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<style>

@font-face { font-family: 'YiSunShinDotumM'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff') format('woff'); font-weight: normal; font-style: normal; }

.adminmodify-body{
   margin: 0 auto;
}

.form>h2{
   font-family: 'YiSunShinDotumM', sans-serif;
   font-size: 20pt;
   font-weight: bold;
}
#form {
   margin: 0 auto;
   margin-left: 38%;
   font-family: 'Nanum Pen Script', cursive;
   font-size: 25px;
   margin-top: 3%;
   margin-bottom: 4%;
   padding: 1%;
   float: left;
   border: 4px solid #2B3946;
   box-shadow: 5px 5px 10px silver;
   border-radius: 4px;
   -webkit-animation: fadein 2s;
}
@-webkit-keyframes fadein { /* Safari and Chrome */ 
from { opacity:0; }
to { opacity: 1; }
}

.form-control {
   font-family: 'YiSunShinDotumM', sans-serif;
   font-size: 13pt;
   font-weight: bold;
}

label{
   font-family: 'YiSunShinDotumM', sans-serif;
   font-size: 15pt;
   font-weight: bold;
}
input[type=button]{
   float: right;
   outline: 0;
   border: 0;
   background-color: #2B3946;   
   font-family: 'YiSunShinDotumM', sans-serif;
   color: white;
   font-weight: bold;
   font-size: 15pt;
   width: 30%;
   margin-left: 10%;
}
</style>
<script>
   $(document).ready(function() {
      $("#btnUpdate").click(function() {
         document.form1.action = "${path}/adminUpdate"
         document.form1.submit();
      });
   });
   $(document).ready(function() {
      $("#btnDelete").click(function() {
         document.form1.action = "${path}/adminDelete"
         document.form1.submit();
      });
   });
</script>
<title>관리자 회원정보 수정 목록</title>
</head>
<body class="adminmodify-body">
   <jsp:include page="../header.jsp" />
   <form method="post" name="form1" role="form"
      style="width: 500px; text-align: left;" id="form">
      <h2 style="font-family: 'YiSunShinDotumM', sans-serif; font-size: 30pt; font-weight: bold; text-align: center;">
                  관리자 : 회원수정관리</h2>

      <div class="form-group">
         <label for="admin"> 권한</label> <input name="admin"
            class="form-control" value="${modi.admin}">
      </div>
      <div class="form-group">
         <label for="name"> 이름</label> <input name="name" class="form-control"
             value="${modi.name}">
      </div>

      <div class="form-group">
         <label for="id"> 아이디</label> <input name="id" readonly="readonly"
            class="form-control" value="${modi.id}">
      </div>

      <div class="form-group">
         <label for="password"> 비밀번호</label> <input type="password" name="pw"
            class="form-control" readonly="readonly"
            value="${modi.pw}">

      </div>
      <div class="form-group">
         <label for="email">이메일</label> <input name="email"
            class="form-control" value="${modi.email}">
      </div>

      <div class="form-group">
         <label for="admin">전화번호 </label> <input name="phone"
            class="form-control" value="${modi.phone}">
      </div>

      <div class="form-group">
         <label for="admin">생년월일 </label> <input type="text" name="birth"
            class="form-control" value="${modi.birth}">
      </div>
      <div class="form-group" style="display:inline-flex; float: right; width: 90%;">
         <input type="button" value="수정" class="btn btn-warning"
            id="btnUpdate"> <input type="button" class="btn btn-warning"
            value="삭제" id="btnDelete">
      </div>


   </form>
   <jsp:include page="../footer.jsp" />
</body>
