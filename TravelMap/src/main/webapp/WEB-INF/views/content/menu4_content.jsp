<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
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
						<td class="listIDate">2017-05-04</td>
					</tr>
					
					<tr class="bbsListLine">
						<td class="listINum">2</td>
						<td class="listITitle">
						<a class="viewLink" href="bbsView.jsp">안녕하세요</a></td>
						<td class="listIName">홍길동</td>
						<td class="listIDate">2017-05-04</td>
					</tr>
					
					<tr class="bbsListLine">
						<td class="listINum">3</td>
						<td class="listITitle">
						<a class="viewLink" href="bbsView.jsp">안녕하세요</a></td>
						<td class="listIName">홍길동</td>
						<td class="listIDate">2017-05-04</td>
					</tr>
				</tbody>
			</table>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>