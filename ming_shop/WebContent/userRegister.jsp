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
		var user_data = firebase.database().ref('user_data');

		var data = new Array();
		user_data.on('value', function(snapshot) {
			data.splice(0, data.length);
			snapshot.forEach(function(childSnapshot) {
				var childData = childSnapshot.val();
				data.push(childData.user_id);
			});
		});

		function signup() {
			var id = document.getElementById("userID").value;
			var pw = document.getElementById("userPassword").value;
			var phone = document.getElementById("userPhone").value;
			var name = document.getElementById("userName").value;
			var adress = document.getElementById("userAdress").value;
			var email = document.getElementById("userEmail").value;
			var again = document.getElementById("again").value;

			var user_data = firebase.database().ref('user_data/' + id);

			if (again != pw) {
				alert("비밀번호를 다시 확인해 주세요");
			} else {
				if (document.getElementById("userID").disabled) {
					user_data.set({
						user_id : id,
						user_pw : pw,
						last_login : getTimeStamp()
					});
					myProfile(id, phone, name, adress, email);
					alert("회원가입이 완료되었습니다");

					var form = document.getElementById("form1");
					form.setAttribute("action", "./RegisterServlet?regisid="
							+ id + "");
					form.submit();

					//location.href = "userLogin.jsp"
				} else {
					alert("아이디 중복확인을 눌러주세요");
				}

			}
		}

		function myProfile(id, phone, name, adress, email) {
			var user_ref = firebase.database().ref('user_profile/' + id);
			user_ref.set({
				user_name : name,
				user_phone : phone,
				user_adress : adress,
				user_email : email,

			});
		}

		function mycheck() {
			var id = document.getElementById("userID").value;
			var checked = 0;

			data.forEach(function(tmp) {
				if (tmp == id) {
					alert("이미 사용중인 아이디입니다");
					checked = 1;
				}
			});
			if (checked == 0) {
				alert("사용 가능한 아이디입니다");
				document.getElementById("userID").disabled = true;
			}
		}

		function getTimeStamp() {
			var d = new Date();
			var s = leadingZeros(d.getFullYear(), 4) + '-'
					+ leadingZeros(d.getMonth() + 1, 2) + '-'
					+ leadingZeros(d.getDate(), 2) + ' ' +

					leadingZeros(d.getHours(), 2) + ':'
					+ leadingZeros(d.getMinutes(), 2) + ':'
					+ leadingZeros(d.getSeconds(), 2);

			return s;
		}

		function leadingZeros(n, digits) {
			var zero = '';
			n = n.toString();

			if (n.length < digits) {
				for (i = 0; i < digits - n.length; i++)
					zero += '0';
			}
			return zero + n;
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
							<li><a href="adminLogin.jsp">Admin Log-in</a></li>




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
			<div class="container" style="max-width: 700px;">

				<!-- Content -->
				<article class="box post">

					<header style="text-align: center;">
						<h2>
							<small>Sign-up</small>
						</h2>


					</header>


					<form id="form1" method="POST">




						<header>
							<h3>User ID</h3>
							<input type="text" id="userID" name="username"
								class="form-control" />

						</header>

						<input type="button" onclick="mycheck()" id="check" value="중복 확인"
							class="button alt">


						<header>
							<h3>Password</h3>
							<input type="password" id="userPassword" name="pwd"
								class="form-control" />
						</header>

						<header>
							<h3>Confirm Password</h3>
							<input type="password" id="again" name="again"
								class="form-control" />
						</header>

						<header>
							<h3>Name</h3>
							<input type="text" id="userName" class="form-control" />
						</header>

						<header>
							<h3>Address</h3>
							<input type="text" id="userAdress" class="form-control" />
						</header>

						<header>
							<h3>Phone Number</h3>
							<input type="text" id="userPhone" class="form-control" />
						</header>

						<header>
							<h3>Email</h3>
							<input type="text" id="userEmail" class="form-control" />
						</header>


					</form>
					<br> <input type="button" onclick="signup()" value="회원가입"
						class="button alt">




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