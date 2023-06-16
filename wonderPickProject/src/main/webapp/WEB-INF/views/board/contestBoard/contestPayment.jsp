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
 
         <div id="header_area">
             <table border="1" id="header_table">
                 <tr>
                     <td rowspan="4">
                         <div>
                             <img src="#" alt="" id="thumbnail_image">
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
 
             ${ b }
             <div>
                 ${ b.get(0).boardContent }
             </div>
 
             <div id="heart_area">
                 <!-- <c:choose>
                     <c:when test="${ b.get(0).memberNo != 0 and b.get(0).memberNo != null }" >
                         <span class="vote_heart">♥</span>
                     </c:when>
                     <c:otherwise>
                         <span class="vote_heart">♡</span>
                     </c:otherwise>
                 </c:choose> -->
 
                 <span id="vote_count">투표수 자리</span>
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