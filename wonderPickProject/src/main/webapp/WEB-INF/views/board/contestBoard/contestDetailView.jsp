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
        margin: auto;
    }


    #header_table{
        margin: auto;
    }
  
    #vote_heart{
        color: red;
        font-size: 80px;
    }
   
    #heart_area{
        text-align: center;
        font-size: 80px;
    }

    #body_area{
        margin: auto;
    }
   
</style>
</head>
<body>

    <jsp:include page="../../common/header.jsp" />


   <div id="all_area">
    <div id="main_area">

        <div id="header_area">
            <table border="1" id="header_table">
                <tr>
                    <td rowspan="4">
                        <div>
                            <img src="${ b.get(0).filePath }" alt="" id="thumbnail_image">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                            <h1>
                                ${ b.get(0).boardTitle }
                            </h1>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                            닉네임 :${ b.get(0).nickName }
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                            <h3>
                                등록자 희망 판매가 : ${ b.get(0).price } 
                            </h3>
                        </span>
                    </td>
                </tr>
            </table>
        </div>

        <div id="body_area" align="center">

            <div id="heart_area">
                <span id="vote_heart">♡</span>
                <span id="vote_count">${ b.get(0).voteCount }</span>
            </div>
    
            <div>
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