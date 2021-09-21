<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Travel | Log in</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/animate.css">
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="./resources/css/style.css">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="./webjars/jquery/3.6.0/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
    	
    	$("#btn").button().on('click', function() {
    		var id = $('#id').val();
    		var password = $('#password').val();
    		//console.log(id);
    		//console.log(password);
    		loginOk(id, password);
    	});
    	
        $("#login").keypress(function (e) {
            if (e.keyCode === 13) {
            	var id = $('#id').val();
        		var password = $('#password').val();
            	loginOk(id, password);;
            }
        });
	});
	
	
	var loginOk = function( id, password ){
		$.ajax({
			url: './loginOK.action',
			data: {
				id: id,
				password: password
			},
			type: 'post',
			datatype: 'json',
			success: function( json ) {
				if( json.sqlOK == 1 ){
					//alert('성공');
					location.href = './start.action';
				} else {
					alert("아이디/패스워드 오류");
					//location.href = './newDashboard.jsp';
				}
				
			}
		});
	}
</script>
</head>
<body>
	<div class="container">
		<div class="top">
			<h1 style="width: 400px;" id="title" class="hidden"><span id="logo">Travel<span>Map</span></span></h1>
		</div>
		<form method="post" id="login">
		<div class="login-box">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="username">Userid</label>
			<br/>
			<input type="text" id="id" name="id" />
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="password" />
			<br/>
			<button type="button" id="btn">로그인</button>
			<br/><br />
			<a href="./forgot_id.action"><p class="small">아이디 찾기</p></a>
			
			<a href="./forgot_password.action"><p class="small">비밀번호 찾기</p></a>
			
			<a href="./register.action"><p class="small">회원가입</p></a>
		</div>
		</form>
	</div>
	
	<!-- Bootstrap 4 -->
<script src="./resources/static/libs/bootstrap-4.4.1-dist/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./resources/js/adminlte.min.js"></script>
</body>
</html>