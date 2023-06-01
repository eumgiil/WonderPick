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
        #option{
            width: 110px;
            height: 35px;
       
        }
        input{
            width: 300px;
            height: 35px;
           
        }
        
        .goodsList1{
            border: 1px solid black;
            width: 900px;
            
        }
        .all_area{
            width: 1300px;
        }
        .goodsList2{
            width: 250px;
   
        }
        .main{
            width: 1300px;
            border: 1px solid black;
        }
        
        


     
        
    </style>
 
</head>
<body>

<div class="main">
    <div class="topouter" align="center">
        <h2 align="center" style="color: rgb(255, 131, 153);">굿즈</h2>
        <hr style="width: 600px; border: 1px solid gray;">
        <h6>n개의 상품이 있습니다.</h6>

        <form action="" method="get">
        <div id="searchGoods">
         <select name="" id="option">
            <option value="whole">전체</option>
            <option value="nickname">작가명</option>
            <option value="boardTitle">제목순</option>
        </select>
        <input type="text" value="" name="searchGoods">
        <button type="submit" style="background-color: white; border: none;"><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-search-strong-512.png" alt="" width="40"></button>
        </form>

        <select name="option" id="option">
            <option value="popularity">인기순</option>
            <option value="lowPrice">가격 낮은 순</option>
            <option value="latest">최신 등록순</option>
        </select>

        </div>
        <br><br><br>
        
        <div class="goodsList1"  id="goods" style="width: 900px;">
          <c:choose>  
            <c:when test="${not empty goodsList}">
                    
                    <div class="goodsList2" style="display:inline-block;">
                    <img src="resources/image/79505b031fb97b848044ad0f4935cd98.jpg" alt=""  width="250"  onclick="like();" id="goods"><br>
                    <table id="goodsInfo"  id="goods" width="250">
                    <tr>
                        <td >작가명</td>
                        <td><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-heart-256.png" alt="" width="30" style="float: right;"></td>
                    </tr>
                    <tr>
                        <td colspan="2">★★★★☆</td>
                    </tr>
                    <tr>
                        <td >작품명</td>
                        <td style="float: right;">가격</td>
                    </tr>
                    </table>
                    <br>
                     </div>
                    
                    <div class="goodsList2" style="display:inline-block;">
                        <img src="resources/image/79505b031fb97b848044ad0f4935cd98.jpg" alt=""  width="250"  onclick="like();" id="goods"><br>
                        <table id="goodsInfo"  id="goods" width="250">
                        <tr>
                            <td >작가명</td>
                            <td><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-heart-256.png" alt="" width="30" style="float: right;"></td>
                        </tr>
                        <tr>
                            <td colspan="2">★★★★☆</td>
                        </tr>
                        <tr>
                            <td >작품명</td>
                            <td style="float: right;">가격</td>
                        </tr>
                        </table>
                        <br>
                        </div>
                        <div class="goodsList2" style="display:inline-block;">
                            <img src="resources/image/79505b031fb97b848044ad0f4935cd98.jpg" alt=""  width="250"  onclick="like();" id="goods"><br>
                            <table id="goodsInfo"  id="goods" width="250">
                            <tr>
                                <td >작가명</td>
                                <td><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-heart-256.png" alt="" width="30" style="float: right;"></td>
                            </tr>
                            <tr>
                                <td colspan="2">★★★★☆</td>
                            </tr>
                            <tr>
                                <td >작품명</td>
                                <td style="float: right;">가격</td>
                            </tr>
                            </table>
                            <br>
                            </div>
                            <div class="goodsList2" style="display:inline-block;">
                                <img src="resources/image/79505b031fb97b848044ad0f4935cd98.jpg" alt=""  width="250"  onclick="like();" id="goods"><br>
                                <table id="goodsInfo"  id="goods" width="250">
                                <tr>
                                    <td >작가명</td>
                                    <td><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-heart-256.png" alt="" width="30" style="float: right;"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">★★★★☆</td>
                                </tr>
                                <tr>
                                    <td >작품명</td>
                                    <td style="float: right;">가격</td>
                                </tr>
                                </table>
                                <br>
                                </div>
                                <div class="goodsList2" style="display:inline-block;">
                                    <img src="resources/image/79505b031fb97b848044ad0f4935cd98.jpg" alt=""  width="250"  onclick="like();" id="goods"><br>
                                    <table id="goodsInfo"  id="goods" width="250">
                                    <tr>
                                        <td >작가명</td>
                                        <td><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-heart-256.png" alt="" width="30" style="float: right;"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">★★★★☆</td>
                                    </tr>
                                    <tr>
                                        <td >작품명</td>
                                        <td style="float: right;">가격</td>
                                    </tr>
                                    </table>
                                    <br>
                                     </div>
                                    </div>
            </c:when>
            <c:otherwise>
                <h3>등록된 상품이 없습니다.</h3>
            </c:otherwise>
        </c:choose>
    
    





    <script>
        function like(){
            $.ajax
        }
    </script>

</div>
</body>
</html>