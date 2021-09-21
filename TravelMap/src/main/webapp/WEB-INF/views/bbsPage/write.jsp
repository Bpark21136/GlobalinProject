<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/99f7873797.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
<title>Home</title>
<style>
	.container {padding-top: 100px; font-family: "Roboto", sans-serif;}
	.container .h2 {display: flex; justify-content: center;}
	.container .h2 .write-h2 {width: 300px; border-radius: 20px; text-align: center; font-size: 32px; color: var(--white-color); background-color: var(--faq-con-color);}
	.container .mb-3 .note-editor.note-frame .note-editable {min-height: 50%; background-color: var(--white-color);}
	.container .mb-3 .note-editor.note-frame .note-statusbar {background-color: var(--white-color);}
</style>
</head>
	<body>
		<div style="position:fixed;top:0px;right:0px;cursor:pointer;" onclick="toggleReviewForm(false);">
			<i class="fa fa-window-close fa-fw fa-2x" aria-hidden="true"></i>
		</div>
		<article>
			<div class="container" role="main">
				<div class="h2">
					<h2 class="write-h2">게시글 쓰기</h2>
				</div>
				<form name="form" id="form" role="form" method="post">
					<div class="mb-3">
						<label for="title"></label> 
						<input type="text"
							class="form-control" name="title" id="title"
							placeholder="제목을 입력해 주세요">
							
					</div>
					<div class="mb-3">
						<textarea id="summernote"></textarea>
					</div>
				</form>
				<div>
					<button type="button" class="btn btn-danger" id="btnList" onclick="toggleReviewForm(false);">취소</button>
					<button type="button" class="btn btn-success" id="btnSave" onclick="sendReviewForm();">등록</button>
				</div>
			</div>
		</article>
		<script type="text/javascript">
				$(document).ready(function() {
				  $('#summernote').summernote({  
				  });
				});
				//summernote 설정
		</script>
	</body>
</html>