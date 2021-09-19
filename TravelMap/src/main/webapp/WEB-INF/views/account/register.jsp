<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>TravelMap | Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="./resources/css/animate.css">
  <!-- Custom Stylesheet -->
  <link rel="stylesheet" href="./resources/css/style.css">
    
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="./webjars/jquery/3.6.0/dist/jquery.min.js"></script>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="./resources/static/libs/font-awesome-4.7.0/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="./resources/static/libs/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./resources/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- Bootstrap 4 -->
  <script src="./resources/static/libs/bootstrap-4.4.1-dist/js/bootstrap.bundle.min.js"></script>
</head>

<script type="text/javascript">
var isCheckId = 0;
var isCheckEmail = 0;
$(document).ready(function() {
	
	$("#btn").button().on('click', function() {
		//alert('click');
		if( $('#id').val().trim() == "" ){
			alert('아이디 입력 오류입니다.');
			return false;
		}
		if( $('#password').val().trim() == "" ){
			alert('패스워드 입력 오류입니다.');
			return false;
		}
		if( $('#password').val() != $('#password_ok').val() ){
			alert('패스워드 입력 오류입니다.');
			return false;
		}
		if( $('#email').val().trim() == "" ){
			alert('이메일 입력 오류입니다.');
			return false;
		}
		if( isCheckId == 0 ){
			alert('ID 중복을 확인하세요.');
			return false;
		}
		if( isCheckEmail == 0 ){
			alert('Email 중복을 확인하세요.');
			return false;
		}
		$("#form").submit();
	});
	
	$("#idBtn").button().on('click', function() {
		var id = $('#id').val();
		checkId( id );
	});
	
	$("#emailBtn").button().on('click', function() {
		var email = $('#email').val();
		checkEmail( email );
	});
	
});
var checkId = function( id ){
	$.ajax({
		url: './duId.action',
		data: {
			id: id
		},
		type: 'post',
		datatype: 'json',
		success: function( json ) {
			if( json.flag == 1 ){
				alert("이미 존재하는 ID입니다.");
			} else {
				alert('사용 가능한 ID입니다.');
				isCheckId = 1;
			}
		}
		
	});
}
var checkEmail = function( email ){
	$.ajax({
		url: './duEmail.action',
		data: {
			email: email
		},
		type: 'post',
		datatype: 'json',
		success: function( json ) {
			if( json.flag == 1 ){
				alert("이미 존재하는 email입니다.");
			} else {
				alert('사용 가능한 email입니다.');
				isCheckEmail = 1;
			}
		}
		
	});
}
</script>
<body>
<div class="login-box">
  <div class="register-logo">
    <a href="#"><b>TarvelMap</b>Register</a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">새로운 회원으로 가입하세요.</p>

      <form id="form" name="form" action="./sign_up.action" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
          <div class="input-group-append">
            <div class="input-group-text">
              <button type="button"  id="idBtn" style="width:60pt; height:18pt; padding: 0.1rem 0.1rem; font-size: 11.5pt;'">중복검사</button>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control"  id="password" name="password" placeholder="비밀번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control"  id="password_ok" name="password" placeholder="비밀번호 확인">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control"  id="email" name="email" placeholder="이메일">
          <div class="input-group-append">
            <div class="input-group-text">
              <button type="button"  id="emailBtn" style="width:60pt; height:18pt; padding: 0.1rem 0.1rem; font-size: 11.5pt;'">중복검사</button>
            </div>
          </div>
        </div>
        <!-- 국적 부분  개선 필요-->
        <div class="input-group mb-3">
          <input type="text" class="form-control"  id="country" name="country" placeholder="국적">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-8">
			<div style="align-self: left;">

			</div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="button"  id="btn" >회원가입</button>
          </div>
          <!-- /.col -->
        </div>
        
        <p class="login-box-msg" style="margin-top: 20px; padding-bottom: -20px;">
        	<a href="./login.action" >로그인하러 가기</a>
        </p>
        
      </form>


    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- Bootstrap 4 -->
<script src="./resources/static/libs/bootstrap-4.4.1-dist/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./resources/css/adminlte.min.js"></script>
</body>
</html>