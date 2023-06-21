<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
    #searchResult_area{
        box-shadow: 1px 1px 10px rgb(200, 200, 200) ;
        border-radius: 20px;
        margin: auto;
        width: 800px;
        height: 500px;
        padding: 20px;
    }

    #category_area{
        text-align: center;
    }

    .category{
        display: inline;
        margin: center;
        
    }

    #wrap_tab {
        width: 100%;
        height: 60px;
    }

    #wrap_tab .list_tab {
        width: 1000px;
        margin: 0 auto;
        padding: 0 185px;
        box-sizing: border-box;
    }

    #wrap_tab .list_tab li {
        width: 33.33%;
        width: 210px;
        float: left;
    }

    #wrap_tab .list_tab li a {
        border: 1px solid black;
        height: 60px;
    }

    #wrap_tab .list_tab li a span {
        height: 60px;
        padding: 18px 16px 0;
        box-sizing: border-box;
    }
    
    h1{
        color : rgb(255, 131, 153);
    }

    #list>li{
        display: inline;
    }
    
   </style>

</head>
<body>

	 <jsp:include page="../../common/header.jsp" />

    
	 
     <div id="searchResult_area">
            <div id="searchResult_title">
                <span>"  ${ keyword } "에 대한 검색결과 입니다. </span>
            </div>
        <div id="contents">
            <div id="wrap_tab">
                <form action="" method="GET">
                    <ul class="list_tab">
                        <li>
                            <a href="#"><span  class="on">그림</span></a>
                            <button type="submit">그림</button>
                        </li>
                        <li>
                            <a href="#"><span class="on" onclick="searchGoodsResult();">굿즈</span></a>
                            <button type="submit">굿즈</button>
                            <input type="hidden" name="keyword" value="${ keyword }">
                        </li>
                        <li>
                            <a href="searchContestResult.ct"><span class="on">이모티콘 공모전</span></a>
                            <button type="submit">이모티콘 공모전</button>
                            <input type="hidden" name="keyword" value="${ keyword }">
                        </li>
                    </ul>
                </form>
            </div> <!-- end wrap_tab -->
        </div> <!-- end contents -->



        <div>n개의 검색 결과</div>
        
        <select>
            <option value="">카테고리</option>
            <option value="">1</option>
            <option value="">2</option>
            <option value="">3</option>
            <option value="">4</option>
        </select>
        <select>
            <option value="">최신순</option>
            <option value="">인기순</option>
        </select>
        <select>
            <option value="">상업용</option>
            <option value="">비상업용</option>
        </select>


       

        <div>
        
            <ul id="list">
                <li>
                    <c:choose>
                        <c:when test="${ empty list }">
                            
                            <div>검색 결과 없음</div>
                            
                        </c:when>
                        <c:otherwise>
                            
                            <c:forEach  items="${ list }" var="list">
                                ${ list }
                            <table border="1" class="contest_table">
                                <tbody>
                                    <tr >
                                        <td colspan="3">
                                            <div align="center" class="movePage" id="boardImage">
                                                <img src="${ list.filePath }" alt="" class="top10_image">
                                                <input type="hidden" value="${ list.boardNo }">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr >
                                        <th class="table_title" colspan="2">
                                            <div class="table_title">
                                                <a href="#" class="movePage" id="boardTitle">
                                                    <input type="hidden" value="${ list.boardNo }">
                                                    <p id="djarldlf">${ list.boardTitle }</p>
                                                </a>
                                            </div>
                                        </th>
                                        <td class="vote_heart">♡</td>
                                    </tr>
                                    <tr>
                                        <td class="table_profile_img">
                                            <div align="center">
                                                <img src="#" class="profile_img">
                                            </div>
                                        </td>
                                        <td>${ list.nickName }</td>
                                        <td>투표수 자리</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <span class="table_sysdate">${ list.uploadDate }</span> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div class="table_sysdate">조회수</div> 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </c:forEach>
                            
                        </c:otherwise>
                    </c:choose>
                </li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>

            </ul>
        </div>

    </div>

    <script>

        function searchGoodsResult(){

            $.ajax({
                url : 'searchGoodsResult.ct',
                data :{
                    keyword : '${ keyword }'
                },
                success : result => {

                    console.log(result);

                },
                error : () => {
                    alert('error')
                }

            })

                                    
          
        }



    </script>
	 

</body>
</html>