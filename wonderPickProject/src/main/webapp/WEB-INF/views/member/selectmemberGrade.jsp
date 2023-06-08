<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Geologica:wght@900&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/selectmemberGrade.css">
</head>
<body>
	<div id="blankHeader"><!-- 헤더 만큼의 공간 --></div>
    <div id="mainWrap" class="clear">
        <div id="enrollLogo"><a href="main.re"><img src="resources/common/palette.png"/></a></div>
        <div>
            <div id="gradeTitle">
                <h1>어떤 서비스를<br>
                    이용하고 싶으신가요?</h1>
            </div>
            <div id="gradeSubTitle">
                <p>원하시는 회원가입 유형을 선택하세요.<br>
                    일반회원으로 가입 후에도 작가 등록이 가능합니다.</p>
            </div>
            <div id="gradeBtn">
                <div>
                    <label>서비스를 의뢰하고 싶다면</label><br>
                    <button id="gradeMember" value="'일반 회원'">일반 회원 가입</button>
                </div>
                <div>
                    <lable>전문성을 판매하고 싶다면</lable><br>
                    <button id="gradeAuthor" value="'작가'">작가 회원 가입</button>
                </div>
                <script>
                	$('#gradeMember').on('click', () => {
                        location.href="signUpForm.me?memberGrade=" + $('#gradeMember').val();
                    });
                    $('#gradeAuthor').on('click', () => {
                        location.href="signUpForm.me?memberGrade=" + $('#gradeAuthor').val();
                    });
                </script>
            </div>
        </div>
    </div>
</body>
</html>