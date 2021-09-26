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
    <%-- <script src="<c:url value="/resources/static/js/menu3_main.js"/>"></script> --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/static/menu3_style.css"/>">
    <title>Home</title>
</head>
<body>
	<div class="faqMenu3">
	<!-- faq -->
    <section class="faq">
        <div class="title">
            <header class="faq-h1">FAQ</header>
        </div>
        <div class="container">
            <div class="accordion">
                
                <div class="accordion-item" id="question1">
                    <a class="accordion-link" href="#question1">
                        1. 회원가입은 어떻게 이용하나요?
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            먼저, 로그인 버튼을 누르세요. 그리고 하단의 회원가입을 누르세요. <br>
                            그 다음 아이디를 설정하신 후, 중복 검사 버튼을 누르세요. <br>
                            그 다음 비밀번호를 설정하신 후, 비밀번호 확인 란에 다시 한번 작성해주세요. <br>
                            그 다음 이메일을 설정하신 후, 중복 검사 버튼을 누르세요. <br>
                            마지막으로 국적을 선택하신 후, 회원가입을 누르시면 가입이 완료됩니다.
                        </p>
                    </div>
                </div>

                <div class="accordion-item" id="question2">
                    <a class="accordion-link" href="#question2">
                        2. 리뷰 남길 장소를 추가하고 싶어요!
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            먼저, 로그인을 하세요. 그리고 지도 페이지 하단의 장소 추가 버튼을 누르세요 <br>
                            그 후, 추가할 장소에 핀을 찍고, 'OK' 버튼을 누르세요. <br>
                            추가할 장소의 이름을 입력하고 확인 버튼을 누르시면 장소가 추가됩니다.
                        </p>
                    </div>
                </div>

                <div class="accordion-item" id="question3">
                    <a class="accordion-link" href="#question3">
                        3. 내가 갔다 온 곳의 리뷰를 어떻게 남기나요?
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            먼저, 2번의 방법으로 리뷰를 남길 장소를 추가하세요. <br>
                            장소 추가 후, 사이드 바의 검색 버튼을 눌러 장소를 검색하세요. <br>
                            리뷰를 남기실 장소를 선택하고, 우측 '>' 버튼을 누르세요. <br>
                            그 후, 사이드 바 우측 상단의 리뷰쓰기 버튼을 누르세요. <br>
                            화면에 나온 리뷰쓰기 페이지에서 리뷰를 작성한 후, 등록을 누르시면 됩니다.
                        </p>
                    </div>
                </div>

                <div class="accordion-item" id="question4">
                    <a class="accordion-link" href="#question4">
                        4. 게시판 글을 쓰거나 댓글을 남기고 싶은데 어떻게 해야 하나요?
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            먼저, 로그인을 하세요. 게시글 탭을 누르세요. <br>
                            그 후, 우측 하단의 글쓰기 버튼을 누르세요. <br>
                            게시글 쓰기 페이지에서 글을 작성하신 후, 등록 버튼을 눌러 게시하세요. <br>
                            그리고 댓글을 남기려면 댓글을 남기고 싶은 글의 제목을 선택하세요. <br>
                            글에 들어가신 후, 하단 댓글 입력 란에 댓글을 작성하시고, 등록 버튼을 누르세요.
                        </p>
                    </div>
                </div>

                <div class="accordion-item" id="question5">
                    <a class="accordion-link" href="#question5">
                        5. 회원 정보는 어떻게 수정하나요?
                        <i class="fas fa-plus"></i>
                        <i class="fas fa-minus"></i>
                    </a>
                    <div class="answer">
                        <p>
                            먼저, My Page 탭을 누르세요. <br>
                            그 후, 회원정보 수정 버튼을 누르세요. <br>
                            현재 PW에 현재 비밀번호를 입력하시고, 새로운 PW에 새로운 비밀번호를 입력하세요. <br>
                            PW 확인에 새로운 비밀번호를 다시 한번 입력하세요. <br>
                            국적을 수정하실 경우에는 국적을 다시 선택하세요. <br>
                            수정이 끝났다면 수정완료 버튼을 누르세요.
                        </p>
                    </div>
                </div>

            </div>
        </div>
        
        <!-- contact -->
        <!-- <div class="contact">
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
        </div> -->
    </section>
    </div>
</body>
</html>
