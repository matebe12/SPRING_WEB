<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ DORAN | home ]</title>
<jsp:include page="${pageContext.request.contextPath}/resources/common/common.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet">
	
<script>
      $(document).ready(function() {
          $('.display-3').fadeOut();
        
      });
    </script>
</head>

<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
	<div class="overlay"></div>
	<video playsinline="playsinline" autoplay="autoplay" muted="muted"
		loop="loop" style="height:700px;">
		<source src="http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
			type="video/mp4">
	</video>
	<div class="container h-100">
		<div class="d-flex text-center h-100">
			<div class="my-auto w-100 text-black">
				<h2 class="display-3" style="color: #F2F2F2; margin-top: 29%;">Welcome
					To</h2>
				<h1 class="display-3" style="color: #F2F2F2; font-size: 150px;">Doran
					Voice</h1>

			</div>
		</div>
	</div>
<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>

</body>

</html>