<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="${pageContext.request.contextPath}/resources/common/common.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<div class='menu'>

		<ul>
			<li class="doranlogo">
				<button>
					<img src="${pageContext.request.contextPath}/resources/image/doran_logo.png" id="doranlogo"
						style="height: 42px; padding-top: 1px;"
						onclick="location.href = '/'">
				</button>
			</li>
			
			<li class='active sub'><a href='#'>도란보이스</a>
				<ul>
			<li><a href='introduce'>도란보이스란?</a></li>
			<li><a href='noticelist'>공지사항</a></li>
				</ul></li>
			<li class='active sub'><a href='#'>대본</a>
				<ul>
					<li class='sub'><a href='/broadcaster'>방송대본</a></li>
					<li class='sub'><a href='/movie'>영화대본</a></li>
					<li class='sub'><a href='/radio'>라디오드라마대본</a></li>
					<li class='sub'><a href='/creation'>창작대본</a></li>
				</ul></li>
			<li class='active sub'><a href='#'>연기자랑</a>
				<ul>
					<li class='sub'><a href='/individual'>개인연기</a></li>
					<li class='sub'><a href='/team'>소규모팀연기</a></li>
					<li class='sub'><a href='/monitor'>연기모니터링</a></li>
				</ul></li>
			<li class='active sub'><a href='#'>커뮤니티</a>
				<ul>
					<li class='sub'><a href='/free'>자유게시판</a></li>
					<li><a href="https://namu.wiki/w/%EC%84%B1%EC%9A%B0/%EC%97%AD%EC%82%AC" target="_blank">성우역사</a>
					<li class='sub'><a href='/tip'>소소한 팁</a></li>
				</ul></li>

			<li class='active sub'><a href=''>방송국 공채</a>
				<ul>
					<li class='sub'><a href='http://nbbs.kbs.co.kr/section/board/bbs_list.html?goto_page=1&bbs_cd=etc_gonggi_01&search_id=&search_target=&kwd=%EC%84%B1%EC%9A%B0' target="_blank">KBS 공채</a></li>
					<li class='sub'><a href='https://recruit.imbc.com' target="_blank">MBC 공채</a></li>
					<li class='sub'><a href='https://about.ebs.co.kr/kor/organization/recruit?tabVal=notice' target="_blank">EBS 공채</a></li>
					<li class='sub'><a href='http://www.aniboxtv.com/community/notice.php/' target="_blank">대원방송 공채</a></li>
					<li class='sub'><a href='http://recruit.cj.net/recruit/ko/recruit/recruit/list.fo' target="_blank">투니버스 공채</a></li>
					<li class='sub'><a href='http://kvpa.co.kr/' target="_blank">성우협회</a></li>
				</ul></li>
			<c:if test="${user == null }">
				<li class="header-button">
					<button id="header-login-btn" onclick="location.href = '/user/login' ">로그인</button>
					<button id="header-regist-btn" onclick="location.href = '/user/regist' ">회원가입</button>
				</li>
			</c:if>
			<c:if test="${user != null}">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">${user.resultUser.USER_NAME}님 <span class="caret"></span></a>
					<ul class="active sub">
						<li class="sub"><a href="/userInfo">내 정보</a></li>
						<li class="sub"><a href="/withdrawal">회원 탈퇴</a></li>
						<li class="sub"><a href="/logout">로그아웃</a></li>
					</ul></li>
			</c:if>

		</ul>
	</div>

</body>
</html>