<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <jsp:include page="../../common/header.jsp" />


   <div id="all_area">
    <div id="main_area">

        <div>
            여기는 썸네일 이랑 제목 희망가격 닉네임 들어갈자리
            ${ b }
            <div>
                <img src="${ b.get(0).filePath }" alt="">ss
            </div>
            <div>
                <div>제목 :  ${b.get(0).boardTitle } </div>
                <div>닉네임 : ${b.get(0).nickName } </div>
                <div>희망가격 ${ b.get(0).price }</div>
                <div></div>
            </div>
        </div>


        <div>
            좋아요 투표 
            ${ b.get(0).voteCount }
        </div>

        <div>
            글 내용 
            ${ b.get(0).boardContent }
        </div>

        <div>
            
            나머지 4개 사진들
            <img src="  ${ b.get(1).filePath } " alt="">
            <img src="  ${ b.get(2).filePath } " alt="">
            <img src="  ${ b.get(3).filePath } " alt="">
            <img src="  ${ b.get(4).filePath } " alt="">
           
        </div>
       
       


    </div>
   </div>

</body>
</html>