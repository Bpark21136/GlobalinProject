<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%ArrayList<Map<String,Object>> comments = (ArrayList<Map<String,Object>>) request.getAttribute("comments");%>
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
	<div style="position:fixed;top:0px;right:0px;z-index:10;cursor:pointer;" onclick="toggleReviewDetail(false)">
		<i class="fa fa-window-close fa-fw fa-2x" aria-hidden="true"></i>
	</div>
	<article class="padding">
		<div class="container background-white">
			<header>
				<div class="header-wrapper">
					<h3 class="title ub-word">
						<span class="title_subject">${TITLE}</span>
					</h3>
					<div class="writer">
						<div class="fl">
							<span class="nickname"><em>${USERID}</em></span>
							<span class="country"><img src="resources/static/img/${COUNTRY}.png"></img></span>
							<span>${DATE}</span>
						</div>
					</div>
				</div>
			</header>
			<hr class="fcr">
			<div class="gallview_contents">
				<div class="content">
					${CONTENT}
				</div>
				<hr>
				<div class="fl fr">
					<%if(request.getAttribute("CURRENTUSERID") != null && ((String) request.getAttribute("CURRENTUSERID")).equals((String) request.getAttribute("USERID")))  {%>
					<button class="btn btn-outline-secondary btn-sm" onclick="toggleReviewUpdate()">수정</button><!-- jsp(내가 쓴 글일 경우) -->
					<button class="btn btn-outline-danger btn-sm" onclick="deleteReview()">삭제</button><!-- jsp(내가 쓴 글일 경우) -->
					<%}%>
				</div>
			</div>
			<hr class="fcr">
			<div id="comment_wrapper">
				<div class="comment_count">
					<div class="fl num_box">
						전체댓글 
						<em id="comment_num"class="font_red">
							<%=comments.size() %><!-- ajax -->
						</em>
						개
					</div>
					<hr class="comment-hr">
					<div class="comment_box">
						<ul id ="comment_list" class="list-group cmt_list">
						<%for(Map<String,Object> el : comments)  {%>
							<li class="list-group-item">
								<div class="comment_content">
									<div class="fl">
										<span class="nickname"><em><%=el.get("USERID").toString()%></em></span><!-- ajax -->
										<span class="country"><img src="resources/static/img/<%=el.get("COUNTRY").toString()%>.png"></span><!-- ajax -->
										<span class="date_time"><%=el.get("DATE").toString() %></span><!-- ajax -->
									</div>
									<div class="comment">
										<p class="usertxt ub-word"><%=el.get("CONTENT").toString()%></p><!-- ajax -->
									</div>
									<%if(request.getAttribute("CURRENTUSERID") != null 
									 && (((String) request.getAttribute("CURRENTUSERID")).equals((String) request.getAttribute("USERID"))  || 
											((String) request.getAttribute("CURRENTUSERID")).equals((String) el.get("USERID")))) {//내가 쓴 리뷰거나 내가 쓴 댓글일 경우 %>
									<div class="fr">
										<button type="button" class="btn btn-outline-danger btn-sm" onclick="deleteComment(this,<%=el.get("COMMENTID").toString()%>)">삭제</button> <!-- ajax -->
									</div>
									<%}%>
								</div>
							</li>
						<% }%>
		  	            </ul>
		  	        </div>
		  	        <hr class="comment-hr fcr"> 
		  	        <%if(request.getAttribute("CURRENTUSERID") != null) { %>
			  	        <div class="comment_wrtie_box">
				  	        <div class="fl">
								<span class="nickname"><em>${CURRENTUSERID}</em></span><!-- jsp -->
							</div>
							<div class="form-group">
							    <label for="exampleFormControlTextarea1">댓글 입력</label>
							    <textarea class="form-control" style="resize:none;" id="comment_content" rows="3"></textarea>
							</div>
							<div class="fl fr">
								<button class="btn btn-success btn-sm" onclick="insertComment();">등록</button><!-- ajax -->
							</div>
			  	        </div>
		  	        <%}//로그인 된 경우에만 댓글쓰기 가능 %>
		  	        <hr class="fcr comment-hr"> 
				</div>		
			</div>
		</div>
	</article>
	<script type="text/javascript">
		var commentNum =<%=comments.size() %> 
		function insertComment() {
			var content = $('textarea#comment_content').val();
			if(content.trim() == '') {
				alert('댓글 내용이 없습니다.');
				return;
			}
			var sendData = {"rid": ${REVIEWID},"content" : content};
			console.log(sendData);
			$.ajax({
		        url:'comment_create.do'
		        , method : 'POST'
		        , data: JSON.stringify(sendData)
				, async: false
		        ,contentType : 'application/json; charset=UTF-8'
		        ,dataType : 'json'
		        , success : function(resp) {
					
					if(resp == null) {
						alert('댓글 등록에 실패했습니다.');
						return;
					}//에러발생
		           	alert('댓글이 등록되었습니다.');
		           	$('textarea#comment_content').val('');
					loadNewComment(resp);
					commentNum++;
					$('#comment_num').text(commentNum);
					//새 댓글 문서에 추가
		        }
			   , error : function( error ) {
				   alert('댓글 등록에 실패했습니다.');
				}
		    });//ajax create
		}
		function deleteComment(el,cid) {
			var sendData = {"cid": cid };
			console.log('deleteReview sendData',sendData);
			$.ajax({
		        url:'comment_delete.do'
		        , method : 'POST'
		        , data: JSON.stringify(sendData)
		        ,contentType : 'application/json; charset=UTF-8'
		        ,dataType : 'json'
		        , success : function(resp) {
					if(resp == null) {
						alert("삭제에 실패했습니다.");
					}
					alert("댓글이 삭제 되었습니다.");
					$(el).closest("li").remove();
					commentNum--;
					$('#comment_num').text(commentNum);
		        }
			    , error : function(error) {
					alert("삭제에 실패했습니다.");
				}
		    });//ajax로 검색
		}
		function deleteReview(){
			var sendData = {"rid": ${REVIEWID}};
			console.log('deleteReview sendData',sendData);
			$.ajax({
		        url:'review_delete.do'
		        , method : 'POST'
		        , data: JSON.stringify(sendData)
		        ,contentType : 'application/json; charset=UTF-8'
		        ,dataType : 'json'
		        , success : function(resp) {
					if(resp == null) {
						alert("삭제에 실패했습니다.");
					}
					alert("리뷰가 삭제 되었습니다.");
					location.reload();
		        }
			    , error : function(error) {
					alert("삭제에 실패했습니다.");
				}
		    });//ajax로 검색
		}
		function toggleReviewUpdate() {
			$('#review-form').load('load_review_update.do',{"rid":${REVIEWID}});
			$('#review-form').css('display','block');
			$('#review-detail').css('display','none');
		}
	</script>
</body>
</html>