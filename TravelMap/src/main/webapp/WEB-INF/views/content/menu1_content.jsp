<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
  <body>

    <div id="map"></div>

	<div id="review-detail"style="position:absolute;padding-left:420px;padding-top:70px;padding-bottom:70px;width:100%;min-height:100%;top:0px;left:0px;background-color:var(--back-color);display:none">
	</div>
	<%--리뷰 자세히 보기(ajax) --%>
	
	<div id="review-form"style="position:absolute;padding-left:420px;padding-top:70px;padding-bottom:70px;width:100%;min-height:100%;top:0px;left:0px;background-color:var(--back-color);display:none">
	</div>
	<%--리뷰 작성 폼(ajax)--%>
	
    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaRSDLOnv8aUBSMcX3Cpg5kkQNdcVb9w0&callback=initMap&libraries=&v=weekly"
    	async
    ></script>
  </body>
</html>