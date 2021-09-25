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
	<div style="position:fixed;top:0px;right:0px;z-index:10;cursor:pointer;" onclick="location.href='start.action?menu=4';">
			<i class="fa fa-window-close fa-fw fa-2x" aria-hidden="true"></i>
	</div>
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
						    <div class="id">ID : ${userId} </div>
						    <div class="email">Email : ${email}</div>
						    <div class="pwd1"><label for="now-pwd"> 현재 PW : </label> <input  id="now-pwd" type="password" name="now-pwd" required></div>
						    <div class="pwd2"><label for="new-pwd"> 새로운 PW : </label> <input id="new-pwd" type="password" name="new-pwd" placeholder="빈칸:패스워드 변경안함"></div>
						    <div class="pwd2"><label for="new-pwd2"> PW 확인 : </label> <input id="new-pwd2" type="password" name="new-pwd2" placeholder="빈칸:패스워드 변경안함"></div>
						    <div class="국적">국적 : 
							    <select id="sel">
							        <option value="KOR" <%=request.getAttribute("country").toString().equals("KOR") ? "selected=\"selected\"" : "" %>>한국</option>
							        <option value="JPN" <%=request.getAttribute("country").toString().equals("JPN") ? "selected=\"selected\"" : "" %>>日本</option>
							        <option value="Others" <%=request.getAttribute("country").toString().equals("Others") ? "selected=\"selected\"" : "" %>>Others</option>
							    </select>
						    </div>
							<button class="ch-fixed-btn" onclick="pwCheck($('#now-pwd').val(),$('#new-pwd').val(),$('#sel option:selected').val())">수정완료</button>
						</ol>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function pwCheck(pw,newPw,country) {
			console.log(pw,newPw,country);
			if($('#new-pwd').val() != $('#new-pwd2').val()) {
				alert("패스워드확인이 잘못 되었습니다.");
				return;
			}
			var sendData = {"pw": pw};
			console.log('deleteReview sendData',sendData);
			$.ajax({
		        url:'pw_check.do'
		        , method : 'POST'
		        , data: JSON.stringify(sendData)
		        ,contentType : 'application/json; charset=UTF-8'
		        ,dataType : 'json'
		        , success : function(resp) {
					if(resp == null) {
						alert("현재 패스워드가 틀렸습니다.");
					}
					changeInfo(pw,newPw,country);
		        }
			    , error : function(error) {
					alert("오류가 발생했습니다.");
				}
		    });//ajax로 검색
		}
		function changeInfo(pw,newPw,country) {
			if(newPw == null || newPw.trim() =='') {
				newPw = pw;
			}
			var sendData = {"newPw": newPw,"country": country};
			console.log('deleteReview sendData',sendData);
			$.ajax({
		        url:'change_info.do'
		        , method : 'POST'
		        , data: JSON.stringify(sendData)
		        ,contentType : 'application/json; charset=UTF-8'
		        ,dataType : 'json'
		        , success : function(resp) {
					if(resp == null) {
						alert("오류가 발생했습니다.");
					}
					alert("회원정보가 수정되었습니다.");
					location.href='start.action?menu=4';
		        }
			    , error : function(error) {
					alert("오류가 발생했습니다.");
				}
		    });//ajax로 검색
		}
	</script>
</body>
</html>