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
    <title>굿즈판매목록페이지</title>
    <style>
        body{
            width : 900px;
            margin: auto;
            text-align: center;
        }

        .all_area{
            width: 100%;
        }

        #option{
            width: 100px;
            height: 35px;
        }
        input{
            width: 300px;
            height: 35px;
           
        }
        .leftouter{
            padding-left: 300px;
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

    <div class="all_area"> <!-- 전체 -->

        <div class="leftouter">
            
        </div>

        <div class="topouter" align="center">
            <h2 class="pink" align="center">그림</h2>
            <hr class="line">
            <div class="">
                <h6 style="width:500px; display: inline-block;"> ${list.size()}개의 상품이 있습니다.</h6> <button onclick="location.href='enrollForm.at'">글쓰기</button>
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
                                <img class="list_img" src=""><br>
                                <table class="goodsInfo" width="100%">
                                    <tr>
                                        <th>${ b.nickname }</th>
                                        <td class="right" rowspan="2"><img class="artist_img" src=""></td>
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

        </div>
    </div> <!-- all_area 끝 -->

    <script>
        $(function(){
            $('.list_img').attr('src', img);
            $('.artist_img').attr('src', img);
        })


        const img = 'data:image/jpeg;base64,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';
    </script>
    
            
        


       

</body>
</html>