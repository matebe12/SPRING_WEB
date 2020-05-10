<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script"
   rel="stylesheet">
<meta charset="UTF-8">
<title>Doran Voice</title>
<style>
.dad {
   margin-top: 10%;
   height: 400px;
   width: 100%;
   overflow: hidden;
   position: static;
   padding: 0;
}

.dad>.son-1 {
   position: absolute;
   height: cover;
   width: 100%;
   -moz-transition: all 5s;
   -webkit-transition: all 5s;
   transition: all 5s;
   -moz-transform: scale(2, 2);
   -webkit-transform: scale(1, 1);
   transform: scale(1, 1);
   -moz-background-size: cover;
   -webkit-background-size: cover;
   background-size: cover;
   z-index: -1;
}

.dad:hover>.son-1 {
   -moz-transform: scale(2, 2);
   -webkit-transform: scale(2, 2);
   transform: scale(2, 2);
}

.son-text {
   color: #fcfcfc;
   font-size: 25pt;
   font-family: 'Nanum Pen Script', cursive;
   text-align: center;
   width: 100%;
   height: 400px;
   -moz-transition: all 1s;
   -webkit-transition: all 1s;
   transition: all 1s;
   padding-top: 15vh;
}
.side-menu {
   float: left;
   margin: 3%;
   margin-left: 10%;
   width: 10%;
   text-align: center;
   -webkit-animation: fadein 2s;
   border: 4px solid #2B3946;
   box-shadow: 5px 5px 10px silver;
   border-radius: 4px;
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 15pt;
   font-weight: bold;
}
li{
   list-style: none;
}
li>a{
   color: black;
}
.son-text:hover {
   background-color: #22313F;
}

.son-span {
   background: #fff;
   color: #22313F;
   padding: 15px 45px;
   font-family: 'Nanum Pen Script', cursive;
   font-size: 40pt;
}
</style>
</head>
<body>
   <jsp:include page="header.jsp" />
   
      <div class="side-menu">
      <p align="center"
         style="padding-bottom: 10px; padding-bottom: 10px; background: #2B3946; color: white;">도란보이스</p>
      <li><a href="noticelist">공지사항</a></li>
      <li style="padding-top:5px;"><a href="/introduce">도란보이스란</a></li>
      
   </div>
   
   <div class="container dad">
      <div class="son-1"></div>
      <p class="son-text">
         <span class="son-span">What is Doran Voice</span><br />
         <br />도란 보이스란 순우리말로 '여럿이 나직한 목소리로 서로 정답게 이야기하다.'<br> 라는 뜻으로 성우
         지망생들이 정겹고 서로 정답게 지내기 위한 성우 커뮤니티 입니다.
      </p>
      <p class="son-text">라는 뜻으로 성우 지망생들이 정겹고 서로 정답게 지내기 위한 성우 커뮤니티 입니다.</p>

   </div>
   <jsp:include page="footer.jsp" />
</body>
</html>