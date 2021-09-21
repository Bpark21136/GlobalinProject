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
	        <a href="#">Ex</a>
	      </li>
	      <li><a class="<%=menu ==  1 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu1" >
	      		<img src="<c:url value="/resources/static/img/sidebar_menu1.png"/>">
	      		</a>
	      		</li>
	      <li><a class="<%=menu ==  2 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu2" >
	      		<img src="<c:url value="/resources/static/img/sidebar_menu2.png"/>">
	      		</a>
	      		</li>
	      <li><a class="<%=menu ==  3 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu3" >
	      		<img src="<c:url value="/resources/static/img/sidebar_menu3.png"/>">
	      		</a>
	      		</li>
          <li>
          <li><a class="<%=menu ==  4 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu4" >
	      		<img src="<c:url value="/resources/static/img/sidebar_menu3.png"/>">
	      		</a>
	      		</li>
          <li>
<<<<<<< HEAD
          <li><a class="<%=menu ==  5 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu5" >
	      		<img src="<c:url value="/resources/static/img/sidebar_menu3.png"/>">
	      		</a>
	      		</li>
          <li>
          <button type="button" onclick="location.href='./login.action'" class="btn btn-secondary" id="btn" >로그인</button></li>
=======
          <%if(request.getAttribute("userId") == null) { %>
          	<button type="button" onclick="location.href='./login.action'" class="btn btn-secondary" id="btn" >로그인</button></li>
          <%} else if(request.getAttribute("userId") != null) {%>
          	<button type="button" onclick="location.href='./logout.action'" class="btn btn-secondary" id="btn" >로그아웃</button></li>
          <%} %>
>>>>>>> branch 'main' of https://github.com/Bpark21136/GlobalinProject.git
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
	<script type="text/javascript">
		var menu = <%=menu%>;
		loadMenu('menu' + menu);
		console.log('menu',menu);
		window.onpopstate = function(event) {
			const url = new URL(window.location.href);
			console.log('popstate',url);
			const urlParams = url.searchParams;
			console.log('popstate',urlParams);
			console.log('popstate',menu,' ',urlParams.get('menu'));
			if(urlParams.get('menu') == undefined && menu == 1) {
				return;
			}
			else if(menu == urlParams.get('menu')) {
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
			console.log(id.slice(4));
			$('#sidebar-content-wrapper').load('content.action?id=' + id);
			$('#page-content-wrapper').load('sidebar.action?id=' + id);
			
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
	<script src="<c:url value="/resources/static/js/menu1.js"/>"></script>
</body>
</html>
