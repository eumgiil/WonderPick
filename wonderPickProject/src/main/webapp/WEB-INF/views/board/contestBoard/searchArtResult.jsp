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
    
    .search_image{
        width: 180px;
        height: 180px;
    }
    #boardImage{
        height: 220px;
    }
   
    .profile_img{
        width: 25px;
        height: 25px;
        border-radius: 50%;
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
        width: 220px;
        height: auto;
        display: inline-table;
        margin: 10px;
        box-shadow: 1px 1px 10px rgb(200, 200, 200);
        padding: 20px;
    }
   
    #list_area{
        margin-left: 60px;
        margin-top: 20px;
    }
    .nickName{
        width: auto;
        font-size: small;
        color: gray;
    }
    #price{
        width: 100px;
        font-size: 20px;
        text-align: end;
    }
    .table_title{
       
        font-size: large;

        width: 180px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
      
    }
    .table_sysdate{
        font-size: 12px;
        color: gray;
    }
   
   
   
    
   </style>

</head>
<body>

	 <jsp:include page="../../common/header.jsp" />

    <div id="all_area">
        <div id="main_area">
            <div id="searchResult_title">
                <span id="result_text">"${ keyword }"에 대한 검색결과 입니다.</span>
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

            
            <br>
            <hr>
    
        
            <div id="select_btn">

                <select>
                    <option value="">최신순</option>
                    <option value="">인기순</option>
                </select>
                <select>
                    <option value="">상업용</option>
                    <option value="">비상업용</option>
                </select>

            </div>

            <div id="list_area">
                <c:choose>
                    <c:when test="${ empty list }">
                            <div id="noList">검색 결과 없음</div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach  items="${ list }" var="list">
                            <div class="contest_table">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td colspan="3" id="boardImage">
                                                <div align="center" class="movePage" >
                                                    <img src="${ list.modifyName }" alt="" class="search_image">
                                                    <input type="hidden" value="${ list.boardNo }">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_title" colspan="3">
                                                <div class="table_title" id="title_overflow">
                                                   <span id="title"> ${ list.boardTitle }</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="table_profile_img" >
                                                <div align="center" >
                                                    <img align="left" class="profile_img" src="${sessionScope.loginMember.profilePath }/${sessionScope.loginMember.profileImg}">
                                                </div>
                                            </td>
                                            <td id="nickName">
                                               <span class="nickName">${ list.nickname }</span> 
                                            </td>
                                            <td id="price">${ list.price }원 </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <span class="table_sysdate">${ list.createDate }</span> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
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
                               '<div class="contest_table">'
                                    +'<table>'
                                        +'<tbody>'
                                            +'<tr>'
                                                +' <td colspan="3" id="boardImage">'
                                                    +'<div align="center" class="movePage" >'
                                                        +'<img src="' + result[i].modifyName + '" alt="" class="search_image">'
                                                        +' <input type="hidden" value="">'
                                                    +'  </div>'
                                                    +' </td>'
                                                + ' </tr>'
                                            +'  <tr>'
                                            +'<td class="table_title" colspan="3">'
                                                    +' <div class="table_title">'
                                                    +'<span id="title">'+ result[i].boardTitle +'</span>'
                                                    +' </div>'
                                                    +'</td>'
                                                +'</tr>'
                                            +' <tr>'
                                            +' <td class="table_profile_img" >'
                                                +'<div align="center" >'
                                                        +' <img align="left" class="profile_img" src="' + ${sessionScope.loginMember.profilePath } + '/' + ${sessionScope.loginMember.profileImg}+ '">'
                                                        +'  </div>'
                                                    +' </td>'
                                                +'<td id="nickName">'
                                                    +' <span class="nickName" >'+ result[i].nickName +'</span> '
                                                +' </td>'
                                                +' <td id="price">'+ result[i].price +'원 </td>'
                                                +' </tr>'
                                            +' <tr>'
                                            + '<td colspan="3">'
                                                    + '<span class="table_sysdate">'+ result[i].createDate +'</span> '
                                                    +' </td>'
                                                + ' </tr>'
                                        +'</tbody>'
                                    +'</table>'
                                +'</div>';

                            $('#list_area').html(value);
                        }

                    }
                },
                error : () => {
                    alert('error')
                }

            })

                                    
          
        } 

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
                            '<div class="contest_table">'
                                    +'<table>'
                                        +'<tbody>'
                                            +'<tr>'
                                                +' <td colspan="3" id="boardImage">'
                                                    +'<div align="center" class="movePage" >'
                                                        +'<img src="' + result[i].filePath + '" alt="" class="search_image">'
                                                        +' <input type="hidden" value="">'
                                                    +'  </div>'
                                                    +' </td>'
                                                + ' </tr>'
                                            +'  <tr>'
                                            +'<td class="table_title" colspan="2">'
                                                    +' <div class="table_title">'
                                                    +'<span id="title">'+ result[i].boardTitle +'</span>'
                                                    +' </div>'
                                                    +'</td>'
                                                +'</tr>'
                                            +' <tr>'
                                                +' <td class="table_profile_img" >'
                                                    +'<div>'
                                                        +'<img align="left" class="profile_img" src="' + ${sessionScope.loginMember.profilePath } + '/' + ${sessionScope.loginMember.profileImg}+ '">'
                                                    +'</div>'
                                                +'</td>'
                                                    +'<td id="nickName" >'
                                                        +' <span class="nickName" align="left" >'+ result[i].nickName +'</span>'
                                                    +' </td>'
                                                +' </tr>'
                                            +' <tr>'
                                                + '<td colspan="3">'
                                                        + '<span class="table_sysdate">'+ result[i].uploadDate +'</span> '
                                                +' </td>'
                                          + ' </tr>'
                                        +'</tbody>'
                                    +'</table>'
                                +'</div>';
                            $('#list_area').html(value);
                        }
                    }
                }
            })


        }



    </script>
	 

</body>
</html>