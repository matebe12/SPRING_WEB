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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
   rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->
<style>
.main-div {
   background-color: lightgray;
}

.main-div {
   border: 30px solid #2B3946;
   background: #fafafa;
   padding: 50px;
   box-shadow: 5px 5px 10px silver;
   display: inline-block;
   font-family: 'Do Hyeon', sans-serif;
   -webkit-animation: fadein 2s;
}

@-webkit-keyframes fadein { /* Safari and Chrome */ 
from { opacity:0; }
to { opacity: 1; }
}

.container {
   margin-top: 70px;
   text-align: center;
}

#submit {
   width: 100%;
   background: #2B3946;
   border: white;
   font-size: 15pt;
   font-family: 'Noto Sans KR', sans-serif;
}

.main-div-title>h2 {
   font-size: 35pt;
   font-weight: bold;
}

.style-one { /*hr*/
   height: 1px;
   background: #bbb;
   background-image: -webkit-linear-gradient(left, #eee, #777, #eee);
   background-image: -moz-linear-gradient(left, #eee, #777, #eee);
   background-image: -ms-linear-gradient(left, #eee, #777, #eee);
   background-image: -o-linear-gradient(left, #eee, #777, #eee);
}

#Login>h4 {
   font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<header>
   <jsp:include page="../header.jsp"></jsp:include>
</header>
<br>
<br>
<br>
<br>
<body id="LoginForm">

   <div class="container">
      <div class="login-form">
         <div class="main-div">

            <div class="main-div-title">
               <h2>비밀번호 확인</h2>
               <p style="font-size: 15pt; font-family: 'Noto Sans KR', sans-serif; ">Please enter your Password</p>
               <hr class="style-one">
            </div>

            <c:if test="${regist != null }">
               <form action="/confirmpwpro" id="Login" method="post">
                  <div class="form-group">
                     <input type="hidden" id="id" name="id" value="${regist.id }">
                  </div>

                  <div class="form-group">
                     <input type="password" class="form-control" id="pw"
                        placeholder="Password" name="pw" style="font-size: 15pt; font-family: 'Noto Sans KR', sans-serif; ">
                  </div>
                  <c:if test="${msg==false }">

                     <h4>입력한 비밀번호가 잘못되었습니다.</h4>

                  </c:if>
                  <button type="submit" class="btn btn-primary" id="submit">확인</button>



               </form>
            </c:if>

         </div>
      </div>
   </div>

</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>