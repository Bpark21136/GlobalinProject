<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        #ch-head{text-align: center; color: white;}
        #change{padding-top: 150px; background-color: #534bae;;}
        .container.ch-center{display:flex; justify-content:center;}
        .lg{text-align: center; background-color: #1a237e; ; height: 50px; border-radius: 20px;}
        .div1{background-color:white;}
        .ch-form *{margin-bottom: 10px;}
        .ch-fixed-btn{background-color: var(--faq-con-color); color: var(--white-color);}
    </style>
</head>
<body>
	<div id="change">
		<div class="container ch-center">
			<div class="div1" style="border: solid 0 hidden; width: 500px; height: 430px; border-radius: 20px;">
			    <fieldset style="border: 0ch;">
					<header id="ch-head">
						<div class="text-area">
						   <legend class="lg"><h1>회원 정보 수정</h1></legend> 
						</div>
					<hr>
					</header>
					<form action="" class="ch-form">
						<ol class="ch-old">
						    <div class="id">ID : </div>
						    <div class="pwd1"><label for="now pwd"> 현재 PW : </label> <input  id="now pwd" type="password" name="pwd" required></div>
						    <div class="pwd2"><label for="new pwd"> 새로운 PW : </label> <input id="new pwd" type="password" name="new pwd" required></div>
						    <div class="pwd2"><label for="new pwd2"> PW 확인 : </label> <input id="new pwd2" type="password" name="new pwd2" required></div>
						    <div class="name"> <label for="name">이름 : </label> <input id="name" type="text" name="name" required></div>
						    <div class="국적">국적 : 
							    <select>
							        <option value="한국">한국</option>
							        <option value="日本">日本</option>
							    </select>
						    </div>
							<button class="ch-fixed-btn" href="MyPage.html">수정완료</button>
						</ol>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>