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
    <title>Document</title>
    <style>
        .all_area {
            /* background-color:rgb(247, 245, 245); */
            width:900px;
            margin:auto;
            margin-top: 150px;
        }


        .detail_img{
            padding: 1px;
            width: 100%;
            
        }
        .artist{
            display: inline-block;
            width : 30%
        }
        .t_align_right{
            text-align: right;
        }
        .t_align_left{
            text-align: left;
        }
        .op_title{
            text-align: center;
            background-color: lightslategray;
        }

        /* 사이즈 */
        .width{
            width:100%;
        }
        .height_10px{
            height:10px;
        }
        .p_10px{
            padding: 10px;
        }


        .center{
            margin: 0 auto;
            align-content: center;
            text-align:center
        }
        .line{
            width:800px;
        }


        .list{
            width : 300px;
            display: inline-block;
        }
        .inline-block{
            display:inline-block;
        }
        .title{
            font-weight: bolder;
        }

        /* 문의 댓글 */
        .inquire_img{
            border-right: 1px solid lightslategray;
        }

        
    </style>
</head>
<body>
    <div class="all_area">

        <div class="dd">

            <div style="width:49%; display:inline-block;">
                <button>접수중</button>
            </div>
            <div style="width:49%; display:inline-block;" align="right">
                <button>수정</button>
                <button>목록</button>
            </div>
            <br><br>

            <div class="head center">
                <h2> 작품 의뢰상품 제목 </h2>
            </div>

            <br>
            <hr class="width">
            <br>
            
            <div>
                <table>
                    <tr>
                        <td class="title t_align_right">접수 마감일 :</td>
                        <td>날짜 ~~~</td>
                    </tr>
                    <tr>
                        <td class="title t_align_right">작업 완료일 :</td>
                        <td>날짜~~~~~</td>
                    </tr>
                    <tr>
                        <td class="title t_align_right">예산 : </td>
                        <td>N만원 내외</td>
                    </tr>
                    <tr>
                        <td class="title t_align_right">작성자 :</td>
                        <td>user01</td>
                    </tr>
                    <tr>
                        <td class="title t_align_right">작성일 :</td>
                        <td>~~~날짜</td>
                    </tr>
                </table>
            </div>


            <br>
            <hr class="width">
            
            <br><br><br>
            
            <div class="center">
                <h2>[ 의뢰 상세 내용 ]</h2>
            </div>

            <br><br><br>

            <div>
                밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길
                지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가
                밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 
                아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가
            </div>

            <br><br><br>

            <hr>

            <br><br><br>

            <div class="center">
                <div class="list">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
                <div class="list">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
                <div class="list">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
                <div class="list">
                    <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                </div>
            </div>

            <br><br><br>

            <div class="center">
                <h2>[ 댓글 ( 댓글개수 ) ]</h2>
                <hr>
                <br>
                <table class="t_align_left">
                    <tr>
                        <td class="p_10px inquire_img" width="15%" rowspan="2">
                            <img class="width" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif">
                        </td>
                        <td width="70%" style="padding-left:10px;">아이디</td>
                        <td width="15%" rowspan="3">
                            <!--
                                입력한 사람한텐 삭제,
                                아닌 사람한텐 신고
                            -->
                            <button>삭제 또는 신고</button>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:10px;">댓글 내용 : 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의</td>
                    </tr>
                </table>
                
                <br>
                
            </div>
            
            <div class="center" style="width:100%;">
                <textarea name="" id="" style="width:99%; resize:none;" rows="10" maxlength="500"></textarea>
                <br>
                <div class="t_align_right width">
                    <button>작성하기</button>
                </div>
            </div>


           











            










        </div>

    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>