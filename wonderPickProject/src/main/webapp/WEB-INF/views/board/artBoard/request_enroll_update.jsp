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
            width:800px;
            margin:auto;
            margin-top: 150px;
        }


        .detail_img{
            padding-right: 1px;    
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
        .width{
            width:100%;
        }
        .height_10px{
            height:10px;
        }
        .center{
            margin: 0 auto;
            align-content: center;
            text-align:center
        }
        .list{
            width : 300px;
            display: inline-block;
        }
        .inline-block{
            display:inline-block;
        }
        .div20p{
            width:19%;
            display:inline-block;
        }
        .div80p{
            width:79%;
            display:inline-block;
        }
        /* div{
            border: 1px solid red;
        } */
        hr{
            width:800px;
        }
    </style>
</head>
<body>
    <div class="all_area">

        <div class="dd">

            <br><br><br>


            <div class="center">
                <h1>작품 의뢰 수정</h1>
            </div>

            <br><br><br>

            <div class="div20p">
                <h3>카테고리</h3>
            </div>
            <div class="div80p">
                <select name="" id="">
                    <option value="">그림</option>
                    <option value="">굿즈</option>
                    <option value="">그림 + 굿즈</option>
                </select>
            </div>

            <br><br><hr><br>
            
            <div class="div20p">
                <h3>그림 카테고리</h3>
            </div>
            <div class="div80p">
                <select name="" id="">
                    <option value="">캐릭터 일러스트</option>
                    <option value="">일러스트</option>
                    <option value="">버츄얼Live2D</option>
                    <option value="">디자인</option>
                    <option value="">웹툰 만화</option>
                    <option value="">기타</option>
                </select>
            </div>

            <br><br><hr><br>

            <div class="div20p">
                <h3>굿즈 카테고리</h3>
            </div>
            <div class="div80p">
                <select name="" id="">
                    <option value="">의류</option>
                    <option value="">주방용품</option>
                    <option value="">문구</option>
                    <option value="">인테리어</option>
                    <option value="">기타</option>
                </select>
            </div>

            <br><br><hr><br>

            <div class="div20p">
                <h3>제목</h3>
            </div>
            <div class="div80p">
                <input type="text" placeholder="내용을 입력해주세요" style="width:300px;">
            </div>

            <br><br><hr><br>

            <div class="div20p">
                <h3>예산</h3>
            </div>
            <div class="div80p">
                <input type="text" placeholder="ex) 10만원 내외, 작가와의 협의" style="width:300px;">
            </div>

            <br><br><hr><br>

            <div>

                <div class="div20p" style="float:left;">
                    <h3>상품사진</h3>
                </div>
                <div class="div80p" style="padding-left:5px;">
                    <div class="inline-block" style="width:48%;">
                        <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                    </div>  
                    <div class="inline-block" style="width:48%;">
                        <img class="detail_img" src="https://www.maykids.co.kr/web/product/big/202305/7b6b4fafdd1618db5d2560abfffa7ae2.gif" alt="">
                    </div>
                </div>
            </div>
            <br><br><hr><br>

            <div>
                <div class="div20p" style="float:left;">
                    <h3>상세설명</h3>
                </div>
                <br>
                <div class="div80p" style="padding-left:5px;">
                    <textarea class="width" name="" id="" rows="10" style="resize:none;" maxlength="500"></textarea>
                </div>
            </div>
                
            <br><br><hr><br>

            <div>
                <div class="div20p">
                    <h3>작업완료 기한</h3>
                </div>
                <div class="div80p">
                    <input type="text" style="width:300px;">
                </div>
            </div>
                
            <br><br><hr><br>

            <div>
                <div class="div20p">
                    <h3>접수마감 기한</h3>
                </div>
                <div class="div80p">
                    <input type="text" style="width:300px;">
                </div>
            </div>
                
            <br><br><hr><br>

            <div class="center">
                <button style="width:200px;">수정</button>
                <button style="width:200px;">삭제</button>
            </div>



           











            










        </div>

    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>