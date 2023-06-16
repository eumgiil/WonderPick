<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>그판매목록페이지</title>
    <style>
        .all_area{
            width:1300px;
            margin:auto;
            margin-top: 150px;
        } 
        .leftouter{
            width: 200px;
            /* display: inline-block; */
            float: left;
        }
        .topouter{
            width : 900px;
            display: inline-block;
        }
        #option{
            width: 100px;
            height: 35px;
        }
        input{
            width: 300px;
            height: 35px;
        }




        .pink{
            color: rgb(255, 131, 153);
        }
        .list_img{
            width:100%;
            height:300px
        }
        .artist_img{
            width: 50px;
            height: 50px;
        }
        .item{
            display:inline-block;
            width:270px;
            margin: 5px;
            margin-left: 10px;
        }
        .list_all{
            text-align: left;
            margin-left:10px;
        }
        .goodsInfo th{
            width:150px;
        }
        .right{
            text-align: right;
        }
        .line{
            width: 600px;
            border: 1px solid gray;
        }


     
        
    </style>
 
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
    <div class="all_area"> <!-- 전체 -->
        
        <div class="leftouter">
            <jsp:include page="artBoardCategory.jsp"/>
        </div>

        <div class="topouter" align="center">
            <h2 class="pink" align="center">그림</h2>
            <hr class="line">
            <div class="">
                <h6 style="width:500px; display: inline-block;"> ${list.size()}개의 상품이 있습니다.</h6>
                
                <%-- <c:if test="${ not empty loginUser} }"> --%>
	                <button onclick="location.href='enrollForm.at'">글쓰기</button>
                <%-- </c:if> --%>
                
            </div>
            <div id="searchGoods">
                <select name="" id="option">
                    <option value="">전체</option>
                    <option value="">작가명</option>
                    <option value="">제목순</option>
                </select>
                <input type="text" value="" name="searchGoods">
                <button style="background-color: white; border: none;">
                    <img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-search-strong-512.png" alt="" width="40">
                </button>
                <select name="" id="option">
                    <option value="">인기순</option>
                    <option value="">가격 낮은 순</option>
                    <option value="">최신 등록순</option>
                </select>
            </div>


            <br><br><br>

            
            <div class="list_all"><!-- list  div -->
                <c:choose>
                    <c:when test="${ not empty list }">

                <!-- 필요한정보 : 글번호, 해당사진, 해당작가 -->
                        <c:forEach items="${ list }" var = "b">
                            <div class="item" onclick="location.href='artDetail.bo?bno=${ b.boardNo }'">
                                <img class="list_img" src="${ b.modifyName }"><br>
                                <table class="goodsInfo" width="100%">
                                    <tr>
                                        <th>${ b.nickname }</th>
                                        <td class="right" rowspan="2"><img class="artist_img" src="${b.memberModifyName}"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">${ b.star }</td>
                                    </tr>
                                    <tr>
                                        <td>${ b.boardTitle }</td>
                                        <td class="right">${ b.price }원</td>
                                    </tr>
                                </table>
                                <br>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <h3>등록된 상품이 없습니다.</h3>
                    </c:otherwise>
                </c:choose>
            </div> <!-- 전체 div 끝 -->

            <!-- paging -->
            <div id="pagingArea">
                <ul>
                    <li>asd</li>

                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                        <li><a href=""></a> </li>
                    </c:forEach>

                    <li></li>
                </ul>


            </div>







        </div><!-- topOuter -->







        
    </div> <!-- all_area 끝 -->

    <script>
        $(window).on('load', function(){
            $('#character_illustration').css('color', '#FF8399')
        });
        
    </script>
    
            
        


       

</body>
</html>