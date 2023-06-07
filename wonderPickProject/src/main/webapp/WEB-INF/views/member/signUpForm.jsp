<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- google font 스타일시트 -->
<link href="https://fonts.googleapis.com/css2?family=Geologica:wght@900&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/signUpForm.css">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div id="blankHeader"><!-- 헤더 만큼의 공간 --></div>
    <div id="mainWrap" class="clear">
        <div id="enrollLogo"><a href="main.re"><img src="resources/common/palette.png"/></a></div>
        <div>
            <div id="signUpTitle">
                <h1>회원가입</h1>
            </div>
            <div id="signUpMain">
                <form action="signUp.me">
                    <div id="signUpInput">
                        <label>아이디</label><br>
                        <input type="text" placeholder="아이디를 입력해주세요.">
                        <br>
                        <label>비밀번호</label><br>
                        <input type="password" placeholder="비밀번호를 입력해주세요.">
                        <br>
                        <label>비밀번호 재확인</label><br>
                        <input type="password" placeholder="비밀번호를 한번 더 입력해주세요.">
                        <br>
                        <label>이름</label><br>
                        <input type="text" placeholder="이름을 입력해주세요.">
                        <br>
                        <label>닉네임</label><br>
                        <input type="text" placeholder="닉네임을 입력해주세요.">
                        <br>
                        <label>전화번호</label><br>
                        <input type="text" placeholder="전화번호를 입력해주세요.">
                        <br>
                        <label>이메일</label><br>
                        <input type="email" placeholder="이메일을 입력해주세요.">
                    </div>
                    <div id="signUpCheckbox">
                        <input type="checkbox"> 이용약관 수집에 동의합니다.<br>
                        <input type="checkbox"> 이메일 수신에 동의합니다.<br>
                    </div>
                    <div>
                        <button type="submit">회원가입</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	
	<script>
		console.log('${sessionScope.memberGrade}');
	</script>
</body>
</html>