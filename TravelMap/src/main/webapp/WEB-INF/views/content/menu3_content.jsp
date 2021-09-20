<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
	<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- icon script -->
    <script src="https://kit.fontawesome.com/99f7873797.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/static/js/menu3_main.js"/>"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/static/menu3_style.css"/>">
    <title>Home</title>
</head>
<body>
	<div class="menu3">
	<!-- faq -->
    <section class="faq">
        <div class="title">
            <h1>FAQ</h1>
        </div>
        <div class="container">
            <div class="accordion">
                
                <div class="accordion-item" id="question1">
                    <a class="accordion-link" href="#question1">
                        게시판은 어떻게 이용하나요? 掲示板はどうして使用しますか？
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            먼저, 회원가입을 하시고 로그인을 하세요. 그리고 게시판 탭으로 들어가서 글쓰기 버튼을 누르세요.
                            마지막으로 제목과 글을 작성하신 후에 작성하기 버튼을 누르시면 됩니다.
                        </p>
                        <p>
                            まず、会員登録をしてログインしてください。そして、掲示板タブに入って、ライティングボタンを押してください。
                            最後に、タイトルと文章を作成した後に作成ボタンを押します。
                        </p>
                    </div>
                </div>

                <div class="accordion-item" id="question2">
                    <a class="accordion-link" href="#question2">
                        메인 페이지는 어떻게 사용하나요?
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            그러게요
                        </p>
                    </div>
                </div>

                <div class="accordion-item" id="question3">
                    <a class="accordion-link" href="#question3">
                        내가 갔다 온 곳의 리뷰를 남기고 싶어요!
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            마음 속에 간직하세요^^
                        </p>
                    </div>
                </div>

                <div class="accordion-item" id="question4">
                    <a class="accordion-link" href="#question4">
                        이 회사에 지원 하고 싶은 걸요?
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            이 회사는 곧 해체됩니다.
                        </p>
                    </div>
                </div>

                <div class="accordion-item" id="question5">
                    <a class="accordion-link" href="#question5">
                        회사에 연락드리고 싶어요!
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            하단 문의 창구를 통해 연락주세요.
                        </p>
                    </div>
                </div>

            </div>
        </div>
        
        <!-- contact -->
        <div class="contact">
            <div class="wrapper">
                <header>Send us a Message</header>
                <form action="#">
                    <div class="dbl-field">
                        <div class="field">
                            <input type="text" name="name" placeholder="Enter your name">
                            <i class="fas fa-user"></i>
                        </div>
    
                        <div class="field">
                            <input type="text" name="Email" placeholder="Enter your Email">
                            <i class="fas fa-envelope"></i>
                        </div>
                    </div>
    
                    <div class="dbl-field">
                        <div class="field">
                            <input type="text" name="phone" placeholder="Enter your phone">
                            <i class="fas fa-phone-alt"></i>
                        </div>
    
                        <div class="field">
                            <input type="text" name="website" placeholder="Enter your website">
                            <i class="fas fa-globe"></i>
                        </div>
                    </div>
    
                    <div class="message">
                        <textarea placeholder="Write your message" name="message"></textarea>
                        <i class="fas fa-paper-plane"></i>
                    </div>
    
                    <div class="button-area">
                        <button type="submit">Send Message</button>
                        <span>Sending your message...</span>
                    </div>
                </form>
            </div>
        </div>
    </section>
    </div>
</body>
</html>
