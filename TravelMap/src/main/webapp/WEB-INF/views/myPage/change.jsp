<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        
        header{text-align: center; color: white;}
        body{padding-left: 500px; padding-top: 150px; background-color: #534bae;;}
        .lg{text-align: center; background-color: #1a237e; ; height: 50px; border-radius: 20px;}
        div{margin-bottom: 10px; background-color: white;}
        
        
    </style>
</head>
<body>
    <div class="div1" style="border: solid 0 hidden; width: 500px; height: 350px; border-radius: 20px;">
    <fieldset style="border: 0ch;">
<header>
<div class="text-area">
   <legend class="lg"><h1>회원 정보 수정</h1></legend> 


</div>
<hr>
</header>
<form action="">
<ol>
    <div class="id">ID : </div>
    <div class="pwd1"><label for="now pwd"> 현재 PWD : </label><input  id="now pwd" type="password" name="pwd" required></div>
    <div class="pwd2"><label for="new pwd"> 새로운PWD :</label> <input id="new pwd" type="password" name="new pwd" required> </div>
    <div class="pwd2"><label for="new pwd2"> PWD확인 :</label> <input id="new pwd2" type="password" name="new pwd2" required> </div>
    <div class="name"> <label for="name">이름 : </label> <input id="name" type="text" name="name" required> </div>
    <div class="국적">국적 : <select>
        <option value="한국">한국</option>
        <option value="日本">日本</option>
    </select> </div>


<a href="MyPage.html"><input type="submit" value="수정완료" onclick="" class="btn"></a>
</form>
</ol>
</fieldset>
</div>
</body>
</html>