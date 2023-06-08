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
            margin-left:50px;
            
        }
        .all_area{
            width: 1300px;
        }
        .goodsList2{
            width: 250px;
   
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
            margin-left :150px;
            
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
         margin-left : 500px;
        }
        .pagingArea{
        margin-left : 450px;
        }
        
        
        
        

    </style>
 
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
      <jsp:include page="goodsCategory.jsp" />
    
    
<div class="main">

    <!-- 작가가 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
    <c:if test="${loginMember.memberGrade.equals('작가')}">
        <a class="btn btn-secondary" id="enrollGoods" href="enrollForm.go" >글쓰기</a>
        </c:if>
    
    <div class="topouter" align="center">
        <h2 align="center" style="color: rgb(255, 131, 153);">굿즈</h2>
        <hr style="width: 600px; border: 1px solid gray;">
        <h6>n개의 상품이 있습니다.</h6>

        <form action="searchGoods.go" method="get" align="center">
        <div id="searchGoods" >
         <select name="option" id="option">
            <option value="whole">전체</option>
            <option value="nickname">작가명</option>
            <option value="boardTitle">제목순</option>
        </select>
        <input type="text" value="" name="searchGoods">
        <button type="submit" style="background-color: white; border: none;"><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-search-strong-512.png" alt="" width="40"></button>
        </form>

        <select name="option" id="option">
            <option value="popularity" onclick="option(1)">인기순</option>
            <option value="lowPrice" onclick="option(2)">가격 낮은 순</option>
            <option value="latest" onclick="option(3)">최신 등록순</option>
        </select>
        
        <script>
        
        function option(num){
        	num = $('#option').val();
        };
        $.ajax({
        	url : 'list.go?cPage=1',
        	data : num ,
        	dataType :'json'
        	type :'get',
        	success : function(result){
        		for(var i = 0 ; i< result.length; i++){
        			
        		}
        	}
        		
        		
        		
        	},
        	error : () => {
        		console.log('실패');
        	}
        		
        });
        
        
        
        
        </script>

        </div>
        <br><br><br>

        
        <div class="goodsList1"  id="goods" style="width: 900px;" align="center">
          <c:choose>  
            <c:when test="${not empty list}">
              <c:forEach items="${list}" var="g">
                  <div class="goodsList2" style="display:inline-block;">
                    <img src="resources/image/79505b031fb97b848044ad0f4935cd98.jpg" alt=""  width="250"  onclick="like();" id="goodsimg"><br>
                    <table id="goodsInfo"  id="goods" width="250">
	                    <tr>
	                        <td>${g.nickName}</td>
	                        <td><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-heart-256.png" alt="" width="30" style="float: right;"></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">★★★★☆</td>
	                    </tr>
	                    <tr>
	                        <td><a href="detail.go?boardNo= ${ g.boardNo }">${g.boardTitle }</a></td>
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
	})
	</script>
	
	
	<br><br>
	<div class="pagingArea"  align="center" >
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
                			<li><a href="list.go?cPage=${pi}" class="page-link">${pi}</a></li>
                		</c:if>
                </c:forEach>
                  <c:choose>
                  <c:when test="${ pi.currentPage eq pi.maxPage }">
                  <li class="page-item"><a class="page-link" href="#">Next</a></li>
                  </c:when>
                  <c:otherwise>
                  <li class="page-item"><a class="page-link" href="list.go?cPage=${pi.currentPage+1 }">Next</a></li>
                  </c:otherwise>
                    
                    </c:choose>
                </ul>
      </div>
</body>
</html>