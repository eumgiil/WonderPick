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
<link rel="stylesheet" href="resources/css/common/header.css">
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