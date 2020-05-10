<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
#write {
	padding-left: 20%;
	margin: 0 auto;
	padding-top: 10%;
}

#submit {
	margin-left: 49%;
}
</style>

<head>
<title>Doran 게시물 수정</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script type="text/javascript"
	src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#submit").click(function() {
			if ($("#category").val() == "") {
				alert("게시판 카테고리를 선택해주세요");
				return false;
			}
			if ($("#content").val().length < 20) {
				alert("내용을 20자 이상 써주세요");
				return false;
			}
			if ($("#title").val().length < 5) {
				alert("제목을 5자 이상 써주세요");
				return false;
			}
		});
	});
</script>


</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
		<form name="nse" action="/actingmodifypro" method="post" id="write">
			<div class="form-group has-feeedback">
				<select class="form-control form-control-lg" name="category"
					id="category" style="width: 700px;">
					<option value="">게시판 선택</option>
					<option value="개인연기">개인연기</option>
					<option value="소규모 팀 연기">소규모 팀 연기</option>
					<option value="연기 모니터링">연기 모니터링</option>
				</select> <br>

				<div class="form-group has-feedback">
					<input class="form-control" type="text" name="title" id="title"
						style="width: 700px;" placeholder="제목" readonly=readonly
						value="${read.title}" />
				</div>
				<input type="hidden" id="writer" name="writer" value="${regist.id}">
				<input type="hidden" id="bno" name="bno" value="${read.bno}">

				<textarea name="content" id="content" class="nse_content" rows="10"
					cols="100" style="width: 700px; height: 412px;">${read.content}</textarea>
				<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
						oAppRef : oEditors,
						elPlaceHolder : "content",
						sSkinURI : "resources/editor/SmartEditor2Skin.html",
						fCreator : "createSEditor2"
					});
					function submitContents(elClickedObj) {

						// 에디터의 내용이 textarea에 적용됩니다.
						oEditors.getById["content"].exec(
								"UPDATE_CONTENTS_FIELD", []);

						try {
							elClickedObj.form.submit();
						} catch (e) {
						}

					}
				</script>

				<button type="submit" value="수정" id="submit"
					onclick="submitContents(this)" class=" btn btn-default">확인</button>
			</div>
		</form>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>