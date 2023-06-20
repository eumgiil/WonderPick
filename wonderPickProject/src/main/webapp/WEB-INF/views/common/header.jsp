<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wonder Pick</title>
<!-- google icon 스타일시트-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- google font 스타일시트 -->
<link href="https://fonts.googleapis.com/css2?family=Geologica:wght@900&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common/header.css">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
			<c:remove var="alertMsg" />
		</script>
	</c:if>
    <header class="clear">
        <div class="wrap clear">
            <div id="logo"><a href="main.re"><img src="resources/common/logo.png"/></a></div>
            <div id="mainMenuBar" class="clear">
                <ul id="mainMenu" class="clear">
                    <li class="mainCategory">
                        <a href="artList.bo"><span class="material-symbols-outlined">menu</span> 카테고리</a>
                            <ul class="detailCategory">
                                <li><a href="artList.bo?category=CI">캐릭터일러스트</a></li>
                                <li><a href="artList.bo?category=I">일러스트</a> </li>
                                <li><a href="artList.bo?category=V">버츄얼</a></li>
                                <li><a href="artList.bo?category=D">디자인</a></li>
                                <li><a href="artList.bo?category=W">웹툰</a></li>
                                <li><a href="artList.bo?category=E">기타</a></li>
                            </ul>
                    </li>
                    <li class="mainCategory"><a href="#">그림의뢰</a></li>
                    <li class="mainCategory"><a href="list.go?cPage=1">굿즈판매</a></li>
                    <li class="mainCategory">
                        <a href="#">공지사항</a>
                            <ul class="detailCategory">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="selectTop10.ct">공모전</a></li>
                                <li><a href="#">1대1문의</a></li>
                                <li><a href="#">광고문의</a></li>
                            </ul>
                    </li>
                </ul>
                <!-- 검색 시작 -->
                <div class="search_area">
                    <form action="searchResult.ct" method="get">
                        <div id="search_main">
                            <input type="text" placeholder="검색어를 입력해주세요" name="search" id="search_input" onkeyup="searchAutoComplet();" >
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
                            <div >
                                <ul id="search_auto"></ul>
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

                        // 검색어 자동완성

                        function searchAutoComplet(){
                            
                            httpRequest = new XMLHttpRequest();
                            
                            var searchElement = document.getElementById('search_input');
                            var searchValue = searchElement.value;
                            var searchLength = searchValue.length
                            
                            // 스페이스바 막기
                            if(searchLength == 1 && searchValue == ' '){
                                document.getElementById('search_input').value = '';
                            }
                            
                            httpRequest.onreadystatechange = () => {
                                
                                if(httpRequest.readyState === XMLHttpRequest.DONE){
                                    if(httpRequest.status === 200){

                                        let result = httpRequest.response;
                                        var list = document.getElementById('search_auto');
                                        
                                        if(result == 0){
                                           list.replaceChildren();
                                        }else{
                                            var value = '';

                                            for(var i in result){
                                                let li = document.createElement('li');
                                                li.append(result[i].searchContent);
                                                list.append(li);
                                            }
                                        }
                                    };
                                };
                               };
    
                               httpRequest.open('POST', 'searchAutoComplet?searchValue=' + searchValue );
                               httpRequest.responseType = 'json';
                               httpRequest.send();
                           }



                    </script>
                <ul id="memberMenu" class="clear">
                	<c:choose>
                		<c:when test="${ empty loginMember }" >
		                    <li><a data-toggle="modal" data-target="#loginModal">로그인</a></li>
		                    <li><a href="selectGrade.me">회원가입</a></li>
                		</c:when>
                		<c:otherwise>
                			<li><a href="myPage.me">마이페이지</a></li>
	                    	<li><a href="logout.me">로그아웃</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
            <!-- 로그인 모달 -->
             <div class="modal fade" id="loginModal">
				<div class="modal-dialog modal-dialog-centered">
		            <div class="modal-content" id="loginModal-cont	ent">
		                <!-- Modal Header -->
		                <div class="modal-header" id="loginModal-header">
		                    <img src="resources/common/palette.png">
		                    <button type="button" class="close" data-dismiss="modal">&times;</button>
		                </div>
                        <h1 id="loginTitle">WONDER PICK</h1>
		                <form action="login.me" method="post">
		                    <!-- Modal body -->
		                    <div class="modal-body" id="loginModal-body">
		                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디를 입력해주세요." id="memberId" name="memberId" required> <br>
		                        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력해주세요." id="memberPwd" name="memberPwd" required>
		                    </div>
		                    <!-- Modal footer -->  
		                    <div class="modal-footer" id="loginModal-footer">
		                        <button type="submit" class="btn btn-primary">로그인</button>
                                <div id="loginModal-href">
                                    <a href="#">아이디·비밀번호 찾기</a> | <a href="#">회원가입</a>
                                </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
        </div>
    </header>
    <div class="headerBlank"></div>
    <div id="top"><a href="#"><span class="material-symbols-outlined">expand_less</span></a></div>
</body>
</html>