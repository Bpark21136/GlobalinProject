/**
 * js for menu2(마이페이지)
 */

function loadUserInfoChange() {
	$('#page-content-wrapper').load('change_user_info.do');
}
function loadReviewPage(page) {
	//history.pushState('','', '?menu=' + mid +'&&' + 'page='+page);
	if(page == null || page < 1) {
		page = 1;
	}
	$('#page-content-wrapper').load('my_reviews.do?page=' + page);
}
function loadMyArticlesPage(page) {
	//history.pushState('','', '?menu=' + mid +'&&' + 'page='+page);
	if(page == null || page < 1) {
		page = 1;
	}
	$('#page-content-wrapper').load('my_articles.do?page=' + page);
}
function userInfoChangeButtonClick() {
	history.pushState('','', '?menu=' + menu +'&&' + 'view=change');
	loadUserInfoChange();
}
function myReviewButtonClick(page) {
	history.pushState('','', '?menu=' + menu +'&&' + 'view=my_reviews' + '&&page='+ page);
	loadReviewPage(page);
}
function myArticlesButtonClick(page) {
	history.pushState('','', '?menu=' + menu +'&&' + 'view=my_articles' + '&&page='+ page);
	loadMyArticlesPage(page);
}
function deleteUserButtonClick() {
	var pw = prompt('패스워드를 입력해주세요');
	var sendData = {"pw":pw};
	console.log('deleteReview sendData',sendData);
	$.ajax({
        url:'delete_user.do'
        , method : 'POST'
        , data: JSON.stringify(sendData)
        ,contentType : 'application/json; charset=UTF-8'
        ,dataType : 'json'
        , success : function(resp) {
			if(resp.code == -1) {
				alert("비밀먼호가 틀렸습니다.");
				return;
			}
			alert("회원탈퇴완료");
			location.href='start.action';
        }
	    , error : function(error) {
			alert("오류가 발생했습니다.");
		}
    });//ajax로 검색
}


function loadmyReviewsDetail(rid) {
	console.log('loadmyReviewsDetail ' + rid);
	$('#page-content-wrapper').load('load_my_reviews_detail.do',{"rid" : rid});
}
function myReviewNext(page) {
	if(page == null || page >= $('#my-review-max-page').text())
		return;
	history.pushState('','', '?menu=' + menu +'&&' + 'view=my_reviews' +'&&page='+(page + 1));
	loadReviewPage(page + 1);
}
function myReviewPrev(page) {
	console.log('articlePrev page ' + page)
	if(page == null || page <= 1)
		return;
	history.pushState('','', '?menu=' + menu +'&&' + 'view=my_reviews' + '&&page='+(page - 1));
	loadReviewPage(page - 1);
}
function myArticleNext(page) {
	if(page == null || page >= $('#my-article-max-page').text())
		return;
	history.pushState('','', '?menu=' + menu +'&&' + 'view=my_articles' +'&&page='+(page + 1));
	loadMyArticlesPage(page + 1);
}
function myArticlePrev(page) {
	console.log('articlePrev page ' + page)
	if(page == null || page <= 1)
		return;
	history.pushState('','', '?menu=' + menu +'&&' + 'view=my_articles' + '&&page='+(page - 1));
	loadMyArticlesPage(page - 1);
}

function viewMyReviewDetail() {
	$(".viewLink").click(function(e){
		e.preventDefault();
		var rid = $(this).data('rid');
		history.pushState('','', '?menu=' + menu +'&&' + 'view=my_reviews_detail' + '&&rid='+rid);
		loadmyReviewsDetail(rid);
	});
}

