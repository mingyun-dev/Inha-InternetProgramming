<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html>
<html>
<head>
<title>MING's SHOPPING MALL</title>

<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 부트스트랩 CSS 추가하기 -->

<link rel="stylesheet" href="./css/bootstrap.min.css">

<!-- 커스텀 CSS 추가하기 -->
</head>
<link rel="stylesheet" href="./css/custom.css">
<link rel="stylesheet" href="assets/css/main.css" />
<!-- The core Firebase JS SDK is always required and must be listed first -->

<script src="https://www.gstatic.com/firebasejs/7.4.0/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use https://firebase.google.com/docs/web/setup#available-libraries -->
<script
	src="https://www.gstatic.com/firebasejs/7.4.0/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-auth.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/3.1.0/firebase-database.js"></script>
<body class="homepage is-preload">


	<script src="https://www.gstatic.com/firebasejs/5.5.9/firebase.js"></script>
	<script>
		// Initialize Firebase
		var firebaseConfig = {
			apiKey : "AIzaSyAfyOLf2EfPBmKF8kRisiLhiAFWF8n5mZI",
			authDomain : "ming-72780.firebaseapp.com",
			databaseURL : "https://ming-72780.firebaseio.com",
			projectId : "ming-72780",
			storageBucket : "ming-72780.appspot.com",
			messagingSenderId : "1058417843075",
			appId : "1:1058417843075:web:e978ff8e4382c98f6434b6"
		};
		firebase.initializeApp(firebaseConfig);
	</script>
	<script>
		function myjsplogin() {
			var id = document.getElementById("id").value;
			var pw = document.getElementById("pwd").value;

			if (id == "ming") {
				if (pw == "ming") {
					alert("관리자로 로그인 하셨습니다.");
					location.href = "admin.jsp";
				} else {
					alert("잘못된 비밀번호입니다");
				}
			} else {
				alert("잘못된 ID입니다.")
			}
		}
	</script>



	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">

			<!-- Logo -->
			<h1>
				<a href="newindex.jsp">Ming's DISNEY</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="newindex.jsp">Main</a></li>
					<li class="current"><a href="#">Member</a>
						<ul>


							<li><a href="userLogin.jsp">Log-in</a></li>
							<li><a href="userRegister.jsp">Sign-up</a></li>






						</ul></li>
					<li><a href="shopping.jsp">Shopping</a></li>
					<li><a href="userCart.jsp">Cart</a></li>
					<li><a href="userOrder.jsp">My Order</a>
					<li><a href="userBoard.jsp">Board</a></li>
				</ul>
			</nav>

		</section>



		<!-- Main -->
		<section id="main">
			<div class="container" style="max-width: 560px;">

				<!-- Content -->
				<article class="box post">

					<header style="text-align: center;">
						<h2>
							<small>Admin Log-in</small>
						</h2>


					</header>


					<form id="form1" method="POST">




						<header>

							<h3>Admin ID</h3>
							<input type="text" id="id" class="form-control" />

						</header>

						<header>

							<h3>Password</h3>
							<input type="password" id="pwd" class="form-control" />

						</header>


						<input type="button" onclick="myjsplogin()" value="로그인"
							class="button alt"> 
						<br> <input type="hidden">
					</form>





				</article>

			</div>
		</section>

	</div>


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>