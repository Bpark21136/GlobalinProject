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
	      <li><a class="<%=menu ==  3 ?  "sel" : "" %>" onclick="menuClick(this.id)" id="menu3" >
	      		<img src="<c:url value="/resources/static/img/sidebar_menu3.png"/>">
	      		</a>
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
		window.onpopstate = function(event) {
			const url = new URL(window.location.href);
			console.log('popstate',url);
			const urlParams = url.searchParams;
			console.log('popstate',urlParams);
			if(urlParams.get('menu') == undefined) {
				menu = 1;
			}
			else {
				menu = urlParams.get('menu');
			}
	        changeSel('menu' + menu);
	        loadMenu('menu' + menu);
	      };
		function menuClick(id) {
			console.log('menu click');
			const id_val = id.slice(4);
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
			$('#sidebar-content-wrapper').load('content.do?id=' + id);
			$('#page-content-wrapper').load('sidebar.do?id=' + id);
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
