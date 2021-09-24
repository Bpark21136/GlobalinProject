<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%int menu = (Integer) request.getAttribute("menu"); %>

<html>
<head>
 	<link rel="stylesheet" href="<c:url value="/resources/static/libs/bootstrap-4.4.1-dist/css/bootstrap.min.css"/>">
 	<script src="<c:url value="/resources/static/libs/jquery-3.6.0.min.js"/>"></script>
 	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script src="<c:url value="/resources/static/libs/bootstrap-4.4.1-dist/js/bootstrap.min.js"/>"></script>
	<%--bootstrap import --%>
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
	<%--googleMap import--%>
	<link rel="stylesheet" href="<c:url value="/resources/static/sidebar.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/static/shrinkable_layout.css"/>">
	
	<link rel="stylesheet" href="<c:url value="/resources/static/libs/font-awesome-4.7.0/css/font-awesome.css"/>">
	<%--fontawesome import --%>
	
	<link rel="stylesheet" href="<c:url value="/resources/static/libs/summernote-0.8.18-dist/summernote-lite.css"/>">
	<script src="<c:url value="/resources/static/libs/summernote-0.8.18-dist/summernote-lite.js"/>"></script>
    <%--summernote import--%>
	<title>Home</title>
</head>
<body>
<!-- Navigation -->
		
	<div id="page-wrapper">
  <!-- 메뉴버튼 -->
	  <div id="sidebar-wrapper">
	    <ul class="sidebar-nav">
	      <li class="sidebar-brand">
	        <a href="#">
	        	<img src="<c:url value="/resources/static/img/logo2.png"/>">
	        </a>
	      </li>
	      <li><a class="<%=menu ==  1 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu1" >
	      		<img src="<c:url value="/resources/static/img/globe_icon.png"/>">
	      		</a>
	      		</li>
	      <li><a class="<%=menu ==  2 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu2" >
	      		<img src="<c:url value="/resources/static/img/list_icon.png"/>">
	      		</a>
	      		</li>
	      <li><a class="<%=menu ==  3 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu3" >
	      		<img src="<c:url value="/resources/static/img/faq_icon.png"/>">
	      		</a>
	      		</li>
          <li>
          <%if(request.getAttribute("userId") != null) { %>
          <li><a class="<%=menu ==  4 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu4" >
	      		<img src="<c:url value="/resources/static/img/user_icon.png"/>">
	      		</a>
	      		</li>
          <li>
          <% }%>
          <li><a class="<%=menu ==  5 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu5" >
	      		<img src="<c:url value="/resources/static/img/question_icon.png"/>">
	      		</a>
	      		</li>
          <li>
          <%if(request.getAttribute("userId") == null) { %>
          	<button type="button" onclick="location.href='./login.action'" class="btn btn-secondary" id="btn" >로그인</button></li>
          <%} else if(request.getAttribute("userId") != null) {%>
          	<button type="button" onclick="location.href='./logout.action'" class="btn btn-secondary" id="btn" >로그아웃</button></li>
          <%} %>
          <li><br/><div id="google_translate_element"></div>
			<script type="text/javascript">
			function googleTranslateElementInit() {
			  new google.translate.TranslateElement({pageLanguage: 'ko'}, 'google_translate_element');
			}
			</script>
			<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
			</li>
	    </ul>
	  </div>
	  <!-- 사이드바 -->
	  <div id="shirinkable-layout" class="shirinkable-layout">
	  	<div id ="sidebar-content-wrapper">
	  	
	  	</div>
	  	<button class="btn btn-secondary" onclick="shrinkToggle('shirinkable-layout')"><i class="fa fa-angle-right"></i></button>
	  </div>
		<!-- Page Content -->
	  <div id="page-content-wrapper">
	  </div>
	</div>
		<!-- /.container -->
	<script src="<c:url value="/resources/static/js/menu1.js"/>"></script>
	<script src="<c:url value="/resources/static/js/menu2.js"/>"></script>
	<script src="<c:url value="/resources/static/js/menu4.js"/>"></script>
	<script type="text/javascript">
		var logined = <%=(String)request.getAttribute("userId") != null  ? "true" : "false" %>;
		var uid = <%=(String)request.getAttribute("userId") != null  ? "'" + (String)request.getAttribute("userId") + "'" : "null" %>;
		console.log(uid);
		var menu = <%=menu%>;
		loadMenu('menu' + menu);
		console.log('menu',menu);
		window.onpopstate = function(event) {
			const url = new URL(window.location.href);
			const urlParams = url.searchParams;
			console.log('popstate',url);
			console.log('popstate',urlParams);
			console.log('popstate',menu,' ',urlParams.get('menu'));
			if(urlParams.get('menu') == undefined && menu == 1) {
				return;
			}
			else if(menu == urlParams.get('menu') && menu !=2 && menu != 4) {
				console.log('menu == urlParams.get(menu)');
				return;
			}
			else if(urlParams.get('menu') == undefined) {
				menu = 1;
			}
			else {
				menu = urlParams.get('menu');
			}
	        changeSel('menu' + menu);
	        loadMenu('menu' + menu);
	       
	      };
		function menuClick(id) {
			const id_val = parseInt(id.slice(4));
			console.log('menu click',menu,id_val);
			if(menu == id_val) {
				console.log('menu == id_val');
				return;
			}
			
			menu = id_val;
			
			changeSel(id);
			history.pushState('','', '?menu=' + id_val);
		    loadMenu(id);
		}
		function changeSel(id) {
			try {
				document.getElementsByClassName('sel')[0].classList.toggle('sel');
				//선택된 엘레멘트
				} catch(err) {
					;
				}
				document.getElementById(id).classList.toggle('sel');
		}
		function loadMenu(id) {
			const url = new URL(window.location.href);
			const urlParams = url.searchParams;
			console.log(id.slice(4));
			 if(menu == 2) {
			        if(urlParams.get('view') == null) {
			        	loadPage(urlParams.get('page'),urlParams.get('query'));
			        	//자유게시판
			        } else if(urlParams.get('view') == 'write'){
			        	loadWrite();//게시글 쓰기
			        } else if(urlParams.get('view') == 'bbsView') {
			        	loadbbsView(urlParams.get('aid'));
			        	//게시글 보기
			        } else if(urlParams.get('view') == 'update'){
			        	loadUpdate(urlParams.get('aid'));//게시글 수정
			        }
	        } else if(menu == 4) {
	        	if(urlParams.get('view') == null) {
					$('#sidebar-content-wrapper').load('content.action?id=' + id);
					$('#page-content-wrapper').load('sidebar.action?id=' + id);
		        	//마이페이지
	        	}
	        	if (urlParams.get('view') == 'change') {
		        	//회원정보 수정
		        } else if(urlParams.get('view') == 'mygeshigle') {
		        	//내 게시글
		        } else if(urlParams.get('view') == 'myReview') {
		        	//내 리뷰
		        }
	        } else {
				$('#sidebar-content-wrapper').load('content.action?id=' + id);
				$('#page-content-wrapper').load('sidebar.action?id=' + id);
	        }
			
			if(id.slice(4) != 1) { // 사이드 바 안쓰는 경우
				$('#shirinkable-layout').css("display","none");
			} else {
				$('#shirinkable-layout').css("display","block");
			}
		}
		
		function shrinkToggle(id){
			console.log('shrinkToggle');
			var sel = document.getElementById(id);
			sel.classList.toggle('shrink');
		}

	</script>

</body>
</html>
