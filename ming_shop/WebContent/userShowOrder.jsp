<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<%
		String USERID = (String) request.getSession().getAttribute("id");
	%>
	<%
		String key = (String) request.getParameter("key");
	%>
	<script>
		key = parseInt("<%=key%>");
	
		
		function goback() {
			location.href="userOrder.jsp"
		}
	</script>

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
					<li><a href="shopping.jsp">Shopping</a></li>
					<li><a href="userCart.jsp">Cart</a></li>
					<li class="current"><a href="userOrder.jsp">My Order</a>
					<li ><a href="userBoard.jsp">Board</a></li>
				</ul>
			</nav>
		</section>
		
		
		<section id="main">
			<div class="container" style="width: 1000px;">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3"
									style="background-color: #eeeeee; text-align: center;">내 주문 보기</th>
							</tr>
						</thead>

						<tbody id="showboard" >
							
						</tbody>
					</table>
	
					<input type="button" onclick="goback()" class="button alt"
							value="목록보기" />
				</div>
				<script>
				show_board();
				function show_board() {
					var userID="<%=USERID%>";
					
					var board_data = firebase.database().ref('orderList/'+userID+'/'+key);
					board_data.once('value', function(snapshot) {
						var tmp = snapshot.val();
						
						sboard = document.getElementById("showboard");
						
						new_tr = document.createElement("tr");
						
						td_number = document.createElement("td");
						td_number.innerHTML = "주문번호";
						td_number.setAttribute("style","width: 20%;");
						new_tr.appendChild(td_number);
						
						td_title = document.createElement("td");
						td_title.innerHTML = tmp.user_key;
						td_title.setAttribute("colspan","2");
						new_tr.appendChild(td_title);
						
						sboard.appendChild(new_tr);
						
						new_tr2 = document.createElement("tr");
						
						td_id = document.createElement("td");
						td_id.innerHTML = "주문자 이름";
						td_id.setAttribute("style","width: 20%;");
						new_tr2.appendChild(td_id);
						
						td_writer = document.createElement("td");
						td_writer.innerHTML = tmp.user_name;
						td_writer.setAttribute("colspan","2");
						new_tr2.appendChild(td_writer);
						
						sboard.appendChild(new_tr2);
						
						new_tr2 = document.createElement("tr");
						
						td_id = document.createElement("td");
						td_id.innerHTML = "주문 날짜";
						td_id.setAttribute("style","width: 20%;");
						new_tr2.appendChild(td_id);
						
						td_writer = document.createElement("td");
						td_writer.innerHTML = tmp.user_date;
						td_writer.setAttribute("colspan","2");
						new_tr2.appendChild(td_writer);
						
						sboard.appendChild(new_tr2);
						
						new_tr2 = document.createElement("tr");
						
						td_id = document.createElement("td");
						td_id.innerHTML = "주문 총 금액";
						td_id.setAttribute("style","width: 20%;");
						new_tr2.appendChild(td_id);
						
						td_writer = document.createElement("td");
						td_writer.innerHTML = "$"+ tmp.user_total;
						td_writer.setAttribute("colspan","2");
						new_tr2.appendChild(td_writer);
						
						sboard.appendChild(new_tr2);
						
						new_tr2 = document.createElement("tr");
						
						td_id = document.createElement("td");
						td_id.innerHTML = "배송 주소";
						td_id.setAttribute("style","width: 20%;");
						new_tr2.appendChild(td_id);
						
						td_writer = document.createElement("td");
						td_writer.innerHTML = tmp.user_adress;
						td_writer.setAttribute("colspan","2");
						new_tr2.appendChild(td_writer);
						
						sboard.appendChild(new_tr2);
						
						new_tr2 = document.createElement("tr");
						
						td_id = document.createElement("td");
						td_id.innerHTML = "핸드폰 번호";
						td_id.setAttribute("style","width: 20%;");
						new_tr2.appendChild(td_id);
						
						td_writer = document.createElement("td");
						td_writer.innerHTML = tmp.user_phone;
						td_writer.setAttribute("colspan","2");
						new_tr2.appendChild(td_writer);
						
						sboard.appendChild(new_tr2);
						
						new_tr2 = document.createElement("tr");
						
						td_id = document.createElement("td");
						td_id.innerHTML = "배송 메세지";
						td_id.setAttribute("style","width: 20%;");
						new_tr2.appendChild(td_id);
						
						td_writer = document.createElement("td");
						td_writer.innerHTML = tmp.user_message;
						td_writer.setAttribute("colspan","2");
						new_tr2.appendChild(td_writer);
						
						sboard.appendChild(new_tr2);
					});
				}
				
				</script>
			</div>
		</section>
	</div>
</body>
</html>