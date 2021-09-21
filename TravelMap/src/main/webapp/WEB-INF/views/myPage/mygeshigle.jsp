<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyGeshigle</title>
    <style>
    	#my-bbs-list {display:flex; justify-content:center; background-color: var(--back-color);}
    	.my-bbs-list .my-bbs-fd {margin-top: 100px; align-content: center; width: 100%;}
    	.container .row .table.table-striped{box-shadow: 0.5rem 4px 0.5rem var(--shadow-color);}
    	.my-bbs-legend {display: flex; justify-content: center; margin-bottom: 73px;} 
    	.my-bbs-legend .main{text-align: center; font-size: 40px; margin: 0;}
    	.table.table-striped{box-shadow: 0.5rem 4px 0.5rem var(--shadow-color);}
        .bbsListTitle{background-color: var(--faq-con-color);}
		.bbsListTitle *{color: var(--white-color);}
		.bbsListLine *{color: var(--white-color); text-decoration: none;}
		.bbsListTbody {background-color: var(--answer-back-color);}
		.btn.my-bbs-writeBtn{align-items: right; background-color: var(--faq-con-color); color: var(--white-color);}
    </style>
</head>
<body>
	<div id="my-bbs-list">
		<div class="container my-bbs-list" style="background-color: #534bae;">
			<fieldset class="my-bbs-fd">
			    <div class="my-bbs-div1" style="color: white;">
					<legend class="my-bbs-legend">
					    <div class="dc" style="width: 300px; height: auto; border-radius: 20px; background-color: #1a237e;
					    padding: 0;">
					    	<header class="main">내 게시글</header>
						</div>
					</legend>
				</div>
				
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
				<button type="button" onclick="#" class="btn my-bbs-writeBtn">글쓰기</button>
				</div>
			</fieldset>
		</div>
	</div>
    
</body>
</html>