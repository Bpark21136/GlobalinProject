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
        #mypage{display:flex; justify-content:center; padding-top: 150px; background-color:   #534bae;height:100%;}
        .align-center{display:flex; justify-content:center;}
        .lg{text-align: center; background-color: #1a237e; ; height: 50px; border-radius: 20px;}
        .div1{background-color:white;}
        .old *{margin-bottom: 10px}
        .my-fixed-btn{background-color: var(--faq-con-color); color: var(--white-color);}
        .my-bbs-btn{background-color: var(--faq-con-color); color: var(--white-color);}
    </style>
    
</head>
<body>
    <div id="mypage">
	    <div class="container align-center">
		    <div class="div1" style= "border: solid 0px; width: 500px; height: 300px; border-radius: 20px;">
		        <fieldset style="border: 0cm;">
					<header id="onehead">
						<div class="text-area">
						    <legend class="lg"> <h1>MyPage</h1></legend>
						
						
						</div>
					<hr>
					</header>
					
					<ol class="old">
					    <div class="id">ID : ${userId}</div>
					    <div class="email">E-mail : ${email}</div>
					    <div class="국적">국적 : ${country}</div>
					
					
						<button class="my-fixed-btn" onclick="userInfoChangeButtonClick()">회원정보 수정</button>
						<button class="my-bbs-btn" onclick="myReviewButtonClick(1)">내 리뷰</button>
						<button class="my-bbs-btn" onclick="myArticlesButtonClick(1)">내 게시글</button>
						<button class="my-bbs-btn" onclick="deleteUserButtonClick()">회원 탈퇴</button>
					</ol>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>