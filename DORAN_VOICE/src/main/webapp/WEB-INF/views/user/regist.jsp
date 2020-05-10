<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="${pageContext.request.contextPath}/resources/common/common.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/css/user/sign_up.css" rel="stylesheet">

<script>

var idCheck = false;


	// 성공 상태로 바꾸는 함수
	function successState(sel) {
	   $(sel).parent().removeClass("has-error").addClass("has-success")
	         .find(".glyphicon").removeClass("glyphicon-remove")
	         .addClass("glyphicon-ok").show();
	};


   // 에러 상태로 바꾸는 함수
   function errorState(sel) {
      $(sel).parent().removeClass("has-success").addClass("has-error")
            .find(".glyphicon").removeClass("glyphicon-ok").addClass(
                  "glyphicon-remove").show();
   };
   
	//회원가입 ajax통신
   function doSignUpAjax(){
 	  var name = $('#name').val();
 	  var pw = $('#pw').val();
 	  var id= $('#id').val();
 	  var phone = $('#phone').val();
 	  var email = $('#email').val();
 	  var birth = $('#birth').val();
 	  var reqData = {};
 	  reqData.USER_NAME = name;
 	  reqData.USER_PW = pw;
 	  reqData.USER_ID = id;
 	  reqData.USER_PHONE = phone;
 	  reqData.USER_EMAIL = email;
 	  reqData.USER_BIRTH = birth;
 	  
 	  $.post('/user/sign_up',JSON.stringify(reqData),function(data){
 		  if(data.resultCode == 200){
     		  alert('회원가입이 완료 되었습니다.');
     		  location.href = '/main';
     	  }else{
     		  alert('회원가입이 실패 하였습니다. 다시 시도 해주세요');
     	  } 
 	  },'json');
   }
	
   $(document).ready(function(){
	   $('#idCheck').click(function() {

	    	 
	         var reqData = {
	            USER_ID : $('#id').val()
	         };
	         
	         if ($('#id').val().length < 5) {
                 $(".result .msg").text("5글자 이상 입력해주세요");
                 errorState("#id");
                 idCheck = false;
                 return false;
              } 
	         
	         $.post('/user/idCheck',JSON.stringify(reqData),function(data){
	        	 if(data.result == 1){
	        		 $(".result .msg").text("사용중인 아이디입니다. 다시 입력해주세요");
	                 $(".result .msg").attr("style", "color:#f00");
	                 idCheck = false;
	        	 }else{
	        		 if ($('#id').val().length >= 5) {
	                     successState("#id");
	                     $(".result .msg").text("사용 가능한 아이디 입니다");
	                     $(".result .msg").attr("style", "color:#00f");
	                     successState("#id");
	                     idCheck = true;
	                 }
	        	 }
	         },'json');
	      });

	      $("#id").keyup(function() {
	         $(".result .msg").text("중복확인을 해주십시오.");
	         $(".result .msg").attr("style", "color:#000");
	         idCheck = false;
	      });

	      $("#confirm").keyup(function() {
	         var rePwd = $(this).val();
	         var pwd = $("#pw").val();
	         // 비밀번호 같은지 확인
	         if (rePwd == pwd) {//비밀번호 같다면
	            $("#rePwdErr").hide();
	            successState("#confirm");
	         } else {//비밀번호 다르다면
	            $("#rePwdErr").show();
	            errorState("#confirm");
	         }
	      });

	      $("#pw").keyup(function() {
	         var pw = $("#pw").val().length;
	         // 비밀번호 확인
	         if (pw >= 10) {//비밀번호 길이가 10이상이라면
	            $("#pwdRegErr").hide();
	            successState("#pw");
	         } else {//10미만이라면
	            $("#pwdRegErr").show();
	            errorState("#pw");
	         }
	      });

	      $("#name").keyup(function() {
	         var pw = $("#name").val().length;
	         // 비밀번호 확인
	         if (pw >= 3) {//비밀번호 길이가 10이상이라면
	            $("#nameRegErr").hide();
	            successState("#name");
	         } else {//10미만이라면
	            $("#nameRegErr").show();
	            errorState("#name");
	         }
	      });


	      $("#phone").keyup(function() {
	         var phone = $("#phone").val().length;
	         if (phone > 10) {
	            successState("#phone");
	         } else {
	            errorState("#phone");
	         }
	      });

	     
	      
	      $("#email").keyup(function() {
              var email = $(this).val();
              // 이메일 검증할 정규 표현식
              var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
              if (reg.test(email)) {//정규표현식을 통과 한다면
                 $("#emailErr").hide();
                 successState("#email");
              } else {//정규표현식을 통과하지 못하면
                 $("#emailErr").show();
                 errorState("#email");
              }
	      });

	      $('#submit').click(function() {

	         var result = confirm("회원가입 하시겠습니까?");
	         if (result) {

	            if ($('#name').val().length < 3) {
	               alert("이름을 3글자 이상으로 입력 해주세요");
	               return false;
	            } else if ($('#id').val().length < 5) {
	               alert("아이디를 5글자 이상으로 입력 해주세요");
	               return false;
	            } else if ($('#pw').val().length < 10) {
	               alert("비밀번호를 10글자 이상으로 입력 해주세요");
	               return false;
	            } else if (!$('#confirm').val() == $('#pw').val()) {
	               alert("비밀번호를 확인해주세요");
	               return false;
	            } else if ($('#phone').val().length < 11) {
	               alert("전화번호를 11글자 이상으로 입력 해주세요");
	               return false;
	            } else if ($('#email').val().length < 10) {
	               alert("이메일을 10글자 이상으로 입력 해주세요");
	               return false;
	            }else if(!idCheck){
	            	alert('중복 체크를 해주세요.');
	            	return false;
	            }
	            doSignUpAjax();
	         }
	      });
   });
     
   </script>
</head>
<body>
   <jsp:include page="../header.jsp"></jsp:include>

   <div id="back">

      <div class="container">

         <div class="inner-container">

            <form method="post" id="myForm" style="width: 100%;">

               <div class="form-group has-feeedback" style="background-color:#2B3946; width: 100%; padding:0;">
                  <img id="doranlogo" alt="" style="margin: 0 auto;" src="${pageContext.request.contextPath}/resources/image/doran_logo.png" >
               </div>


               <div class="form-group has-feedback" id="All-text">
                  <div class="form-group-inputAll">
                     <label class="control-label" for="name">이름</label> <input
                        class="form-control" type="text" name="name" id="name"
                        style="width: 87.5%; height: 40px;" placeholder="이름(3자 이상)" /> <span
                        id="nameRegErr" class="help-block">3글자 이상 입력하세요.</span> <span
                        class="glyphicon glyphicon-ok form-control-feedback"></span> <br>
                  </div>

                  <div class="form-group has-feedback" id="ID_input">
                     <label class="control-label" for="id">아이디</label> <br>
                     <div class="form-group-IDAll">
                        <input class="form-control" type="text" name="id" id="id"
                           style="width: 70%; height: 40px;" font-size: 7.5pt;
                           placeholder="아이디(5자 이상)" />
                        <button type="button" class="btn btn-success" id="idCheck">
                           중복확인</button>
                     </div>

                     <div class="form-group has-feedback"></div>

                     <span class="glyphicon glyphicon-ok form-control-feedback"></span>

                     <br>
                     <div>
                        <p class="result">
                           <span class="msg"></span>
                        </p>
                     </div>
                  </div>


                  <div class="form-group has-feedback">
                     <label class="control-label" for="pw">비밀번호</label> <input
                        class="form-control" type="password" name="pw" id="pw"
                        style="width: 87.5%; height: 40px;" placeholder="비밀번호(10자 이상)" />
                     <span id="pwdRegErr" class="help-block">10글자 이상 입력하세요.</span> <span
                        class="glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>

                  <div class="form-group has-feedback">
                     <label class="control-label" for="rePwd">비밀번호 재확인</label> <input
                        class="form-control" type="password" name="confirm" id="confirm"
                        style="width: 87.5%; height: 40px;" placeholder="비밀번호 확인" /> <span
                        id="rePwdErr" class="help-block" style="font-size: 13pt;">비밀번호와 일치하지 않습니다.  다시 입력해
                        주세요.</span> <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>

                  <div class="form-group has-feedback">
                     <label class="control-label" for="phone">전화번호</label> <input
                        class="form-control" type="tel" name="phone" id="phone"
                        style="width: 87.5%; height: 40px;" placeholder="전화번호" /> <span
                        class="glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>

                  <div class="form-group has-feedback">
                     <label class="control-label" for="email">이메일</label> <input
                        class="form-control" type="text" name="email" id="email"
                        style="width: 87.5%; height: 40px;" placeholder="이메일" /> <span
                        id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해
                        주세요.</span> <span class="glyphicon glyphicon-ok form-control-feedback"></span>
                  </div>

                  <div class="form-group has-feedback">
                     <label class="control-label" for="email">생년월일</label> <input
                        class="form-control" type="date" name="birth" id="birth"
                        style="width: 87.5%; height: 40px;" placeholder="생년월일" /> <span
                        class="glyphicon glyphicon-ok form-control-feedback"></span> <br>
                     <button class="btn btn-success" type="button" id="submit">가입하기</button>
                  </div>

               </div>
            </form>

         </div>
      </div>
   </div>
   
   <footer>
      <jsp:include page="../footer.jsp"></jsp:include>
   </footer>
</body>