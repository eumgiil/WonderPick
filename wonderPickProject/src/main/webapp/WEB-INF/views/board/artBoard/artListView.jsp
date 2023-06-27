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
        .artInfo th{
            width:150px;
        }
        .right{
            text-align: right;
        }
        .line{
            width: 600px;
            border: 1px solid gray;
        }
		#pagingArea{
			margin:auto;
            width:fit-content;
            margin-top: 50px;
            margin-bottom: 50px;
		}
        #pagingArea a{
            text-decoration:none;
            color:black;
            font-size:20px;
            font-weight:900;
        }
        #pagingArea button{
            margin: 2px;
        }
        .disabled{
        	pointer-events: none;
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
                <form action="artList.bo" method="post" id="listForm">

                    <select name="search" id="search">
                        <option value="all">전체</option>
                        <option value="artist">작가명</option>
                        <option value="name">제목순</option>
                    </select>

									<%-- 검색 --%>
                    <input type="text" value="" name="keyword">

                    <button style="background-color: white; border: none;">
                        <img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-search-strong-512.png" alt="" width="40">
                    </button>

                    
                    <select name="" id="selectOrder">
                        <option value="registration">최신 등록순</option>
                        <option value="heart">인기순</option>
                        <option value="cost">가격 낮은 순</option>
                    </select>

                </form>
            </div>

            <br><br><br>

            
            <div class="list_all"><!-- list  div -->
                <c:choose>
                    <c:when test="${ not empty list }">

                <!-- 필요한정보 : 글번호, 해당사진, 해당작가 -->
                        <c:forEach items="${ list }" var = "b">
                            <div class="item" onclick="location.href='artDetail.bo?bno=${ b.boardNo }'">
                                <img class="list_img" src="${ b.modifyName }"><br>
                                <table class="artInfo" width="100%">
                                    <tr>
                                        <th>${ b.nickname }</th>
                                        <td class="right" rowspan="2">
                                            <c:choose>
                                                <c:when test="${ artBoard.heart > 0 }">
                                                    ♥
                                                </c:when>
                                                <c:otherwise>
                                                    ♡
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">${ b.heart }</td>
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
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="disabled"> 
                        </c:when>
                        <c:otherwise>
                        	<li>
                        </c:otherwise>
                    </c:choose>
                            	<form action="artList.bo?${ searchArt.category }&cPage=${ pi.currentPage - 1 }" method="post">
                                    <input type="hidden" name="keyword" value="${ searchArt.keyword }">
                                    <input type="hidden" name="search" value="${ searchArt.search }">
                                    <button class="btn btn-info">&lt;</button>
                                </form>
                           	</li>

                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                        <li>
                        	<form action="artList.bo?category=${ searchArt.category }&cPage=${p}" method="post">
                                <input type="hidden" name="keyword" value="${ searchArt.keyword }">
                                <input type="hidden" name="search" value="${ searchArt.search }">
                                <button class="btn btn-info">${p}</button>
                            </form>
                       	</li>
                    </c:forEach>
                    

                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="disabled">
                        </c:when>
                     	<c:otherwise>
                        	<li>
                        </c:otherwise>
                    </c:choose>
                            	<form action="artList.bo?category=${ searchArt.category }&cPage=${ pi.currentPage + 1 }" method="post">
	                                <input type="hidden" name="keyword" value="${ searchArt.keyword }">
	                                <input type="hidden" name="search" value="${ searchArt.search }">
	                                <button class="btn btn-info">&gt;</button>
	                            </form>
                           	</li>
                </ul>
            </div>
        </div><!-- topOuter -->
        
    </div> <!-- all_area 끝 -->

    <script>
        let order = document.getElementById('selectOrder');
        
        window.onload = () => {
            order.name = '';
            for(var i = 0; i < order.options.length; i++){
                if(order.options[i].value == '${searchArt.selectOrder}'){
                    order.options[i].selected = true;
                }
            }
            // let character_illustration = document.getElementById('character_illustration');
            // character_illustration.style.color = '#FF8399';
        }

        order.onchange = () => {
            order.name = 'selectOrder';
            let listForm = document.getElementById('listForm');
            listForm.submit();
        }
        
        
    </script>
    
            
        


       

</body>
</html>