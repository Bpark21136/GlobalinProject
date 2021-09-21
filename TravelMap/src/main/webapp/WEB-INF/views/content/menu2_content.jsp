<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.container .bbs .header .bTitle{width: 300px; border-radius: 20px; text-align: center; font-size: 32px; color: var(--white-color); background-color: var(--faq-con-color);}
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
</style>
</head>
<body>
	
	<div class="container">
		<div class="bbs">
		<div class="header">
			<header class="bTitle">자유게시판</header>
		</div>
			<div align="right" class="bbsSearch">
				<input class="form-control bbsSearch" type="search" placeholder="검색어를 입력하세요." value="" id="bbsSearch-input" onkeyup="enterKey();">
				<span class="input-group-append">
	                <button class="btn bbsBtn-outline-secondary" type="submit" onclick="search();">
	                    <i class="fa fa-search"></i>
	                </button>
            	</span>
			</div>
			<div class="row">
				<table class="table table-striped" style="text-align: center; border: 0">
					<thead class="bbsListThead">
						<tr class="bbsListTitle">
							<th class="listTNum" text-align: center;">번호</th>
							<th class="listTTitle" text-align: center;">제목</th>
							<th class="listTName" text-align: center;">작성자</th>
							<th class="listTDate" text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody class="bbsListTbody">
						<tr class="bbsListLine">
							<td class="listINum">1</td>
							<td class="listITitle">
							<a class="viewLink" href="bbsView.jsp">안녕하세요</a></td>
							<td class="listIName">홍길동</td>
							<td class="listIDate">2021-09-21</td>
						</tr>
						
						<tr class="bbsListLine">
							<td class="listINum">2</td>
							<td class="listITitle">
							<a class="viewLink" href="bbsView.jsp">안녕하세요</a></td>
							<td class="listIName">홍길동</td>
							<td class="listIDate">2021-09-21</td>
						</tr>
						
						<tr class="bbsListLine">
							<td class="listINum">3</td>
							<td class="listITitle">
							<a class="viewLink" href="bbsView.jsp">안녕하세요</a></td>
							<td class="listIName">홍길동</td>
							<td class="listIDate">2021-09-21</td>
						</tr>
					</tbody>
				</table>
				<button type="button" onclick="#" class="btn btn-primary pull-right">글쓰기</button>
			</div>
		</div>
	</div>
</body>
</html>
