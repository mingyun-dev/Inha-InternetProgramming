<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String USERID = (String) request.getSession().getAttribute("id");
%>


<!DOCTYPE HTML>
<html>
<head>
<title>Ming's DISNEY</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<script src="https://www.gstatic.com/firebasejs/5.6.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var firebaseConfig = {
    apiKey: "AIzaSyAfyOLf2EfPBmKF8kRisiLhiAFWF8n5mZI",
    authDomain: "ming-72780.firebaseapp.com",
    databaseURL: "https://ming-72780.firebaseio.com",
    projectId: "ming-72780",
    storageBucket: "ming-72780.appspot.com",
    messagingSenderId: "1058417843075",
    appId: "1:1058417843075:web:e978ff8e4382c98f6434b6"
  };
  firebase.initializeApp(firebaseConfig);
</script>
<body class="homepage is-preload">
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
					<li><a href="#">Member</a>
						<ul>
							<%
								if (USERID == null) {
							%>

							<li><a href="userLogin.jsp">Log-in</a></li>
							<li><a href="userRegister.jsp">Sign-up</a></li>
							<li><a href="adminLogin.jsp">Admin Log-in</a></li>

							<%
								} else {
							%>
							<li><a href="userLogout.jsp">Log-out</a></li>

							<%
								}
							%>

						</ul></li>
					<li><a href="shopping.jsp">Shopping</a></li>
					<li><a href="userCart.jsp">Cart</a></li>
					<li><a href="userOrder.jsp">My Order</a>
					<li class="current"><a href="userBoard.jsp">Board</a></li>
				</ul>
			</nav>
		</section>

		<section id="main">
			<div class="container">


				<div style="width: 1000px; margin: 0 auto;">
					<form method="post" name="addBoard">
						<table style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2"
										style="background-color: #eeeeee; text-align: center;">게시판
										글쓰기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" id="title" class="form-control"
										placeholder="글 제목" name="bbsTitle" maxlength="50" /></td>
								</tr>
								<tr>
									<td><textarea id="contents" class="form-control"
											placeholder="글 내용" name="bbsContent" maxlength="2048"
											style="height: 350px;"></textarea></td>
								</tr>
							</tbody>
						</table>
						<input type="button" onclick="register()" class="button alt"
							value="글쓰기" />
						<input type="button" onclick="goback()" class="button alt"
							value="돌아가기" />
					</form>

					<script>
			function goback(){
				history.back();
			}
			
			function getTimeStamp() {
			      var d = new Date();
			      var s =
			      leadingZeros(d.getFullYear(), 4) + '-' +
			      leadingZeros(d.getMonth() + 1, 2) + '-' +
			      leadingZeros(d.getDate(), 2);
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
			
			
			function register() {
				var title = document.getElementById("title").value;
				var contents = document.getElementById("contents").value;
				var id = "<%=USERID%>";
							var random = Math.floor(Math.random() * 100000 + 1);
							var d = new Date();
							var year = d.getFullYear();
							var month = d.getMonth();
							var date = d.getDate();
							var hours = d.getHours();
							var minutes = d.getMinutes();
							var seconds = d.getSeconds();
							random = year * 10000000000 + month * 100000000 + date * 1000000 + hours*10000 + minutes*100+seconds;

							if (title == "") {
								alert("게시글의 제목을 입력하세요");
								return;
							}

							if (contents == "") {
								alert("게시글의 내용을 입력하세요");
								return;
							} else {

								board_data = firebase.database().ref(
										'board/' + random);
								board_data.set({
									board_id : id,
									board_title : title,
									board_contents : contents,
									board_date : getTimeStamp(),
									board_key : random
								});

								alert(id + "님의 게시글이 등록되었습니다");
								//goboard();
							}
						}
			function goboard(){
				location.href="userBoard.jsp";
			}
					</script>
				</div>
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