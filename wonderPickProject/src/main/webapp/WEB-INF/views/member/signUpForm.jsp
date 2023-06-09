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
            <div id="signUpMain" method="post">
                <form action="signUp.me">
                    <div id="signUpInput">
                        <label>* 아이디</label><br>
                        <input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요." required>
                        <div id="checkIdResult">첫 글자는 반드시 영문자로, 그리고 영문자, 숫자로 5~20자로<br> 입력해주세요.</div>
                        <br>
                        <label>* 비밀번호</label><br>
                        <input type="password" id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요." required>
                        <div id="checkPwdResult">영문자(대소문자 포함), 숫자, 특수문자(!@#$%^)를 하나씩 포함하여  8~20자로 입력해주세요.</div>
                        <br>
                        <label>* 비밀번호 재확인</label><br>
                        <input type="password" placeholder="비밀번호를 한번 더 입력해주세요." id="memberRepwd" required>
                        <div id="checkPwdReresult">위 비밀번호와 일치하게 입력해주세요.</div>
                        <br>
                        <label>* 이름</label><br>
                        <input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요." required>
                        <div id="checkNameResult">한글로 2글자 이상 입력해주세요. (입금자명과 동일해야합니다.)</div>
                        <br>
                        <label>* 닉네임</label><br>
                        <input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력해주세요." required>
                        <div id="checkNickResult">최소 1자 이상 20자이내로 자유롭게  입력해주세요.</div>
                        <br>
                        <label>* 전화번호</label><br>
                        <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요." required>
                        <div id="checkPhoneResult">- 없이 숫자만 입력해주세요.</div>
                        <br>
                        <label>이메일</label><br>
                        <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요.">
                        <input type="hidden" id="memberGrade" name="memberGrade" value="${ sessionScope.memberGrade }">
                    </div>
                    <div id="signUpCheckbox">
                        <input type="checkbox" id="ToUAgree"> 개인정보 수집/이용에 동의합니다.<br>
                        <input type="checkbox" id="emailAgree"> 이메일 수신에 동의합니다.<br>
                    </div>
                    <div>
                        <button type="submit" id="submitBtn">회원가입</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	
	<!-- 입력칸을 누르면 안내 문구 -->
	<script>
		// 아이디
		$('#memberId').on('click', function(){
			$('#checkIdResult').show();
		});
		// 비밀번호
		$('#memberPwd').on('click', function(){
			$('#checkPwdResult').show();
		});
		// 비밀번호 재확인
		$('#memberRepwd').on('click', function(){
			$('#checkPwdReresult').show();
		});
		// 이름
		$('#memberName').on('click', function(){
			$('#checkNameResult').show();
		});
		// 닉네임
		$('#nickName').on('click', function(){
			$('#checkNickResult').show();
		});
		// 전화번호
		$('#phone').on('click', function(){
			$('#checkPhoneResult').show();
		});
	</script>
	<!-- 정규표현식 검사 -->
	<script>
		$(function(){
			var errorColor = 'crimson';
			var successColor = '#FF8399';
			const $idInput = $('#signUpInput #memberId');
			const $pwdInput = $('#signUpInput #memberPwd');
			const $repwdInput = $('#signUpInput #memberRepwd');
			const $nameInput = $('#signUpInput #memberName');
			const $nickInput = $('#signUpInput #nickName');
			const $phoneInput = $('#signUpInput #phone');
			
			// 아이디 정규표현식 검사, 중복검사
			$idInput.keyup(function(){	
				var regExp = /^[a-zA-Z][a-zA-Z0-9]{4,19}$/;
				if(regExp.test($idInput.val())){
					if($idInput.val().length >= 5){
						$.ajax({
							url : 'idCheck.me',
							data : { checkId : $idInput.val()},
							success : function(result){
								if(result === "NNNNN"){
									$('#checkIdResult').css('color', errorColor ).text('중복된 아이디가 존재합니다.');
									$('#submitBtn').attr('disabled', true);
								} else {
									$('#checkIdResult').css('color', successColor).text('멋진 아이디내요!');
									$('#submitBtn').removeAttr('disabled');
								}
							}
						});
					} else {
						$('#checkIdResult').css('color', errorColor ).text('5글자 이상 입력해주세요');
						$('#submitBtn').attr('disabled', true);
					}
				} else {
					$('#checkIdResult').css('color', errorColor ).text('조건이 올바르지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 비밀번호 정규표현식 검사
			$pwdInput.keyup(function(){
				// 최소 8자 ~ 최대 20자, 문자, 숫자, 특수문자(!@#$%^)하나 포함
				regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^]).{8,20}$/;
				if(regExp.test($pwdInput.val())){
					$('#checkPwdResult').text('');
					$('#submitBtn').removeAttr('disabled');
				} else {
					$('#checkPwdResult').css('color', errorColor ).text('조건이 올바르지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 비밀번호 재확인
			$repwdInput.keyup(function(){
				if($repwdInput.val() == $pwdInput.val()){
					$('#checkPwdReresult').text('');
					$('#submitBtn').removeAttr('disabled');
				} else{
					$('#checkPwdReresult').css('color', errorColor ).text('비밀번호가 동일하지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 이름 정규표현식 검사
			$nameInput.keyup(function(){
				regExp = /^[가-힣]{2,}$/;
				if(regExp.test($nameInput.val())){
					$('#checkNameResult').text('');
					$('#submitBtn').removeAttr('disabled');
				} else {
					$('#checkNameResult').css('color', errorColor ).text('조건이 올바르지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 닉네임 정규표현식, 중복검사
			$nickInput.keyup(function(){
				regExp = /^[가-힣a-zA-Z0-9]{1,20}$/;
				if(regExp.test($nickInput.val())){
						$.ajax({
						url : 'nickCheck.me',
						data : { checkNick : $nickInput.val()},
						success : function(result){
							if(result === "NNNNN"){
								$('#checkNickResult').css('color', errorColor ).text('중복된 닉네임이 존재합니다.');
								$('#submitBtn').attr('disabled', true);
							} else {
								$('#checkNickResult').css('color', successColor).text('멋진 닉네임이내요!');
								$('#submitBtn').removeAttr('disabled');
							}
						}
					});
				} else {
					$('#checkNickResult').css('color', errorColor ).text('조건이 올바르지 않습니다.');
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 핸드폰 정규표현식
			$phoneInput.keyup(function(){
				console.log($phoneInput.val());
				regExp = /^[0-9]{10,11}$/;
				if(regExp.test($phoneInput.val())){
					$('#checkPhoneResult').text('');
					$('#submitBtn').removeAttr('disabled');
				} else {
					$('#checkPhoneResult').css('color', errorColor ).text('올바른 번호를 입력해주세요.');  
					$('#submitBtn').attr('disabled', true);
				}
			});
			
			// 모든 조건을 체크해서 submit버튼 활성화
		});
	</script>
</body>
</html>