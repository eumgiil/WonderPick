<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    
   </style>

</head>
<body>

	 <jsp:include page="../../common/header.jsp" />
	 
     <div id="searchResult_area">
        <div id="searchResult_title">
            <span>""에 대한 검색결과 입니다. </span>
        </div>
    <div id="contents">
        <div id="wrap_tab">
            <ul class="list_tab">
                <li>
                    <a href="#"><span  class="on">그림</span></a>
                </li>
                <li>
                    <a href="#"><span class="on">굿즈</span></a>
                </li>
                <li>
                    <a href="#"><span class="on">이모티콘 공모전</span></a>
                </li>
            </ul>
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
    </div>
	 

</body>
</html>