<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    .header_area{
        display: inline-block;
        color : rgb(255, 131, 153);
        margin: 20px;
        text-align: center;
    }
    .header_area>h1:hover{
        cursor: pointer;
        opacity: 0.8;
        transition: transform 100ms ease-in-out;
        transform: scale(1.05);
    }
    #hr_1{
        background:pink;
        height:5px;
        border: 0;
        width: 90%;
    }
</style>
</head>
<body>

    <jsp:include page="../../common/header.jsp" />

    <div id="all_area">
        <div id="main_area">

            <div id="header-1" align="center">
                <div class="header_area">
                <h1 onclick="votePage();">이달의 이모티콘 투표<hr></h1> 
                </div>
                <div class="header_area">
                    <h1 onclick="winnerPage();">역대 이달의 우승작<hr id="hr_1"></h1>
                </div>
                <div>
                    여기는 저번달 우승작 ( 무료 사용 가능 )
                    <table>
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div>
                    여기는 2023 최신달 기준으로 슬라이드쇼
                </div>
                <div>
                    2022
                </div>
                <div>
                    2021
                </div>
                <div>
                    2020
                </div>
            </div>
        

            

        </div>
    </div>



    <script>
         function votePage(){
            location.href = 'selectVotePage.ct';
        }

        function winnerPage(){
            location.href = 'contestWinnerList.ct';
        }
    </script>



</body>
</html>