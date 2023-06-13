<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #all_area{
        width: 1300px;
        height: auto;
        margin: auto;
    }
    #main_area{
        box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
        border-radius: 20px;
        margin: auto;
        width: 900px;
        padding: 20px;
        margin-top:20px;
        height: auto;
    }
    #thumbnail_image{
        width: 200px;
        height: 200px;
    }
    .image{
        width: 100px;
        height: 100px;
        margin: auto;
        border: 1px solid black;
    }
    #header_area{
        border: 1px solid black;
    }
    #thumbnail_area{
        border: 1px solid black;
        background-color: red;
        display: inline;
        margin: auto;
    }
    #text_area2{
        border: 1px solid black;
        background-color: yellow;
        display: inline;
        margin: auto;
    }
    #body_area{
        border: 1px solid black;
    }
    .adad{
        display: inline-table;
    }
    #vote_heart{
        color: red;
        font-size: large;
    }
    #image_area{
        margin: auto;
    }
   
</style>
</head>
<body>

    <jsp:include page="../../common/header.jsp" />


   <div id="all_area">
    <div id="main_area">

        <div id="header_area">
            <div>
                여기는 썸네일 이랑 제목 희망가격 닉네임 들어갈자리
            </div>
           
            <div id="thumbnail_area" class="adad" >
                <img src="${ b.get(0).filePath }" alt="" id="thumbnail_image">
            </div>
           
            <div id="text_area2" class="adad">
                <div class="adad">
                        제목 : ${ b.get(0).boardTitle }
                </div>
                <div id="nickName" class="adad">닉네임 :${ b.get(0).nickName }</div>
                <div class="adad">희망판매가 : ${ b.get(0).price } </div>


                <table border="1">
                    <tr>
                        <td>
                            제목 : ${ b.get(0).boardTitle }
                        </td>
                    </tr>
                    <tr>
                        <td>
                            닉네임 :${ b.get(0).nickName }
                        </td>
                    </tr>
                    <tr>
                        <td>
                            희망판매가 : ${ b.get(0).price } 
                        </td>
                    </tr>
                </table>
            </div>
               
        </div>

        <div id="body_area">

            <div>
                좋아요 투표 
                <span id="vote_heart">♡</span>
                ${ b.get(0).voteCount }
            </div>
    
            <div>
                글 내용 
                ${ b.get(0).boardContent }
            </div>
    
            <div id="image_area">
    
                

                <c:forEach items="${ b }" var="b">

                    <img src="${ b.filePath }" alt="" class="image">

                </c:forEach>




          
            </div>

        </div>
       
       


    </div>
   </div>

</body>
</html>