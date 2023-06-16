<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>아트보드카테고리</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
    #artBoardCategory{
        padding-left:10px;
    }
    #artBoardCategory table{
        width:100%
    }
    #artBoardCategory td{
        padding-bottom: 20px;
    }
    #artBoardCategory td :hover {
        opacity: 0.8;
            transition: transform 100ms ease-in-out;
            transform: scale(1.05);
    }
    #artBoardCategory div{
        font-size: 20px;
    }
    #artBoardCategory a{
        text-decoration: none;
        color: black; 
    }

</style>
<body>
    <!-- 전체 시작 -->
    <div id="artBoardCategory">
        <table>
            <tr>
                <td>
                    <h3 style="font-weight: bold; color:rgb(255, 131, 153) ;">카테고리</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <hr style="border: 1px solid black; width: 200px;">
                </td>
            </tr>
            <tr>
                <label>
                    <td>
                        <a href="artList.bo?category=CI">
                            <div id="character_illustration">캐릭터일러스트</div>
                        </a>
                    </td>
                </label>
            </tr>
            <tr>
                <label>
                    <td>
                        <a href="artList.bo?category=I">
                            <div id="illustration">일러스트</div>
                        </a>
                    </td>
                </label>
            </tr>
            <tr>
                <label>
                    <td>
                        <a href="artList.bo?category=V">
                            <div id="virtual">버츄얼</div>
                        </a>
                    </td>
                </label>
            </tr>
            <tr>
                <label>
                    <td>
                        <a href="artList.bo?category=D">
                            <div id="design">디자인</div>
                        </a>
                    </td>
                </label>
            </tr>
            <tr>
                <label>
                    <td>
                        <a href="artList.bo?category=W">
                            <div id="webtoon">웹툰</div>
                        </a>
                    </td>
                </label>
            </tr>
            <tr>
                <label>
                    <td>
                        <a href="artList.bo?category=E">
                            <div id="etc">기타</div>
                        </a>
                    </td>
                </label>
            </tr>
        </table>
    </div>
    <!-- 전체 끝 -->

    <script>
        let divs = document.querySelectorAll('#artBoardCategory div');
        for(let div of divs){
            div.addEventListener('click', function(event){
                let asd = document.querySelector('#artBoardCategory div[innerHTML="버츄얼"]');
                console.log(div.innerHTML);
                for(let div of divs){
                    div.style.color="black";
                }
                event.target.style.color = "red";
            })
        }
    </script>


    
</body>
</html>