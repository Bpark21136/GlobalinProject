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
