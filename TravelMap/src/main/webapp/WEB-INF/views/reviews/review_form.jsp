<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<div style="position:fixed;top:0px;right:0px;cursor:pointer;" onclick="toggleReviewForm(false);">
			<i class="fa fa-window-close fa-fw fa-2x" aria-hidden="true"></i>
		</div>
		<article>
			<div class="container" role="main">
				<h2>리뷰 쓰기</h2>
				<form name="form" id="form" role="form" method="post">
					<div class="mb-3">
						<label for="title">제목</label> 
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