<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPage</title>
    <style>
       
       
        #onehead{text-align: center; color: white;}
        #mypage{display:flex; justify-content:center; padding-top: 150px; background-color:   #534bae;}
        .lg{text-align: center; background-color: #1a237e; ; height: 50px; border-radius: 20px;}
        .div1{margin-bottom: 10px; background-color: white;}
        .old *{margin-bottom: 10px}
        
        
    </style>
    
</head>
<body>
    <div id="mypage" class="container">
    <div class="div1" style= "border: solid 0px; width: 500px; height: 300px; border-radius: 20px;">
        <fieldset style="border: 0cm;">
<header id="onehead">
<div class="text-area">
    <legend class="lg"> <h1>MyPage</h1></legend>


</div>
<hr>
</header>

<ol class="old">
    <div class="id">ID : </div>
    <div class="pwd">PWD : </div>
    <div class="name"> 이름 : </div>
    <div class="국적">국적 : </div>


<button href="Change.html">회원정보 수정</button>
<button href="MyGyeshigle.html">내 게시글</button>
</ol>
</fieldset>
</div>
</div>
</body>
</html>