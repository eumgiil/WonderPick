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
        
        #selectOrder{
            width: 100px;
            height: 35px;
            float:right;
       
        }
        input{
            width: 300px;
            height: 35px;
           
        }
        
        .goodsList1{
            border: 1px solid black;
            width: 900px;
            margin-left:50px;
            
        }
        
        .all_area{
            width: 1300px;
        }
        .goodsList2{
            width: 270px;
   
        }
        .main{
            width: 1300px;
            
        }
        .main{
            width: 100%;
            padding-top: 5%;
        }
        .goodsList2>#goodsimg{
            width: 270px;
        }
        .goodsList2{
            margin: 2%;
        }
        
        .topouter{
            float : left;
            margin-left :200px;
            
        }
        #enrollGoods{
         float : right;
         margin-right : 30%;
         color : rgb(255, 131, 153);
        }
        #goodsimg{
        border : 1px solid black;
        }
        #searchGoods{
         float : left;
         width:700px;
        }
        .pagingArea{
        margin-left : 450px;
        }
        .category{
            float: left;
            width:400px;
            margin-left: 5%;
            margin-top: 10%;
            height: 500px;

        }
        .category a{
            text-decoration: none;
            color: black;
            font-weight: bolder;
        }
        .category a:hover{
            color :rgb(255, 131, 153);
            font-size: larger;
        }
        
        .category_option{
            height: 300px;
            width: 100%;
        }
        .top{
        margin-left : 10px;
        width: 700px;
        }
        
        

    </style>
 
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
 <div class="category">
        <h3 style="font-weight: bold; color:rgb(255, 131, 153) ;">카테고리</h3>
        <hr style="border: 1px solid black; width: 200px;">
        <table class="category_option">
            <tr>
                
                <td><a href="categorylist.go?goodsCategory=FASHION&cPage=1">패션</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=KITCHEN&cPage=1">주방</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=INTERIOR&cPage=1">인테리어</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=STATIONERY&cPage=1">문구</a></td>
            </tr>
            <tr>
            </tr>
                <td><a href="categorylist.go?goodsCategory=ETC&cPage=1">기타</a></td>
            </tr>
        </table>


    </div>
    
<div class="main">

    <!-- 작가가 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
    <c:if test="${loginMember.memberGrade.equals('작가')}">
        <a class="btn btn-secondary" id="enrollGoods" href="enrollForm.go" >글쓰기</a>
        </c:if>
    
    <div class="topouter" align="center">
        <h2 align="center" style="color: rgb(255, 131, 153);">굿즈</h2>
        <hr style="width: 600px; border: 1px solid gray;">
        <h6>${list.size()}개의 상품이 있습니다.</h6>
   <div class="top" align="center" style="float : left;">
		   <div id="searchGoods" >
		        <form action="search.go" method="get" align="center">
			        <input type="hidden" name="currentPage" value="1">
			         <select name="condition" style="width:100px; height:35px;" >
			            <option value="nickname">작가명</option>
			            <option value="boardTitle">제목순</option>
			        </select>
			        <input type="text" value="${ keyword }" name="keyword">
			        <button type="submit" style="background-color: white; border: none;"><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-search-strong-512.png" alt="" width="40"></button>
		        </form>
		        <form action="list.go" method="post" id="listForm">
			       <div class="option" >
			           <select name="selectOrder" id="selectOrder" >
			               <option value="latest">최신 등록순</option>
			               <option value="popularity">인기순</option>
			               <option value="lowPrice">가격 낮은 순</option>
			            </select>
			        </div>     
			    </form>
		   </div>
   		   <c:if test="${not empty condition}">
			   <script>
			    $(function(){
			    	$('#searchGoods option[value=${condition}]').attr('selected', true);
			    })
			   </script>
   		   </c:if>
		   
   </div>

        </div>
        <br><br><br><br><br>

        <!-- 전체리스트 -->
        <div class="goodsList1"  id="goods" style="width: 1000px; margin-left: 550px; margin-top:100px;"  align="center">
          <c:choose>  
            <c:when test="${not empty list}">
              <c:forEach items="${list}" var="g">
                  <div class="goodsList2" style="display:inline-block;">
                    <img src="${ g.filePath }" alt=""  width="250" style=" width:250px; height:250px;"  ><br>
                    <table id="goodsInfo"  id="goods" width="250">
	                    <tr>
	                        <td>${g.nickName}</td>
	                        <c:choose>
		                        <c:when test="${empty loginMember}">
		                        	<td></td>
		                        </c:when>
		                        <c:otherwise>
			                      	 <c:if test="${not empty heartList }">
			                      	 	<c:forEach items="${heartList}" var="h">
			                      	 	<c:choose>
				                            <c:when test="${ (h.memberNo==loginMember.memberNo) != 0 }">
				                              <th style="font-size: 35px;"><img src="resources/common/heart.png" width="30" style="float: right;" alt="" id="heart" onclick="updateHeart();"></th>
				                            </c:when>  
				                            <c:otherwise>
					                               <th style="font-size: 35px;"><img src="resources/common/noheart.png" width="30" style="float: right;"alt="" id="heart" onclick="updateHeart();"></th>
					                        </c:otherwise>
				                         </c:choose>
			                      	 	</c:forEach>
				                      </c:if>
				                      <c:if test="${empty heartList }">
				                      <th style="font-size: 35px;"><img src="resources/common/noheart.png" width="30" style="float: right;"alt="" id="heart" onclick="updateHeart();"></th>
				                      </c:if>
		                        </c:otherwise>
		                 </c:choose> 
	                    </tr>
	                    <tr>
	                        <td colspan="2">★★★★☆</td>
	                    </tr>
	                    <tr>
	                        <td><a href="detail.go?boardNo= ${ g.boardNo }" style="color:rgb(255, 131, 153);">${g.boardTitle }</a></td>
	                        <td style="float: right;">${g.price}</td>
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
	
	</div>
	
	
	
	<script>
	$(function(){
		$('.boardNo').click(function(){
			location.href = 'detail.go?boardNo=' + $(this).childen('.boardNo').text();
		});

        console.log('${list}');

	})

        let order = document.getElementById('selectOrder');
        order.onchange = () => {
            order.name = 'selectOrder';
            let listForm = document.getElementById('listForm');
            listForm.submit();
        }

	</script>
	
	
	<br><br>
	<div class="pagingArea"  align="center" style="margin-left:950px;" >
                <ul class="pagination" >
                <c:choose>
                  <c:when test="${pi.currentPage eq 1 }">
                   <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                  </c:when>
                  <c:otherwise>
                  <li class="page-item"><a class="page-link" href="list.go?cPage=${pi.currentPage-1 }">Previous</a></li>
                  </c:otherwise>
                </c:choose>
                
                
                <c:forEach var="pi" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage }">
                		<c:if test="${ not empty list }">
                			<li><a href="list.go?cPage=${pi}" class="page-link" style="color:rgb(255, 131, 153);">${pi}</a></li>
                		</c:if>
                </c:forEach>
                  <c:choose>
                  <c:when test="${ pi.currentPage eq pi.maxPage }">
                  <li class="page-item"><a class="page-link" href="#" style="color:rgb(255, 131, 153);">Next</a></li>
                  </c:when>
                  <c:otherwise>
                  <li class="page-item"><a class="page-link" href="list.go?cPage=${pi.currentPage+1 }" style="color:rgb(255, 131, 153);">Next</a></li>
                  </c:otherwise>
                    
                    </c:choose>
                </ul>
      </div>
</body>
</html>