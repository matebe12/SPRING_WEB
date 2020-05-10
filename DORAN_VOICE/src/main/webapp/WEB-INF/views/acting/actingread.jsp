<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Doran 게시판</title>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>


<script type="text/javascript">
 
</script>
<script type="text/javascript">
   $(document).ready(function() {
      
      var title = "${read.title}";
       //<![CDATA[
       // // 사용할 앱의 JavaScript 키를 설정해 주세요.
       Kakao.init('d912cec9161f7411515c66240a62616e');
       // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
       Kakao.Link.createDefaultButton({
         container: '#kakao-link-btn',
         objectType: 'feed',
         content: {
           title: document.title,
           description: title,
           imageUrl:'https://img.staticbg.com/thumb/large/oaupload/banggood/images/91/32/4aa3a1ca-3adf-4031-9ca5-470400cca442.jpeg',
           link: {
             webUrl: document.location.href,
             mobileWebUrl: document.location.href
           }
         },
         social: {
           likeCount: 286,
           commentCount: 45,
           sharedCount: 845
         },
         buttons: [
           {
             title: '보러가기',
             link: {
               mobileWebUrl: document.location.href,
               webUrl: document.location.href
             }
           }  
         ]
       });
     //]]>
      
      //댓글 수정폼 나오게
      $(".updateComment").click(function() {
         var test = ".result" + this.id;
         $(test).toggle();
      });
      //댓글 작성할때 아이디 없을시 로그인 창
      $('.repSubmit').on("click", function(evt) {
         if ($('#id').val() == '') {
            alert('로그인을 해주세요');
            self.location = "login";
            return false;
         } else if($('#content').val()==''){
        	 alert('1자 이상 입력해주세요');
        	 return false;
         }
      });

      //첨부파일
      $('#downpage').click(function() {
         $('.filedown').toggle();
      });

      /* 댓글삭제 */
      $(".deleteComment").click(function() {
         var delRno = $(this).attr("value");
         var result = confirm("삭제 하시겠습니까? " + delRno);

         if (result) {
            $.ajax({

               url : "/deleteComment",//맵핑주소로가서 삭제
               type : "post",
               data : {
                  rno : delRno
               },
               success : function(data) {
                  alert("삭제성공 ");
                  location.reload();
               }
            });
         } else {
            return false;
         }
      });
      //게시판 목록으로 이동
      $("#list").click(function() {
         location.replace("/individual");
      });
      //게시물삭제
      $(".delete").click(function() {
         var result = confirm("게시물을 삭제 하시겠습니까?");
         if (result) {
            location.href = "/actingdelete?bno=${read.bno}";
         } else {
            return false;
         }
      });

   });
</script>
<!-- 게시뭏 작성자가 null일 경우 -->
<c:if test="${read.writer ==''}">
   <script>
      alert("없는 게시물입니다");
      location.replace("/");
   </script>
</c:if>

<style>

@font-face { font-family: 'YiSunShinDotumM'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff') format('woff'); font-weight: normal; font-style: normal; }

   .all{
      margin: 0 auto;
      display: inline-flex;
      margin-top: 5%;
   }
   .container{
      margin: 0 auto;
      float: left;
      display: inline-flex;
      margin-bottom: 5%;

      padding: 20px;
      text-align: center;
      border: 4px solid #2B3946;
      box-shadow: 5px 5px 10px silver;
      border-radius: 4px;

      -webkit-animation: fadein 2s;

      text-align: left;
      font-family: 'Noto Sans KR', sans-serif;
      font-size: 13pt;

   }   
   .button-class{
      -webkit-animation: fadein 2s;

      float: left;
      font-family: 'Noto Sans KR', sans-serif;
      font-size: 13pt;
   }
   .first-div, .second-div{
      border: 1px solid light #2B3946;
      border-radius: 4px;
   }
   .second-div{
      padding-left: 2%;
   }

   @-webkit-keyframes fadein { /* Safari and Chrome */ 
   from { opacity:0; }
   to { opacity: 1; }
   }

   .img-id{
      margin: 0 auto;
      display: inline-flex;
      width: 100%;
   }
   .profile-image{
      width: 50px; height: 50px;
      object-fit: cover;
      object-position: top;
      border-radius: 50%;
   }
   #post{
      outline: 0;
      border: 0;
      background-color: #2B3946;   
      font-family: 'YiSunShinDotumM', sans-serif;
      font-size: 15pt;
      border-radius: 4px 0 0 4px ;
      font-weight: 600;
   }
   .share{
   text-align:right;
   }
   .style-one{
      height: 10px;
      margin-top: 5px;
   }

::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}

</style>
</head>

<body class="read-body">

<jsp:include page="../header.jsp" />

<div class="all">

	<c:if test="${read.writer == regist.id}">
   <div class="button-all" style="widows: 200px;">
      <td>
         <th class="button-class" style="width:200px; height: 50px;">
            <button type="button" style="color: white; width: 100%; height: 50px; margin-bottom:10px;" id="post" onclick="location.href='/actingmodify?bno=${read.bno}'">수정</button></th>
         <td class="button-class" style="width:200px; height: 50px;">
            <button type="button" style="color: white; width: 100%; height: 50px;" id="post" class="delete">삭제</button></td>
      </td>
   </div>
</c:if>
<div class="container" style="width:1400px; height: 620px;">
   <div class="first-div">
   <!-- 파일출력 부분 div -->
   <c:set var="filename" value="${read.filename}" />
                     <c:set var="fileNm" value="${fn:toLowerCase(filename)}" />
                     <!-- 파일네임의 이름을 모두 소문자로 바꿔줌 그리고 바꿔준 값을 fileNm이라는 변수로 담음-->
                     <c:forTokens var="token" items="${fileNm }" delims="." varStatus="status">
                        <!-- 바로위에 소문자로 바꾼값의 .뒤의 확장자명을 변수 token에 담음 -->
                        <c:if test="${status.last }">
                           <!-- 파일네임의 확장자명이 있을 경우 -->
                           <c:choose>                           
                              <c:when
                                 test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
                                 <br>
                                 <!-- 확장자명이 jpg or gif or png or bmp일 경우 -->
                                 <img src="resources/upload/${read.filename}"
                                    width="800px" height="550px" class="img" />
                                 <!-- 해당 파일 이름의사진으로 바로 보여준다 -->
                              </c:when>
                              <c:when test="${token eq 'mp4'}">
                              <video autoplay controls style="width: 800px; height: 550px;">
                              <source src="resources/upload/${read.filename}" type="video/mp4">
                              </video>
                              </c:when>

                              <c:when test="${token eq 'mp3'}">
                              <audio controls style="width:800px;">
                                  <source src="resources/upload/${read.filename}" type="audio/mp3">
                              </audio>
                              <img src="resources/image/main.jpg" style="width: 800px; height:550px;">
                              </c:when>

                              <c:when test="${token ne 'jpg' ||token ne 'gif' ||token ne 'png' ||token ne 'bmp' ||token ne 'mp4' ||token ne 'mp3'||token ne''}">
                                 <button id="downpage" class="btn btn-primary">첨부파일</button>
                                 <div class="filedown" style="display:none;">
                                    <a href="display?name=${read.filename}">${read.filename}</a>
                                    <!-- 첨부파일 이라는 버튼을 보여주고 버튼을 누르면 파일이름이 드롭다운된다(제이쿼리 실행) -->
                                 </div>
                                 <img src="resources/image/main.jpg" style="width: 800px;">
                              </c:when>
                              
                              <c:otherwise>
                              </c:otherwise>
                              
                           </c:choose>
                           
                           
                           </c:if>
                           
                     </c:forTokens>
                     <c:if test="${read.filename == ''}">
                     <img src="resources/image/main.jpg" style="width: 800px;">
                     </c:if>
   
   </div><!-- first-div / end -->
   <div class="second-div" style="width:500px; height:600px;">

      <div class="img-id" style="width: 100%; height: 3%;">
         <!-- 작성자명 -->
         <p class="id" style="height: 100%;"><a href="#" style="font-size:15pt; padding-bottom: 5px;">&nbsp;&nbsp;&nbsp;${read.writer}　</a></p>
                     <a href="javascript:;" id="kakao-link-btn">
         <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" width="20px" class="share"/></a><br>

      </div><!-- img-id / end -->   

      <hr>

     <div class="text-area" id="readContent" 
     style="width: 100%; height: 40%; word-wrap: break-word;overFlow-x : hidden; overFlow-y : scroll;">
     <!-- 작성한 글 보이는 공간 -->
            ${read.content}
      </div><!-- text-area / end -->
      <hr>
         <div class="comment-input" style="width: 100%; height: 8%;">   <!-- 댓글 작성 공간 -->
             <form action="/writeComment" method="post"> <!-- 댓글작성 폼 -->

               <input type="hidden" id="bno" name="bno" value="${read.bno}"
                  readonly="readonly" /> <!-- 게시판 번호 readonly지워도됨 -->
                  
                   <input type="hidden" id="writer"
                  name="writer" readonly="readonly" value="${regist.id}" />
                     <!-- 댓글 작성자 값을 로그인 아이디로 넣음 -->
            
                  <input type="text" id="content" name="content" style="width:77% ; height: 100%;" maxlength="18"> <!-- 댓글 내용 -->
               
         
                  <input type="hidden" name="id" id="id" value="${regist.id}">  <!-- 댓글작성할때 로그인안되어있으면 로그인창 가게 -->
                  <button type="submit" class="repSubmit btn btn-warning" style="width:20%; height: 98%; font-size: 10pt; margin-bottom: 5px;">작성</button> <!-- 작성 버튼 -->

            
            </form><!-- 댓글작성 폼 끝 -->
      </div><!-- comment-input / end -->

      <div class="comment-view" style="width: 100%; height: 24%; overFlow : auto;
             margin: 10px;" ><!-- 댓글이 보이는 공간 -->
<!-- 댓글 작성 된것들 for문으로 다 불러옴 -->
      <c:forEach items="${comment}" var="comment">
      
         <div id="comment" style="width: 100%; height: 10%; margin-bottom: 15%; word-break: keep-all; word-wrap: break-word;">  <!-- 댓글 목록 div -->
            <div class="commentheader" style="margin-bottom: 50px;"> <!-- 댓글을 두줄로 나눴는데 그 중 위에 부분  작성자와 수정 삭제 버튼 들어감 -->
               <tr>
               <th><a href="#">${comment.writer}</a></th>
               <th style="margin-left: 50%" style="word-break: keep-all; word-wrap: break-word;">${comment.content}</th>
              
               <c:if test="${comment.writer == regist.id}"> <!-- 댓글 작성자와 로그인 아이디가 같으면 버튼 보여줌 -->
               <th><button type="button" class="updateComment btn btn-primary"
                     id="${comment.rno}" value="${comment.rno}" style="float: right; margin-left: 2%;">수정</button></th> <!-- 수정버튼 -->
               <th><button type="button" class="deleteComment btn btn-default"
                     value="${comment.rno}" style="float: right;">삭제</button></th>   <!-- 삭제버튼 -->
                  </c:if><!-- 조건문 끝 -->
               
               </tr>
               <hr class="style-one">
            </div> <!-- 댓글의 헤더 끝 -->
            

         </div>
         <!--댓글 수정버튼을 눌렀을 때 나오는 댓글 수정 폼 -->
         <div class="result${comment.rno}" style="display: none;"
            id="updateform"> <!-- 댓글 수정 div   class명 절대 건드리면 안됨 style은 평소에는 숨겨진 상태를 제이쿼리로 토글 시켜놈 스크립트 보면 updateComment 함수있음 -->

            <form name="comment" class="updateform${comment.rno}"
               action="updateCommentpro" method="post">  <!-- 본격 댓글 수정폼 -->
               <input type="hidden" id="writer" name="writer" 
                  value="${comment.writer}"> <!-- 댓글 작성자를 히든으로 값넘김 id name 다 건들면 안됨 -->
                                    
                  <input type="hidden"
                  class="updateBno" id="updateBno" name="bno" value="${comment.bno}">
                  <!-- 댓글이 어느 게시물번호와 연동되는지의 값 id name 다 노건들 -->
               <input type="hidden" class="updateRno" id="updateRno" name="rno"
                  value="${comment.rno}"> <!-- 게시물번호  이것도 마찬가지 -->
                  <div>
               <input type="text" name="content" id="updateContent" class="form-control" value="${comment.content}" maxlength="18">
                  <!-- 댓글 내용 -->
               <input type="submit" class="btn btn-default" id="replyUpdateSubmit"
                  value="수정" style="float:right;"> </div>
            </form> <!-- 댓글 수정폼 끝 -->
            
         </div>
      </c:forEach>  <!-- 댓글 목록 전체 반복문 끝 -->
      </div><!-- comment-view / end -->


   
   </div><!-- second-div / end -->

</div><!-- container / end -->

</div><!-- all / end -->

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>