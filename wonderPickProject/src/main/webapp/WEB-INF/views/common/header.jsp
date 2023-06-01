<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wonder Pick</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/common/header.css">
<style>
    /* 스타일 초기화 */
    body {
        line-height: 1;
    }
    ol, ul {
        list-style: none;
    }
    blockquote, q {
        quotes: none;
    }
    blockquote:before, blockquote:after,
    q:before, q:after {
        content: '';
        content: none;
    }
    table {
        border-collapse: collapse;
        border-spacing: 0;
        
    }
    button{
        cursor: pointer;
    }
    *{
        padding : 0;
        margin : 0;
        list-style: none;
        text-decoration : none;
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
    }

    /* 공용 클래스 */
    /* float 부모요소에는 무조건 clear 삽입 */
    .clear::after {
        content: '';
        display: block;
        clear: both;
    }

    /* 헤더 영역 */
    header{
        z-index : 10000;
        width : 100%;
        height : 80px;
        display : block;
        position: fixed;
        border-bottom: 1px solid rgb(226, 220, 220);
        background-color: #fff;
    }

    .wrap {
        width: 1300px;
        margin: 0 auto;
        height: 100%;
    }
    #logo{
        float: left;
        height: 50px;
        width: 200px;
        margin-top: 13px;
        overflow: hidden;

    }
    #logo img{
        width : 100%;
        height : 100%;
    }

    #mainMenuBar{
        float: left;
        width: 80%;
    }
    #mainMenuBar .mainCategory{
        float: left;
        padding-top: 30px;
        line-height: 49px;
    }

    /* 메인메뉴 */
    #mainMenu{
        float : left;
        margin-right: 20px;
    }
    #mainMenu .mainCategory:first-child{
        width : 80px;
    }
    #mainMenu .mainCategory{
        float: left;
        margin-left: 20px;
        width: 65px;
        text-align: center;
    }
    #mainMenu a:hover{
        border-bottom: 2px solid #FF8399;
    }
    #mainMenu li a {
        color: #171717;
    }
    #mainMenu a{
        float: left;
    }

    /* 카테고리 아이콘 */
    #mainMenu .material-symbols-outlined {
        font-size: 15px;
        font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 48
    }
    
    /* 카테고리 */
    #mainMenu > li > ul{
        display : none;
    }
    #mainMenu > li > a:hover + ul{
        display : block;
    }
    #mainMenu > li > ul:hover{
        display : block;
    }
    .detailCategory a{
        width:120px;
        height:50px;
        background-color: #fff;
    }
    .detailCategory li{
        padding-top : 0px;
    }

    /* 회원메뉴 */
    #memberMenu {
        float: right;

    }
    #memberMenu li{
        margin-left: 16px;
        font-size: 13px;
        border: 1px solid rgb(223,223,223);
        padding: 8px 16px 8px;
        line-height: 16px;
        margin-top: 35px;
        border-radius: 30px;
        cursor: pointer;
        float: left;
        margin-left: 20px;
        text-align: center;
    }
    #memberMenu li a{
        color: #161616 !important;
    }
    #memberMenu li:hover{
        border : 1px solid #FF8399;
        background-color: #fff3f3;
    }

    /* 검색 */
    .search_area{
    /*   border:1px solid blue; */
    }
    #search_main{
        float: left;
        width: 300px;
        height: 36px;
        margin-top: 35px;
        margin-left : 90px;
        border: 1px solid black;
        border-radius: 20px;
        padding-left: 10px;
    }
    #search_main button{
        margin : 5px 10px 5px 0px;
        float : right;
        border: none;
        background-color : #fff;
    }

    /* 검색 아이콘 */
    #search_main .material-symbols-outlined {
        font-size: 25px;
        font-variation-settings:
        'FILL' 0,
        'wght' 400,
        'GRAD' 0,
        'opsz' 48
    }
    #search_input{
        margin-top: 3px;
        margin-left : 5px;
        width: 160px;
        height: 26px;
        line-height: 30px;
        border: none;
        font-size: 12px;
    }
    #search_input:focus{
        outline: none;
    }

    /* 검색리스트 */
    #search_recent_no{
        text-align: center;
        border-bottom: 1px solid pink;
        height : 30px;
        color: gray;
    }
    .search_list{  
        /*  border:1px solid black; */  /* 구분하려고 해둔것 나중에 지워야 함 */
    }
    #search_list_area{
        /* border: 1px solid black; */
        position: absolute;
        left : 885px;
        width: 300px;
        height: auto;
        top:80px;
        border-radius: 10px;
        padding: 15px;
        display: none;
        box-shadow: 0px 4px 10px 0px rgba(0, 0, 0, 0.1) ;
        background-color: #fff;
    }
    #search_list_area li{
        float: none;
        padding-top: 0px;
        height : 30px;
        line-height: 30px;
        padding-left: 10px;
    }
    #search_list_area ul>li:hover{
        cursor: pointer;
        background-color: rgb(248, 229, 233);
        border-radius: 10px;
    }
    #search_recent_title{ /* 최근검색어 너무붙어있어서 띄우기 */
        padding: 10px;
    }

    /* 헤더 빈공간 채워놓는 용 */
    .headerBlank{
        height : 80px;
    }
    
    /* 탑버튼 아이콘 */
    #top .material-symbols-outlined {
        font-variation-settings:
        'FILL' 0,
        'wght' 400,
        'GRAD' 0,
        'opsz' 48
    }

    /* 탑버튼 */
    #top a{
        width: 50px;
		height: 50px;
		background-color: #FF8399;
		position: fixed;
		bottom: 5%;
		right: 5%;
		border-radius: 50px;
		color: white;
		text-align: center;
		line-height: 50px;
    }
    #top span{
        margin-top: 13px;
    }
</style>
</head>
<body>
    <header class="clear">
        <div class="wrap clear">
            <div id="logo"><img src="resources/common/logo.png"/></div>
            <div id="mainMenuBar" class="clear">
                <ul id="mainMenu" class="clear">
                    <li class="mainCategory">
                        <a href="#"><span class="material-symbols-outlined">menu</span> 카테고리</a>
                            <ul class="detailCategory">
                                <li><a href="#">캐릭터일러스트</a></li>
                                <li><a href="#">일러스트</a> </li>
                                <li><a href="#">버츄얼</a></li>
                                <li><a href="#">디자인</a></li>
                                <li><a href="#">웹툰</a></li>
                                <li><a href="#">기타</a></li>
                            </ul>
                    </li>
                    <li class="mainCategory"><a href="#">그림의뢰</a></li>
                    <li class="mainCategory"><a href="#">굿즈판매</a></li>
                    <li class="mainCategory">
                        <a href="#">공지사항</a>
                            <ul class="detailCategory">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">1대1문의</a></li>
                                <li><a href="#">광고문의</a></li>
                            </ul>
                    </li>
                </ul>
                <!-- 검색 시작 -->
                <div class="search_area">
                    <form action="#" method="get">
                        <div id="search_main">
                            <input type="text" placeholder="검색어를 입력해주세요" name="search" id="search_input" >
                            <button type="submit"><span class="material-symbols-outlined"> search</span></button>
                        </div>
                        <div id="search_list_area">
                            <!--
                                <div class="search_recent">
                                    <ul>
                                        <li>최근검색은 최대 3개까지만</li>
                                        <li>
                                        <span>2</span>
                                        </li>
                                        <li>3</li>
                                    </ul>
                                </div>
                            -->
                            <div class="search_recent" align="center" id="search_recent_no">
                                최근 검색어가 없습니다.
                            </div>
                            <div class="search_auto">
                                <ul>
                                    <li>여기는 자동완성 list</li>
                                    <li>2</li>
                                    <li>3</li>
                                    <li>4</li>
                                    <li>5</li>
                                    <li>6</li>
                                    <li>7</li>
                                </ul>
                            </div>
                        </div>
                    </form>
                  </div>
                  <script>
                    // 클릭하면 보이게끔
                    /*  $('#search_input').click(function(){
                        $('#search_list_area').css("display","block");
                        }) */
                
                        // 클릭하면 보이게 끔
                        // 바닐라 자바스크립트
                        document.getElementById('search_input').addEventListener('click', () => {
                            document.getElementById('search_list_area').style.display = 'block';
                        })
                
                
                
                        // 다른부분 누르면 다시 들어가는 부분: 일단 되는데 여기 다시 생각해보기
                        document.addEventListener('mouseup',function(e){
                        var list = document.getElementById('search_list_area');
                        if(!list.contains(e.target)){
                            list.style.display='none';
                        }
                        })
                
                        /* ESC 키 누를시 팝업 닫기 */
                        $(document).keydown(function(e){
                        //keyCode 구 브라우저, which 현재 브라우저
                            var code = e.keyCode || e.which;
                        
                            if (code == 27) { // 27은 ESC 키번호
                            $('#search_list_area').css("display","none");
                            }
                        });
                    </script>
                <ul id="memberMenu" class="clear">
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                </ul>
            </div>
            
        </div>
    </header>
    <div class="headerBlank"></div>
    <div id="top"><a href="#"><span class="material-symbols-outlined">expand_less</span></a></div>
</body>
</html>