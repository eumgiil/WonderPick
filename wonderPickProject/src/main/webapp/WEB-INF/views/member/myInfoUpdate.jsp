<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>test</title>
<link rel="stylesheet" href="resources/css/member/myInfoUpdate.css" />
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="wrap">
        <jsp:include page="leftContent.jsp" />
        <div id="rightContent">
            <p>내 정보 조회 및 수정</p>
            <div id="rightMainContent">
                <div id="rightProfile">
                    <img src="resources/memberUpfiles/basicProfile.jpg">
                    <button>프로필 변경</button>
                </div>
                <div id="rightInfo">
                    <label>아이디</label><br>
                    <input type="text" value="${sessionScope.loginMember.memberId}" readonly />
                    <br>
                    <label>이름</label><br>
                    <input type="text" value="${sessionScope.loginMember.memberName}" />
                    <br>
                    <label>닉네임</label><br>
                    <input type="text" value="${sessionScope.loginMember.nickName}" />
                    <br>
                    <label>전화번호</label><br>
                    <input type="text" value="${sessionScope.loginMember.phone}" />
                    <hr>
                    <label>주소</label><br>
                    <input type="text" value="${sessionScope.loginMember.adress}" />
                    <br>
                    <label>계좌번호</label><br>
                    <input type="text" value="${sessionScope.loginMember.payAccount}" />
                    <br>
                    <label>이메일 수신 동의</label><br>
                    <input type="checkbox" />
                    <br>
                    <hr>
                    <label>회원가입 날짜</label><br>
                    <input type="text" readonly value="${sessionScope.loginMember.enrollDate}" />
                    <br>
                    <label>수정날짜</label><br>
                    <input type="text" readonly value="${sessionScope.loginMember.modifyDate}" />
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>