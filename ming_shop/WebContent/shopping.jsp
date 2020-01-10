<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String USERID = (String) request.getSession().getAttribute("id");
	if (session.getAttribute("USERID") != null) {
		USERID = (String) session.getAttribute("USERID");
	} else {
		PrintWriter script = response.getWriter();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style_main.css">
<script src="https://www.gstatic.com/firebasejs/5.6.0/firebase.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
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
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">
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
					<li class="current"><a href="shopping.jsp">Shopping</a></li>
					<li><a href="userCart.jsp">Cart</a></li>
					<li><a href="userOrder.jsp">My Order</a>
					<li><a href="userBoard.jsp">Board</a></li>
				</ul>
			</nav>
		</section>

		<section id="main">
			<div class="container">


				<div class="row" id="row"></div>


				<script>
					movies = new Array();
					window.onload = function() {
						var movie_data = firebase.database().ref('goodsList');
						movie_data.once('value', function(snapshot) {
							snapshot.forEach(function(childSnapshot) {
								var tmp = childSnapshot.val();
								movies.push(tmp.goodsname);
							});
						});
					}

					
					rowtable = document.getElementById("row");
					var movie_data = firebase.database().ref('goodsList');
					movie_data.once('value', function(snapshot) {
						snapshot.forEach(function(childSnapshot) {
							var tmp = childSnapshot.val();
							
							new_div = document.createElement("div");
							new_div.setAttribute("class", "col-4 col-12-medium");
							
							new_section=document.createElement("section");
							new_section.setAttribute("class", "box");
							
							
							a_img = document.createElement("a");
							a_img.setAttribute("class", "image featured");
							a_img.setAttribute("href", "#");
							img = document.createElement("img");
							img.setAttribute("name", tmp.goodsname);
							img.setAttribute("src", tmp.goodsimg);
							a_img.appendChild(img);
							new_section.appendChild(a_img);

							var title = tmp.goodskorean;
							movieTitle = document.createElement("h3");
							movieTitle.innerHTML = title;
							new_section.appendChild(movieTitle);
							
							var price = tmp.goodsprice;
							new_p = document.createElement("p");
							new_p.innerHTML = "$"+price;
							new_section.appendChild(new_p);
							
							forms=document.createElement("form");
							forms.setAttribute("id","form1");
							forms.setAttribute("method","POST");
							btn = document.createElement("a");
							btn.setAttribute("class", "button alt");
							btn.setAttribute("onclick", "goshow(\"" + tmp.goodsname + "\")");
							btn.innerHTML = "상세보기";
							forms.appendChild(btn);
							new_section.appendChild(forms);
							
							new_div.appendChild(new_section);
							rowtable.appendChild(new_div);

						});
					});
					
					function goshow(name){
						
						 var form = document.getElementById("form1");
			             form.setAttribute("action", "./ShoppingServlet?goodsName="+name+"");
			             form.submit();
			              
					}

					function reserve(title) {
						location.href = "reserve.jsp";
					}

					function imgClick(engtitle) {
						location.href = "movieDetail.jsp?img=" + engtitle + "";
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