<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>admin</title>
</head>
<body>
	<h3>ȸ�� ����</h3>
	<table id="infotable" border=1>
		<tr>
			<td>ID</td>
			<td>�̸�</td>
			<td>�̸���</td>
			<td>�ڵ�����ȣ</td>
			<td>�ּ�</td>
			<td>���ӽð�</td>
			<td>����</td>
		</tr>
	</table>
	<br>
	<br>
	<h3>��ǰ ����</h3>
	<table id="goodsList" border=1>
		<tr>
			<td>��ǰ �̸�(�ѱ�)</td>
			<td>��ǰ �̸�(����)</td>
			<td>��ǰ �̹��� url</td>
			<td>��ǰ ����</td>
			<td>����</td>
		</tr>
	</table>
	<br>
	<button onclick="goodsRegister()">��ǰ �߰�</button>
	<br>
	<Br>
	<h3>�Խ��� ����</h3>
	<table id="boardList" border=1>
		<tr>
			<td>DB �Խñ� ��ȣ</td>
			<td>�Խù� �ۼ���</td>
			<td>�Խù� ����</td>
			<td>�Խù� ��¥</td>
			<td>����</td>
		</tr>
	</table>
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
		allUserdata();

		allshopdata();
		
		allboarddata();

		function goodsRegister() {
			location.href = "goodsRegister.jsp"
		}
		function board_del_click(key) {
			alert("DB number: " + key);
			var user_data = firebase.database().ref('board/' + key);
			user_data.remove();
			alert("���� �Ϸ�");
			location.reload(true);
		}
		function del_click(id) {
			alert("id:" + id);
			var user_data = firebase.database().ref('user_data/' + id);
			user_data.remove();
			var user_prof = firebase.database().ref('user_profile/' + id);
			user_prof.remove();
			alert("���� �Ϸ�");
			location.reload(true);
		}
		function shop_del_click(name) {
			alert("name:" + name);
			var goods_data = firebase.database().ref('goodsList/' + name);
			goods_data.remove();
			alert("���� �Ϸ�");
			location.reload(true);
		}
		function allUserdata() {
			var user_data = firebase.database().ref('user_data');
			user_data.once('value', function(snapshot) {
				snapshot.forEach(function(childSnapshot) {
					var tmp = childSnapshot.val();
					allUserProfile(tmp.user_id, tmp.last_login);
				});
			});
		}
		function allUserProfile(id, time) {
			table = document.getElementById("infotable");
			var user_data = firebase.database().ref('user_profile/' + id);
			user_data.once('value', function(snapshot) {
				var tmp = snapshot.val();

				new_tr = document.createElement("tr");

				td_id = document.createElement("td");
				td_id.innerHTML = id;
				new_tr.appendChild(td_id);

				td_name = document.createElement("td");
				td_name.innerHTML = tmp.user_name;
				new_tr.appendChild(td_name);

				td_grade = document.createElement("td");
				td_grade.innerHTML = tmp.user_email;
				new_tr.appendChild(td_grade);

				td_major = document.createElement("td");
				td_major.innerHTML = tmp.user_phone;
				new_tr.appendChild(td_major);

				td_sex = document.createElement("td");
				td_sex.innerHTML = tmp.user_adress;
				new_tr.appendChild(td_sex);

				td_time = document.createElement("td");
				td_time.innerHTML = time;
				new_tr.appendChild(td_time);

				del_btn = document.createElement("input");
				del_btn.setAttribute("type", "button");
				del_btn.setAttribute("onclick", "del_click(\"" + id + "\")");
				del_btn.setAttribute("value", "����");
				new_tr.appendChild(del_btn);

				table.appendChild(new_tr);
			});
		}
		function allshopdata() {
			shoptable = document.getElementById("goodsList");
			var user_data = firebase.database().ref('goodsList');
			user_data.once('value', function(snapshot) {
				snapshot.forEach(function(childSnapshot) {
					var tmp = childSnapshot.val();

					new_tr = document.createElement("tr");

					td_goodskorean = document.createElement("td");
					td_goodskorean.innerHTML = tmp.goodskorean;
					new_tr.appendChild(td_goodskorean);

					td_goodsname = document.createElement("td");
					td_goodsname.innerHTML = tmp.goodsname;
					new_tr.appendChild(td_goodsname);

					td_goodsimg = document.createElement("td");
					td_goodsimg.innerHTML = tmp.goodsimg;
					new_tr.appendChild(td_goodsimg);

					td_goodsprice = document.createElement("td");
					td_goodsprice.innerHTML = tmp.goodsprice;
					new_tr.appendChild(td_goodsprice);

					del_btn = document.createElement("input");
					del_btn.setAttribute("type", "button");
					del_btn.setAttribute("onclick", "shop_del_click(\""
							+ tmp.goodsname + "\")");
					del_btn.setAttribute("value", "����");
					new_tr.appendChild(del_btn);

					shoptable.appendChild(new_tr);
				});
			});
		}
		function allboarddata() {
			boardtable = document.getElementById("boardList");
			var board_data = firebase.database().ref('board');
			board_data.once('value', function(snapshot) {
				snapshot.forEach(function(childSnapshot) {
					var tmp = childSnapshot.val();

					new_tr = document.createElement("tr");
					
					td_key = document.createElement("td");
					td_key.innerHTML = tmp.board_key;
					new_tr.appendChild(td_key);

					td_goodskorean = document.createElement("td");
					td_goodskorean.innerHTML = tmp.board_id;
					new_tr.appendChild(td_goodskorean);

					td_goodsname = document.createElement("td");
					td_goodsname.innerHTML = tmp.board_title;
					new_tr.appendChild(td_goodsname);

					td_goodsimg = document.createElement("td");
					td_goodsimg.innerHTML = tmp.board_date;
					new_tr.appendChild(td_goodsimg);

					del_btn = document.createElement("input");
					del_btn.setAttribute("type", "button");
					del_btn.setAttribute("onclick", "board_del_click(\""
							+ tmp.board_key + "\")");
					del_btn.setAttribute("value", "����");
					new_tr.appendChild(del_btn);

					boardtable.appendChild(new_tr);
				});
			});
		}
	</script>
</body>
</html>