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
	.background-white{
	background-color:white;
	border-radius: 20px;
	padding-top:30px;
	padding-bottom:30px;
	padding-left:30px;
	padding-right:30px;
}
</style>
</head>
	<body>
		<div style="position:fixed;top:0px;right:0px;z-index:10;cursor:pointer;" onclick="toggleReviewForm(false);">
			<i class="fa fa-window-close fa-fw fa-2x" aria-hidden="true"></i>
		</div>
		<article>
			<div class="container " role="main">
				<div class="h2">
					<h2 class="write-h2">리뷰 쓰기</h2>
				</div>
				<div class=" background-white">
					<form  onsubmit="return false;" name="form" id="form" role="form" method="post">
						<div class="mb-3">
							<label for="title"></label> 
							<input type="text"
								class="form-control" name="title" id="title"
								placeholder="제목을 입력해 주세요">
								
						</div>
						<div class="mb-3">
							<textarea id="summernote" name="content"></textarea>
						</div>
					</form>
					<div>
						<button type="button" class="btn btn-danger" id="btnList" onclick="toggleReviewForm(false);">취소</button>
						<button type="button" class="btn btn-success" id="btnSave" onclick="sendReviewForm($('#form'));">등록</button>
					</div>
				</div>
			</div>
		</article>
		<script type="text/javascript">
				$(document).ready(function() {
				  $('#summernote').summernote({  
					  callbacks: {
						  onImageUpload: function(files, editor, welEditable) {
						              for (var i = files.length - 1; i >= 0; i--) {
						               sendFile(files[i], this);
						              }
						          }
						  }
						  });
				  });
				//summernote 설정
				function sendFile(file, el) {
				   var form_data = new FormData();
			       form_data.append('file', file);
			       $.ajax({
			         data: form_data,
			         type: "POST",
			         url: './upload_image.do',
			         cache: false,
			         contentType: false,
			         enctype: 'multipart/form-data',
			         processData: false,
			         success: function(img_name) {
			           $(el).summernote('editor.insertImage', img_name);
			         }
			       });
				}
				
				function sendReviewForm(frm) {
					var title = $('#title').val();
					var content = $("#summernote").summernote('code');
					var preview = $($("#summernote").summernote("code")).text().substring(0,80);
					if (title.trim() == ''){
						alert("제목을 입력해주세요");
						return false;
					}
					
					if (content.trim() == ''){
						alert("내용을 입력해주세요");
						return false;
					}
					
					var sendData = {"title": title,"preview" :preview,"content" : content,"pid" : <%=request.getParameter("pid") %> };
					$.ajax({
				        url:'review_create.do'
				        , method : 'POST'
				        , data: JSON.stringify(sendData)
				        ,contentType : 'application/json; charset=UTF-8'
				        ,dataType : 'json'
				        , success : function(resp) {
							if(resp == null) {
								alert("등록에 실패했습니다.");
								return;
							}
							alert("등록 되었습니다.");
							toggleReviewForm(false);
							loadReview(review_selected_div,1);
							$('#review-detail').load('review_detail.action',{"rid":resp.id});
							$('#review-detail').css('display','block');
							$('#review-form').css('display','none');
							
				        }
					    , error : function(error) {
							alert("등록에 실패했습니다.");
						}
				    });//ajax로 검색	
				}
		</script>
	</body>
</html>