<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script"
   rel="stylesheet">

<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<meta charset="UTF-8">
<title>회원목록</title>
<style>

@font-face { font-family: 'YiSunShinDotumM'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff') format('woff'); font-weight: normal; font-style: normal; }

#container {
   margin: 0 auto;
   margin-top: 2.5%;
}   
.regist {
   text-align: center;
   font-family: 'YiSunShinDotumM', sans-serif;
   font-size: 30pt;
   font-weight: bold;
}
form{
   margin: 0 auto;
   margin-top: 3%;
   padding: 2%;
   margin-bottom: 10%;
   float: left;
   border: 4px solid #2B3946;
   box-shadow: 5px 5px 10px silver;
   border-radius: 4px;   -webkit-animation: fadein 2s;
}
.style-one { /*hr*/
   height: 1px;
   background: #bbb;
   background-image: -webkit-linear-gradient(left, #eee, #777, #eee);
   background-image: -moz-linear-gradient(left, #eee, #777, #eee);
   background-image: -o-linear-gradient(left, #eee, #777, #eee);
}

@-webkit-keyframes fadein { /* Safari and Chrome */ 
from { opacity:0; }
to { opacity: 1; }
}
</style>
</head>
<body class="admin-body">
   <jsp:include page="../header.jsp" />
   
   <div style="max-height: 50%; width: 60%;" id="container">

      <form action="adminmodify">
         <h1 class="regist">회원목록</h1>
         <hr class="style-one">
         <div class="table">
         <table class="table table-striped table-hover">
            <thead>
               <tr style="font-weight: bold; font-size: 13pt;">
                  <td width="880">권한</td>
                  <td width="880">이름</td>
                  <td width="880">아이디</td>
                  <td width="880">비밀번호</td>
                  <td width="880">전화번호</td>
                  <td width="880">이메일</td>
                  <td width="880">생일</td>
                  <td width="880">수정</td>
               </tr>
            </thead>
            <c:forEach var="row" items="${list }">
               <tbody>
                  <tr>
                     <td><c:choose>
                           <c:when test="${row.admin==0}">회원</c:when>
                           <c:when test="${row.admin==1}">관리자</c:when>
                        </c:choose></td>
                     <td width="200">${row.name}</td>
                     <td width="200">${row.id}</td>
                     <td width="200">${row.pw}</td>
                     <td width="200">${row.phone}</td>
                     <td width="200">${row.email}</td>
                     <td width="400">${row.birth}</td>
                     <td width="200"><a href="/adminmodify?id=${row.id}"
                        class="btn btn-primary">수정</a></td>
                  </tr>
               </tbody>
            </c:forEach>
         </table>
         </div>
      </form>
   </div>
   <jsp:include page="../footer.jsp"/>
</body>
</html>