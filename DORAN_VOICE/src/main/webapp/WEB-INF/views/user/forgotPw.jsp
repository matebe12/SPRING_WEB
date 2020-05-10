<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<meta name="viewport"
   content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<jsp:include page="${pageContext.request.contextPath}/resources/common/common.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/css/user/forgotPw.css"
	rel="stylesheet">
	
<script>
$(document).ready(function(){
	$('#id').keyup(function() {

	    var query = {
	       id : $('#id').val()
	    };
	    $.ajax({
	       url : "/idCheck",
	       type : "post",
	       data : query,
	       success : function(data) {
	          if (data == 1) {
	             $(".result .msg").text("아이디가 존재 합니다 찾으시는 아이디가 맞으시면 이메일을 적어주세요");
	             $(".result .msg").attr("style", "color:#00f");
	          } else {

	             if ($('#id').val().length < 5) {
	                $(".result .msg").text("5글자 이상 입력해주세요");
	                $("#submit").attr("disabled","disabled");
	                return false;
	             } else if ($('#id').val().length >= 5) {
	           
	                $(".result .msg").text("아이디가 존재하지않습니다");
	                $(".result .msg").attr("style", "color:#00f");
	                $("#submit").attr("disabled","disabled");
	         
	             }
	          }
	       }
	    });
	 });
	 $("#email")
     .keyup(
           function() {
              var email = $(this).val();
              // 이메일 검증할 정규 표현식
              var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
              if (reg.test(email)) {//정규표현식을 통과 한다면
           	   $(".result .msg").text("");
	             $(".result .msg").attr("style", "color:blue");
	             $("#submit").removeAttr("disabled");
              } else {//정규표현식을 통과하지 못하면
            	   $(".result .msg").text("이메일 형식이 맞지 않습니다");
  	             $(".result .msg").attr("style", "color:red");
  	           $("#submit").attr("disabled","disabled");
              }
           });
	 
	 $('#submit').click(function(){
		alert('해당 이메일로 임시비밀번호를 보냈습니다.'); 
	 });
});

</script>
</head>
<header>
   <jsp:include page="../header.jsp"></jsp:include>
</header>
<body id="LoginForm">

   <div class="container">
      <div class="login-form">
         <div class="main-div">

            <div class="main-div-title">
               <h2>비밀번호 찾기</h2>
               <p style="font-size: 15pt; font-family: 'Noto Sans KR', sans-serif; ">Please enter ID</p>
               <hr class="style-one">
            </div>

            
               <form action="findpwpro" id="forgot" method="post">
                  <div class="form-group">
                     <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력해주세요" style="font-size: 12pt; font-family: 'Noto Sans KR', sans-serif; ">
                  </div>

                  <div class="form-group">
                     <input type="email" class="form-control" id="email"
                        placeholder="이메일을 입력해주세요" name="email" style="font-size: 12pt; font-family: 'Noto Sans KR', sans-serif; ">
                  </div>
                  
                  <button type="submit" class="btn btn-primary" id="submit" disabled='disabled'>확인</button>
					 


               </form>
               
               <div>
                        <p class="result">
                           <span class="msg"></span>
                        </p>
                     </div>
           
         </div>
      </div>
   </div>

</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>