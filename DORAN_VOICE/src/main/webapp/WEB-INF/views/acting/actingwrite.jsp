<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Doran 게시물 등록</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!--  font  -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<script>
	$(document).ready(function() {
		$("#list").click(function() {
			location.href = "backPage";
		});

		$("#submit").click(function() {
			if ($("#category").val() == "") {
				alert("게시판 카테고리를 선택해주세요");
				return false;
			}
			if ($("#content").val().length < 5) {
				alert("내용을 5자 이상 써주세요");
				return false;
			}
			if ($("#title").val().length < 5) {
				alert("제목을 5자 이상 써주세요");
				return false;
			}
		});

		$("#filename").change(function() {
			alert("업로드중 입니다 잠시만 기다려주세요");

			var formDatall = $('#write').serialize();

			var query = {
				category : $('#id').val(),
				title : $('#title').val(),
				writer : $('#writer').val(),
				content : $('#content').val(),
				filename : $('#filename').val()
			};
			var formData = new FormData();

			var inputFile = $("input[name='uploadFile']");

			var files = inputFile[0].files;

			console.log(files);
			for (var i = 0; i < files.length; i++) {
				formData.append("uploadFile", files[i]);
			}
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				success : function(data) {
					alert("업로드맨");
					$('#content').add
				},
				error : function() {
					alert("안됨");
				}
			});// ajax

		});
	});
</script>
<style>
@font-face { font-family: 'YiSunShinDotumM'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff') format('woff'); font-weight: normal; font-style: normal; }
.container {
	display: -webkit-inline-flex;
}

form {
	margin: 0 auto;
}

#write {
	margin: 0 auto;
	padding-top: 5%;
}

#submit, #list {
	float: right;
	outline: 0;
	border: 0;
	background-color: #2B3946;
	color: white;
}

.has-feeedback {
	padding: 20px;
	text-align: center;
	border: 4px solid #2B3946;
	box-shadow: 5px 5px 10px silver;
	border-radius: 4px;
	-webkit-animation: fadein 2s;
}

.side-menu {
	float: left;
	margin: 4%;
	margin-left: 10%;
	width: 10%;
	text-align: center;
	-webkit-animation: fadein 2s;
	border: 4px solid #2B3946;
	box-shadow: 5px 5px 10px silver;
	border-radius: 4px;
	font-family: 'YiSunShinDotumM', sans-serif;
	font-size: 15pt;
	font-weight: bold;
}

li {
	list-style: none;
	padding-bottom: 5px;
	padding-top: 5px;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}

@
-webkit-keyframes fadein { /* Safari and Chrome */ from { opacity:0;
	
}

to {
	opacity: 1;
}
}
</style>


</head>
<body class="actingwrite-body">
	<jsp:include page="../header.jsp" />

	<div class="side-menu">
		<p align="center"
			style="padding-top: 10px; padding-bottom: 10px; background: #2B3946; color: white;">연기자랑</p>
		<li><a href="/individual">개인연기</a></li>
		<li><a href="/team">소규모팀연기</a></li>
		<li><a href="/monitor">연기모니터링</a></li>
	</div>

	<div class="container">

		<form name="nse" id="write" enctype="multipart/form-data"
			action="actingwritepro" method="post">

			<div class="form-group has-feeedback">

				<select class="form-control form-control-lg" name="category"
					id="category" style="width: 1000px;">
					<option selected value="">게시판 선택</option>
					<option value="개인연기">개인연기</option>
					<option value="소규모 팀 연기">소규모 팀 연기</option>
					<option value="연기 모니터링">연기 모니터링</option>
				</select> <br>

				<div class="form-group has-feedback">
					<input class="form-control" type="text" name="title" id="title"
						style="width: 1000px;" placeholder="제목" />
				</div>
				<input type="hidden" id="writer" name="writer" value="${regist.id}">
				<textarea name="content" id="content" class="nse_content" rows="10"
					cols="100" style="width: 1000px; height: 412px;"></textarea>

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
						// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

						try {
							elClickedObj.form.submit();
						} catch (e) {
						}
					}
				</script>
				<div class="row form-group">
					<label class="col-lg-2">첨부파일</label>
					<div class="col-lg-10">
						<div class="uploadDiv">
							<input type="file" name="uploadFile" id="filename" multiple>
							<button id="submit" type="submit" class="btn btn-default"
								onclick="submitContents(this)"
								style="border-radius: 0; width: 50px;">확인</button>
							<button type="button" id="list" class="btn btn-default"
								style="border-radius: 0; width: 50px;">목록</button>
						</div>
					</div>
				</div>


			</div>
		</form>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>