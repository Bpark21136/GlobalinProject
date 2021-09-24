/**
 * js for menu2(자유게시판)
 */

function loadPage(page,query) {
	//history.pushState('','', '?menu=' + mid +'&&' + 'page='+page);
	if(page == null || page < 1) {
		page = 1;
	}
	if(query == null) {
		query = '';
	}
	query = query.trim();
	$('#page-content-wrapper').load('board.action?page=' + page +'&&query=' + query);
}
function writeButtonClick() {
		//history.pushState('','', '?menu=' + menu + '&&view=write');
		loadWrite();
}
function loadWrite() {
	console.log('loadWrite');
	$('#page-content-wrapper').load('write.do');
}

function loadUpdate(aid) {
	$('#page-content-wrapper').load('load_article_update.do',{"aid":aid});
}

function loadbbsView(aid) {
	console.log('loadbbsView ' + aid);
	$('#page-content-wrapper').load('bbsview.action',{"aid" : aid});
}
function articleNext(page) {
	if(page == null || page >= $('#article-max-page').text())
		return;
	history.pushState('','', '?menu=' + menu +'&&' + 'page='+(page + 1));
	loadPage(page + 1);
}
function articlePrev(page) {
	console.log('articlePrev page ' + page)
	if(page == null || page <= 1)
		return;
	history.pushState('','', '?menu=' + menu +'&&' + 'page='+(page - 1));
	loadPage(page - 1);
}
function viewDetail() {
	$(".viewLink").click(function(e){
		e.preventDefault();
		var aid = $(this).data('aid');
		history.pushState('','', '?menu=' + menu +'&&' + 'view=bbsView&&' + 'aid='+aid);
		loadbbsView(aid);
	});
}
function menu2_enterKey(page,query) {
	if(window.event.keyCode == 13) {
		menu2_search(page,query);
	}
}
function menu2_search(page,query) {
	history.pushState('','', '?menu=' + menu +'&&page='+page + '&&query=' + query);
	loadPage(page,query);
}
