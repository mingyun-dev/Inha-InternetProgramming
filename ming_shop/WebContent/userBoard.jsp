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
			<div class="container" style="width: 1000px">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd"
					id="boardList">



					<tr>

						<th
							style="background-color: #eeeeee; text-align: center; width: 50px;">번호</th>

						<th
							style="background-color: #eeeeee; text-align: center; width: 200px">게시글
							제목</th>

						<th
							style="background-color: #eeeeee; text-align: center; width: 80px">작성자</th>

						<th
							style="background-color: #eeeeee; text-align: center; width: 80px">작성일</th>
					

					</tr>


				</table>
				<div style="text-align: center;">
				<input type="button" onclick="gowrite()" class="button"
							value="글쓰기" />
				</div>

				<script>
					allshopdata();

					var number = 1;

					function allshopdata() {

						shoptable = document.getElementById("boardList");
						var board_data = firebase.database().ref('board');
						board_data.once('value', function(snapshot) {
							snapshot.forEach(function(childSnapshot) {
								var tmp = childSnapshot.val();

								new_tr = document.createElement("tr");

								td_number = document.createElement("td");
								td_number.innerHTML = number;
								new_tr.appendChild(td_number);

								td_title = document.createElement("td");
								td_title.innerHTML = tmp.board_title;
								td_title.setAttribute("onclick", "goshow(\""
										+ tmp.board_key + "\")");
								new_tr.appendChild(td_title);

								td_id = document.createElement("td");
								td_id.innerHTML = tmp.board_id;
								new_tr.appendChild(td_id);

								td_date = document.createElement("td");
								td_date.innerHTML = tmp.board_date;
								new_tr.appendChild(td_date);
								
								
								
								
								shoptable.appendChild(new_tr);
								number++;
							});
						});
					}
					
					function goshow(key) {
						
						location.href="userShowBoard.jsp?key="+key;
					}
					
					
					function goview() {
						location.href="newindex.jsp";
					}
					
					function gowrite() {
						location.href="userWriteBoard.jsp";
					}
					
					
					
				</script>



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