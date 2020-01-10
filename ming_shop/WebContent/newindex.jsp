<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>



<!DOCTYPE HTML>
<html>
<head>
<title>Ming's DISNEY</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<%
  String USERID = (String)request.getSession().getAttribute("id");
  %>


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
					<li class="current"><a href="newindex.jsp">Main</a></li>
					<li><a href="#">Member</a>
						<ul>
							<%
            
            if(USERID==null){
            %>

							<li><a href="userLogin.jsp">Log-in</a></li>
							<li><a href="userRegister.jsp">Sign-up</a></li>
							<li><a href="adminLogin.jsp">Admin Log-in</a></li>

							<%
            }else{
         %>
							<li><a href="userLogout.jsp">Log-out</a></li>

							<%
            }
            %>

						</ul></li>
					<li><a href="shopping.jsp">Shopping</a></li>
					<li><a href="userCart.jsp">Cart</a></li>
					<li><a href="userOrder.jsp">My Order</a>
					<li><a href="userBoard.jsp">Board</a></li>
				</ul>
			</nav>
			<br> <br>
			<!-- Banner -->
			<div class="container" style="max-width: 1000px;">
				<a href="#" class="image featured"><img src="images/woody.jpg"
					alt="" /></a>
			</div>


		</section>

		<!-- Main -->



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