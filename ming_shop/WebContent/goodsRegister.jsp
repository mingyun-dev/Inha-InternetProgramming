<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style_addMovie.css">



</head>
<body>
<!-- The core Firebase JS SDK is always required and must be listed first -->

<script src="https://www.gstatic.com/firebasejs/7.4.0/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use https://firebase.google.com/docs/web/setup#available-libraries -->
<script
   src="https://www.gstatic.com/firebasejs/7.4.0/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-auth.js"></script>
<script
   src="https://www.gstatic.com/firebasejs/3.1.0/firebase-database.js"></script>
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
      function cancel() {
         history.back();
      }
      function register() {
         var koreanname = document.getElementById("koreanname").value;
         var name = document.getElementById("name").value;
         var price = document.getElementById("price").value;
         var imageurl = document.getElementById("imageurl").value;
         var character = document.getElementById("character").value;
         var details = document.getElementById("details").value;
         var moredetails = document.getElementById("moredetails").value;
         moredetails = moredetails.replace("\n", "<br>");

         if (name == "") {
            alert("상품의 영어 이름을 입력하세요");
            return;
         }

        gogo(koreanname,name,price,imageurl,character,details,moredetails);

         alert("상품이 등록되었습니다.");
         
         //var form=document.getElementById("addGoods");
         //form.submit();
         
      }
      function gogo(koreanname,name,price,imageurl,character,details,moredetails) {
    	  
    	  var goods_data = firebase.database().ref('goodsList/' + name);
          goods_data.set({
             goodschar : character,
             goodsdetail : details,
             goodsimg : imageurl,
             goodskorean : koreanname,
             goodsmoredetail : moredetails,
             goodsname : name,
             goodsprice : price
          });
    	  
    	 
      }
   </script>
   <h3>상품 등록하기</h3>
   <form id="addGoods" method="POST" action="./GoodsServlet"> 
      상품 한글 이름 : <input type="text" name="koreanname" id="koreanname"
         style="width: 600px;"><br>
      <br> 상품 영어 이름 : <input type="text" name="name" id="name"
         style="width: 600px;"><br>
      <Br> 상품 가격 : <input type="text" name="price" id="price"
         style="width: 600px;"><br>
      <br> 상품 이미지 URL : <input type="text" name="imageurl"
         id="imageurl" style="width: 600px;"><br>
      <br> 상품 캐릭터 : <input type="text" name="character" id="character"
         style="width: 600px;"><br>
      <br> 상품 상세 정보 :
      <textarea rows="10" cols="80" name="details" id="details"></textarea>
      <br>
      <br> 상품 부가 정보 :
      <textarea rows="10" cols="80" name="moredetails" id="moredetails"></textarea>
   </form>
      <br>
      <br> <input type="button" value="돌아가기" onclick="cancel()">
      <input type="button" value="등록" onclick="register()">


   
</body>
</html>