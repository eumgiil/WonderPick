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
                    <label>아이디</label>
                    <input type="text" value="${sessionScope.loginMember.memberId}" readonly />
                    <br>
                    <label>이름</label>
                    <input type="text" value="${sessionScope.loginMember.memberName}" />
                    <br>
                    <label>닉네임</label>
                    <input type="text" value="${sessionScope.loginMember.nickName}" />
                    <br>
                    <label>전화번호</label>
                    <input type="text" value="${sessionScope.loginMember.phone}" />
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>