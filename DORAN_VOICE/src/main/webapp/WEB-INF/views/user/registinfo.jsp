<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Simple Login Form</title>
<meta name="viewport"
   content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!--  font  -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->
<style>

@font-face { font-family: 'YiSunShinDotumM'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff') format('woff'); font-weight: normal; font-style: normal; }

.main-div {
   border: 30px solid #2B3946;
   background: #fafafa;
   padding: 50px;
   box-shadow: 5px 5px 10px silver;
   display: inline-block;
   -webkit-animation: fadein 2s;
}

@-webkit-keyframes fadein { /* Safari and Chrome */ 
from { opacity:0; }
to { opacity: 1; }
}

.main-div-title, .main-div>button, .main-div>form {
   font-family: 'YiSunShinDotumM', sans-serif;
   font-weight: bold;
}

.container {
   margin-top: 72px;
   text-align: center;
}

.registinfo-text {
   font-size: 15pt;
}

.main-div-title>h2 {
   font-size: 40pt;
   font-weight: bold;
   font-family: 'YiSunShinDotumM' sans-serif;
}

.main-div>button {
   margin-bottom: 10px;
}

.form-group-All>.id {
   margin-top: 10px;
}

.style-one { /*hr*/
   border: 1px dashed #2B3946;
}

#modify {
   width: 100%;
   background: #2B3946;
   border: white;
   font-size: 14pt;
   font-family: 'YiSunShinDotumM' sans-serif;
}
</style>
</head>
<header>
   <jsp:include page="../header.jsp"></jsp:include>
</header>

<body id="LoginForm">

   <div class="container">
      <div class="login-form">
         <div class="main-div">

            <div class="main-div-title">
               <h2>회원정보</h2>
               <p class="registinfo-text">${regist.name }님의 회원정보</p>
               <hr class="style-one">
            </div>
            <c:if test="${regist != null }">
               <form>
                  <div class="form-group-All">
                     <div class="form-group id">
                        <p class="registinfo-text">아이디 : ${regist.id }</p>
                     </div>
                     <div class="form-group">
                        <p class="registinfo-text">전화번호 : ${regist.phone }</p>
                     </div>
                     <div class="form-group">
                        <p class="registinfo-text">이메일 : ${regist.email }</p>
                     </div>
                     <div class="form-group">
                        <p class="registinfo-text">생일 : ${regist.birth }</p>
                     </div>
                  </div>
               </form>
               <button type="button" class="btn btn-warning" id="modify"
                  onClick="location.href='/confirmPw'" style="margin-top:10px;">회원정보 수정</button>
            </c:if>


         </div>
      </div>
   </div>
   <!-- <script>
$('#modify').click(function(){
   location.href("/confirmPw");
});
</script> -->
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>