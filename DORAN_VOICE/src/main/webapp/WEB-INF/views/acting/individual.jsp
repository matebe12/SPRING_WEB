<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Doran 개인 연기</title>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<!--  font  -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#newBtn').on("click", function(evt) {
					if ($('#id').val() == '') {
						alert('로그인을 해주세요');
						self.location = "login";
					} else {
						self.location = "actingwrite";
					}
				});
				$('#searchBtn').on(
						"click",
						function(evt) {
							self.location = "individual"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());

						});

			});
</script>
<style>
.body {
	display: -webkit-inline-flex;
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

table {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12pt;
	width: 100%;
}

li {
	list-style: none;
	padding-bottom: 5px;
	padding-top: 5px;
}

.container {
	width: 70%;
	margin: 0 auto;
	margin-top: 3%;
	padding: 1%;
	float: left;
	border: 4px solid #2B3946;
	box-shadow: 5px 5px 10px silver;
	border-radius: 4px;
	-webkit-animation: fadein 2s;
}

.style-one { /*hr*/
	height: 1px;
	background: #bbb;
	background-image: -webkit-linear-gradient(left, #eee, #777, #eee);
	background-image: -moz-linear-gradient(left, #eee, #777, #eee);
	background-image: -ms-linear-gradient(left, #eee, #777, #eee);
	background-image: -o-linear-gradient(left, #eee, #777, #eee);
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

button {
	outline: 0;
	border: 0;
	background-color: #2B3946;
	color: white;
}

@-webkit-keyframes fadein { /* Safari and Chrome */ from { opacity:0;
	
}

to {
	opacity: 1;
}
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp" />

	<div class="side-menu">
		<p align="center"
			style="padding-top: 10px; padding-bottom: 10px; background: #2B3946; color: white;">연기자랑</p>
		<li><a href="/individual">개인연기</a></li>
		<li><a href="/team">소규모팀연기</a></li>
		<li><a href="/monitor">연기모니터링</a></li>
	</div>

	<div class="container">

		<div id="doran">
			<h1
				style="font-family: 'Noto Sans KR', sans-serif; font-size: 35pt; font-weight: bold; padding-bottom: 10px;">개인
				연기</h1>
		</div>
		<table class="table table-striped table-hover" id="listTable">

			<tr style="background: #2B3946; color: white">

				<td>
					<p align="center">카테고리</p>
				</td>

				<td>

					<p align="center">글번호</p>

				</td>

				<td>

					<p align="center">제목</p>

				</td>

				<td>

					<p align="center">작성자</p>

				</td>

				<td>

					<p align="center">작성일</p>

				</td>

				<td>

					<p align="center">조회수</p>

				</td>

			</tr>

			<c:forEach items="${list}" var="list">


				<tr>

					<td>${list.category}</td>
					<td>${list.bno }</td>

					<td><a href='/actingread?bno=${list.bno}'
						style="font-weight: bold;"> ${list.title} </a></td>

					<td>${list.writer}</td>

					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${list.regdate}" /></td>

					<td><span class="badge bg-red">${list.viewcnt }</span></td>

				</tr>

			</c:forEach>

		</table>

		<c:if test="${pageMaker.prev}">

			<a
				href='<c:url value="/individual?page=${pageMaker.startPage - 1}"/>'>«</a>

		</c:if>



		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
			var="idx">


			<a href='<c:url value="/individual?page=${idx}"/>'
				style="font-size: 17pt; font-weight: bold;">${idx}</a>

		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">

			<a href='<c:url value="/individual?page=${pageMaker.endPage + 1}"/>'>
				» </a>

		</c:if>

		<br>



		<div class="search" style="margin-top: 5px; margin-bottom: 5px;">
			<select name="searchType" style="height: 40px;">
				<option value="n"
					<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				<option value="t"
					<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				<option value="c"
					<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				<option value="w"
					<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				<option value="tc"
					<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
			</select> <input type="text" name='keyword' id="keywordInput"
				value='${scri.keyword }' style="height: 40px;">

			<button type="button" id='searchBtn'
				style="color: white; height: 41px; width: 60px;">검색</button>

			<input type="hidden" name="id" id="id" value="${regist.id}">
			<button id="newBtn"
				style="color: white; height: 41px; float: right; width: 100px">글쓰기</button>
		</div>

	</div>
	<!-- container / end -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>