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
    #result_text{
        font-size: 30px;
    }

    #category_area{
        text-align: center;
    }

  
    h1{
        color : rgb(255, 131, 153);
    }

    #list>li{
        display: inline;
    }
    .search_image{
        width: 200px;
        height: 200px;
    }
   
    .list_table{
    }
    #noList{
        margin: auto;
        height: 200px;
        text-align: center;
        padding-top: 100px;
        color: gray;
    }
   
    .category_btn{
        width: 100%;
        color: gray;
        border: 0;
        background-color:  rgb(241, 217, 222);
    }
    .contents{
        font-size: 20px;
    }
    #content_1{
        background-color: white;
        color: black;
        border: 1px solid black;
        border-bottom: 0;
    }
    #content_2{
        border-right: 1px solid gray;
    }
    .list_tab>li{
        width: 33.3%;
        text-align: center;
        float: left;
        color: gray;
    }
    #contents_area{
        margin-bottom: 50px;
    }
    .contest_table{
        display: inline;
        margin: auto;
        width: 300px;
        height: 300px;
    }
    
    
   </style>

</head>
<body>

	 <jsp:include page="../../common/header.jsp" />

    <div id="all_area">
        <div id="main_area">
            <div id="searchResult_title">
                <span id="result_text">"${ keyword }"에 대한 검색결과 입니다. </span>
            </div>
            <div id="contents_area">
                <ul class="list_tab">
                    <li class="contents">
                        <form action="searchArtResult.ct" method="get">
                            <button type="submit" class="category_btn" id="content_1">그림</button>
                            <input type="hidden" name="keyword" value="${ keyword }" id="search_input" >
                        </form>
                    </li>
                    <li class="contents" >
                        <button class="category_btn" id="content_2" onclick="searchGoodsResult();">굿즈</button>
                    </li>
                    <li class="contents" >
                        <button class="category_btn" id="content_3" onclick="searchContestResult();">이모티콘 공모전</button>
                    </li>
                </ul>
            </div> <!-- end contents -->
    
        
            <select>
                <option value="">최신순</option>
                <option value="">인기순</option>
            </select>
            <select>
                <option value="">상업용</option>
                <option value="">비상업용</option>
            </select>

            ${ list }
    
            <div id="list_area">
                <c:choose>
                    <c:when test="${ empty list }">
                            <div id="noList">검색 결과 없음</div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach  items="${ list }" var="list">
                            <table border="1" class="contest_table">
                                <tbody>
                                    <tr >
                                        <td colspan="3">
                                            <div align="center" class="movePage" id="boardImage">
                                                <img src="${ list.modifyName }" alt="" class="search_image">
                                                <input type="hidden" value="${ list.boardNo }">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_title" colspan="3">
                                            <div class="table_title">
                                                    제목 : ${ list.boardTitle }
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table_profile_img" >
                                            <div align="center">
                                                <img src="${sessionScope.loginMember.profilePath }/${sessionScope.loginMember.profileImg}">
                                            </div>
                                        </td>
                                        <td>${ list.nickName }</td>
                                        <td class="vote_heart">가격 ${ list.price } </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            날짜
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
            </div>
        </div>
    </div>

    <script> // script - start - 

        function searchGoodsResult(){

            $.ajax({
                url : 'searchGoodsResult.ct',
                data :{
                    keyword : '${ keyword }'
                },
                success : result => {
                    console.log(result)
                    //console.log(result[0].modifyName);

                    // 기존 영역 삭제
                    // 굳이 하지 않아도 기존영역위에 덮어쓰기가 됨 생략해도 됨
                    // var de_table =  document.getElementById('list_12');
                    // de_table.replaceChildren();

                    // 색 바꿔주기
                    $('#content_1').css({'background-color' : 'rgb(241, 217, 222)', 'border' : 'none', 'color' : 'gray'})
                    $('#content_2').css({'background-color' : 'white','color' : 'black','border' : '1px solid black', 'border-bottom' : '0'});
                    $('#content_3').css({'background-color' : 'rgb(241, 217, 222)', 'border' : 'none', 'color' : 'gray'})


                    if(result.length == 0){
                        $('#noList').html('검색 결과 없음')
                    }else{

                        // 채워넣기
                        let value = '';
                        for(var i in result){

                            value += 
                                         '<table border="1" class="contest_table">'
                                            + '<tbody>'
                                                + '<tr >'
                                                    + '<td colspan="3">'
                                                        + '<div align="center" class="movePage" id="boardImage">'
                                                            + '<img src="' + result[i].modifyName + '" alt="" class="search_image">'
                                                            + '<input type="hidden" value="">'
                                                        + '</div>'
                                                    + '</td>'
                                                    +'</tr>'
                                                + '<tr >'
                                                    + '<th class="table_title" colspan="2">'
                                                        + '<div class="table_title">'
                                                            +  '<a href="#" class="movePage" id="boardTitle">'
                                                                + '<input type="hidden" value="">'
                                                                + ' <p id="djarldlf">'+result[i].boardTitle+'</p>'
                                                            +' </a>'
                                                        + '</div>'
                                                    +  '</th>'
                                                    + ' <td class="vote_heart">♡</td>'
                                                + '</tr>'
                                                + ' <tr>'
                                                    +' <td class="table_profile_img">'
                                                        +  '<div align="center">'
                                                            +  '<img src="#" class="profile_img">'
                                                        + ' </div>'
                                                    + '</td>'
                                                    + ' <td>'+ result[i].nickName +'</td>'
                                                    +' <td>투표수 자리</td>'
                                                + ' </tr>'
                                                + '<tr>'
                                                    + '<td colspan="3">'
                                                        +' <span class="table_sysdate">'+ result[i].createDate +'</span> '
                                                    +  '</td>'
                                                +  '</tr>'
                                                + '<tr>'
                                                    +  '<td colspan="3">'
                                                        +  '<div class="table_sysdate">조회수</div> '
                                                    +  '</td>'
                                                + '</tr>'
                                            + '</tbody>'
                                        +  '</table>';
                                        
                                    // var li = document.createElement('li');
                                    // li.append(value);
                                    $('#list_area').html(value);
                        }
                    }

                },
                error : () => {
                    alert('error')
                }

            })

                                    
          
        } // searchGoodsResult - end - 

        function searchContestResult(){
            $.ajax({
                url : 'searchContestResult.ct',
                data : {
                    keyword : '${ keyword }'
                },
                success : result => {
                    console.log(result);

                    //  // 기존 영역 삭제
                    //  var de_table =  document.getElementById('list_12');
                    //  de_table.replaceChildren();

                     // 색 바꿔주기
                     
                    $('#content_1').css({'background-color' : 'rgb(241, 217, 222)', 'border' : 'none', 'color' : 'gray'})
                    $('#content_2').css({'background-color' : 'rgb(241, 217, 222)', 'border' : 'none', 'color' : 'gray'})
                    $('#content_3').css({'background-color' : 'white','color' : 'black','border' : '1px solid black', 'border-bottom' : '0'});

                    if(result.length == 0){
                        $('#noList').html('검색 결과 없음')
                    }else{

                        let value = '';
                        for(let i in result){
                            
                            value += 
                                    '<table border="1" class="contest_table">'
                                        + '<tr>'
                                                + '<td colspan="3">'
                                                +' <div align="center" class="movePage" id="boardImage">'
                                                    +  '<img src="' + result[i].filePath + '" class="search_image">'
                                                + '<input type="hidden" value="'+ result[i].boardNo +'">'
                                                + '</div>'
                                            + '</td>'
                                        + '</tr>'
                                        + '<tr >'
                                            + '<th class="table_title" colspan="2">'
                                                +  '<div class="table_title">'
                                                    + '<a href="#" class="movePage" id="boardTitle">'
                                                        +  '<input type="hidden" value="'+ result[i].boardNo +'">'
                                                        + result[i].boardTitle
                                                    +' </a>'
                                                    +'</div>'
                                            + '</th>'
                                            + '<td class="vote_heart">♡</td>'
                                            +'</tr>'
                                        + '<tr>'
                                            + '<td class="table_profile_img">'
                                                +  ' <div align="center">'
                                                    +  '<img src="#" class="profile_img">'
                                                        
                                                    +'</div>'
                                            + '</td>'
                                                +'<td>'+ result[i].nickName +'</td>'
                                            + '<td> 투표수 자리 </td>'
                                            +'</tr>'
                                        + '<tr>'
                                            + '<td colspan="3">'
                                                +   '<span class="table_sysdate">'+ result[i].uploadDate + '</span> '
                                            + ' </td>'
                                            +'</tr>'
                                        + '<tr>'
                                            +  '<td colspan="3">'
                                                + '<div class="table_sysdate">조회수</div> '
                                            + '</td>'
                                            +'</tr>'
                                    + '</table>';

                            $('#list_area').html(value);
                        }
                    }
                }
            })


        }// searchContestResult - end - 



    </script> 
	 

</body>
</html>