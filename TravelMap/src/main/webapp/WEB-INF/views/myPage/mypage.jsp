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
       
        header{text-align: center; color: white;}
        body{padding-left: 500px; padding-top: 150px; background-color:   #534bae;}
        .lg{text-align: center; background-color: #1a237e; ; height: 50px; border-radius: 20px;}
        div{margin-bottom: 10px; background-color: white;}
        
        
    </style>
    
</head>
<body>
    
    <div class="div1" style= "border: solid 0px; width: 500px; height: 300px; border-radius: 20px;">
        <fieldset style="border: 0cm;">
<header>
<div class="text-area">
    <legend class="lg"> <h1>MyPage</h1></legend>


</div>
<hr>
</header>

<ol>
    <div class="id">ID : </div>
    <div class="pwd">PWD : </div>
    <div class="name"> 이름 : </div>
    <div class="국적">국적 : </div>


<a href="Change.html"><input type="button" value="회원정보 수정" onclick="" class="btn"></a>
<a href="MyGyeshigle.html"><input type="button" value="내 게시글" onclick="" class="btn"></a>
</ol>
</fieldset>
</div>

</body>
</html>