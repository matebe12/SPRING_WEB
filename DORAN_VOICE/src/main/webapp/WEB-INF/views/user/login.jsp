<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>[ Doran Voice | Login ]</title>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<jsp:include page="${pageContext.request.contextPath}/resources/common/common.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/css/user/login.css" rel="stylesheet">
<script>
function requestLogin(){
	var loginData = {
			USER_ID: $('#id').val(),
			USER_PW: $('#pw').val()
	};
	
	$.post('/user/login_try',JSON.stringify(loginData), function(data){
		if(!cm.isEmpty(data.resultUser)){
			location.href= "/main"
		}else{
			$('#fail').text('아이디 또는 비밀번호를 확인해주세요');
		}
	});
}
$(document).ready(function(){
	$('#submit-button').bind('click', function(){
		requestLogin();
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
					<h2>L O G I N</h2>
					<p id="text" style="font-family: 'Noto Sans KR', sans-serif;">Please
						enter your Id and Password</p>
					<hr class="style-one">
				</div>

					<div class="form-group-input">
						<div class="form-group">
							<input type="text" class="form-control" id="id" placeholder="ID"
								name="id">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="pw"
								placeholder="PASSWORD" name="pw">
						</div>
					</div>

					<div class="forgot">
					 <a id="forgotPw" href="/user/forgotPw">비밀번호를 잊어버리셨습니까?</a>
					</div>
					<br>
					<button type="button" class="btn btn-primary" id="submit-button">Login</button>

						<div class="fail">
							<h3 id="fail"></h3>
						</div>
			</div>
		</div>
	</div>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>