<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%ArrayList<Map<String,Object>> articles = (ArrayList<Map<String,Object>>) request.getAttribute("articles");%>
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
	.container .bbs {padding-top: 100px; font-family: "Roboto", sans-serif;}
	.container .bbs .header {display: flex; justify-content: center;}
	.container .bbs .header .bTitle{width: 300px; border-radius: 20px; text-align: center; font-size: 40px; color: var(--white-color); background-color: var(--faq-con-color);}
	.container .bbs .bbsSearch .form-control.bbsSearch{margin: 0; display:inline; margin-top: 30px;margin-bottom: 5px;width: 200px;}
	.container .bbs .bbsSearch .input-group-append{display:inline;}
	.container .bbs .bbsSearch .input-group-append .btn.bbsBtn-outline-secondary{background-color: var(--faq-con-color);}
	.container .bbs .bbsSearch .input-group-append .fa.fa-search{color: var(--white-color);}
	.container .row .table.table-striped{box-shadow: 0.5rem 4px 0.5rem var(--shadow-color);}
	.bbsListTitle{background-color: var(--faq-con-color);}
	.bbsListTitle *{color: var(--white-color);}
	.bbsListLine *{color: var(--white-color); text-decoration: none;}
	.bbsListTbody {background-color: var(--answer-back-color);}
	.btn.btn-primary.pull-right{background-color: var(--faq-con-color); color: var(--white-color);}
	.btn.btn-primary{background-color: var(--faq-con-color); color: var(--white-color);}
</style>
</head>
<body>
	<div style="position:fixed;top:0px;right:0px;z-index:10;cursor:pointer;" onclick="location.href='start.action?menu=4';">
			<i class="fa fa-window-close fa-fw fa-2x" aria-hidden="true"></i>
	</div>
	<div class="container">
		<div class="bbs">
		<div class="header">
			<header class="bTitle">내 게시글</header>
		</div>
			<div style = "display:flex;justify-content: center;flex-direction :column;" class="row">
				<table class="table table-striped" style="text-align: center; border: 0">
					<thead class="bbsListThead">
						<tr class="bbsListTitle">
							<th class="listTNum">번호</th>
							<th class="listTTitle">제목</th>
							<th class="listTName">작성자</th>
							<th class="listTDate">작성일</th>
						</tr>
					</thead>
					<tbody class="bbsListTbody">
						<%for(int i = 0; i < articles.size();i++) { %>
						<tr class="bbsListLine">
							<td class="listINum"><%=articles.get(i).get("ARTICLEID")%></td>
							<td class="listITitle">
							<a class="viewLink" href="" data-aid="<%=articles.get(i).get("ARTICLEID")%>"><%=articles.get(i).get("TITLE")%></a></td>
							<td class="listIName"><%=articles.get(i).get("USERID")%></td>
							<td class="listIDate"><%=articles.get(i).get("DATE")%></td>
						</tr>
						<%}%>
					</tbody>
				</table>
				<div style="display:flex;justify-content: center;align-items: center;">
					<button style="width:36px;height:36px"class="btn btn-primary" onclick="myArticlePrev(<%=request.getParameter("page")%>)">
			                   <i class="fa fa-angle-left"></i>
			        </button>
			        <span style="margin-left:10px;color: var(--white-color);" id="my-article-current-page">
			        <%=request.getParameter("page")%>
			        </span>
			        <span style="color: var(--white-color);">
			        /
			        </span>
			        <span style="margin-right:10px;color: var(--white-color);" id="my-article-max-page">
			        ${maxPage}
			        </span>
			        <button style="width:36px;height:36px"class="btn btn-primary" onclick="myArticleNext(<%=request.getParameter("page")%>)">
			                   <i class="fa fa-angle-right"></i>
			        </button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	viewDetail();
	
	
	</script>
</body>
</html>
