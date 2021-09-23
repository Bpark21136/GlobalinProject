<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<style type="text/css">
.fl span::before{
        content:'|';
        color:#333;
        padding-left: 5px;
        padding-right: 5px;
    }
.fl span:nth-child(1):before{
    content:none;
}

.fl span:nth-child(1){
    padding-left:0px;
}
.fr {
	float:right;
	margin-bottom:5px;
}
.fcr {
	clear:both;
}
.comment_box {
	margin-bottom:15px;
}
.comment-hr {
	border-top: 1px solid #17a2b8;
}
.background-white{
	background-color:white;
	border-radius: 20px;
	padding-top:30px;
	padding-bottom:30px;
}
.padding {
	padding-top:30px;
	padding-bottom:30px;
}
</style>

</head>
<body>
	<div style="position:fixed;top:0px;right:0px;cursor:pointer;" onclick="toggleReviewDetail(false)">
		<i class="fa fa-window-close fa-fw fa-2x" aria-hidden="true"></i>
	</div>
	<article class="padding">
		<div class="container background-white">
			<header>
				<div class="header-wrapper">
					<h3 class="title ub-word">
						<span class="title_subject">제목</span>
					</h3>
					<div class="writer">
						<div class="fl">
							<span class="nickname"><em>닉네임</em></span>
							<span class="country"><img src="country_n.png"></img></span>
							<span>2021.09.16 09:27:36</span>
						</div>
						<div class="fl fr">
							<span class="view_count">조회 306</span><!-- jsp -->
							<span class="recommend_count">추천 4</span><!-- jsp -->
							<span class="comment_count">댓글 2</span><!-- jsp -->
						</div>
					</div>
				</div>
			</header>
			<hr class="fcr">
			<div class="gallview_contents">
				<div class="content">
					<br><br><br><br><br><br>본문<br><br><br><br><br><br>
				</div>
				<hr>
				<div class="fl fr">
					<button class="btn btn-outline-info btn-sm">추천</button><!-- jsp(내 글이 아닐 경우) -->
					<button class="btn btn-outline-secondary btn-sm">수정</button><!-- jsp(내가 쓴 글일 경우) -->
					<button class="btn btn-outline-danger btn-sm">삭제</button><!-- jsp(내가 쓴 글일 경우) -->
				</div>
			</div>
			<hr class="fcr">
			<div id="comment_wrapper">
				<div class="comment_count">
					<div class="fl num_box">
						전체댓글 
						<em class="font_red">
							2<!-- jsp -->
						</em>
						개
					</div>
					<hr class="comment-hr">
					<div class="comment_box">
						<ul class="list-group cmt_list">
							<li class="list-group-item">
								<div class="comment_content">
									<div class="fl">
										<span class="nickname"><em>ㅇㅇ</em></span><!-- jsp -->
										<span class="country"><img src="country_n.png"></span><!-- jsp -->
										<span class="date_time">09.16 09:28:00</span><!-- jsp -->
									</div>
									<div class="comment">
										<p class="usertxt ub-word">댓글1</p><!-- jsp -->
									</div>
									<div class="fr"><!-- jsp(내가 쓴 댓글일 경우) -->
										<button type="button" class="btn btn-outline-danger btn-sm">삭제</button> <!-- ajax -->
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="comment_content">
									<div class="fl">
										<span class="nickname"><em>ㅇㅇ</em></span><!-- jsp -->
										<span class="country"><img src="country_n.png"></span><!-- jsp -->
										<span class="date_time">09.16 09:28:00</span><!-- jsp -->
									</div>
									<div class="comment">
										<p class="usertxt ub-word">댓글2</p><!-- jsp -->
									</div>
								</div>
							</li>
		  	            </ul>
		  	        </div>
		  	        <nav>
					  <ul class="pagination justify-content-center pagination-sm">
					    <li class="page-item disabled">
					      <a class="page-link" href="#" tabindex="-1">1</a>
					    </li>
					  </ul>
					</nav>
					<!-- 댓글 페이지네이션 -->
		  	        <hr class="comment-hr fcr"> 
		  	        <div class="comment_wrtie_box">
			  	        <div class="fl">
							<span class="nickname"><em>ㅇㅇ</em></span><!-- jsp -->
							<span class="country"><img src="(var:countryName).png"></span><!-- jsp -->
						</div>
						<div class="form-group">
						    <label for="exampleFormControlTextarea1">댓글 입력</label>
						    <textarea class="form-control" style="resize:none;" id="exampleFormControlTextarea1" rows="3"></textarea>
						</div>
						<div class="fl fr">
							<button class="btn btn-success btn-sm">등록</button><!-- ajax -->
						</div>
		  	        </div>
		  	        <hr class="fcr comment-hr"> 
				</div>		
			</div>
		</div>
	</article>
</body>
</html>