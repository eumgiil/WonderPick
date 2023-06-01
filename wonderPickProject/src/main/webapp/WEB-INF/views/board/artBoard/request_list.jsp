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
        .content {
            /* background-color:rgb(247, 245, 245); */
            width:900px;
            margin:auto;
            margin-top: 150px;
        }
        /* .detail{
            float: left;
            width : 65%;
        }         */
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
        .list {
            width: 100%;
            border-collapse: collapse;
        }
        .list th, td {
            border-bottom: 1px solid #444444;
            padding: 10px;
        }
        .inline-block{
            display:inline-block;
        }
    </style>
</head>
<body>
    <div class="all_area">

        <div class="dd">

            <div class="head" align="center">
                <h2> 작품 의뢰 </h2>
            </div>

            <br>
            <hr style="width:500px;">
            <br><br><br>

            <div class="t_align_right">
                <button>글작성</button>
            </div>
            <div>
                <div class="inline-block" style="width:49%;">n개의 의뢰접수가 있습니다.</div>

                    <div class="inline-block t_align_right" style="width:50%;">
                        <input type="checkbox"> 완료 제외 &nbsp; | &nbsp;
                        <select name="" id="">
                            <option value="">접수마감일</option>
                            <option value="">작업완료일</option>
                        </select>
                    </div>
            </div>

            <div align="center" style="height: 500px;">
                <table class="center list" style="margin-top: 20px;">
                    <thead>
                        <tr style="background-color: rgb(255, 131, 153);">
                            <th>접수현황</th>
                            <th>카테고리</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>접수마감일</th>
                            <th>작업완료일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>접수중</td>
                            <td>의류</td>
                            <td>가족사진 반팔티</td>
                            <td>user1</td>
                            <td>23.05.26</td>
                            <td>23.05.30</td>
                        </tr>
                        <tr>
                            <td>접수중</td>
                            <td>의류</td>
                            <td>가족사진 반팔티</td>
                            <td>user1</td>
                            <td>23.05.26</td>
                            <td>23.05.30</td>
                        </tr>
                        <tr>
                            <td>접수중</td>
                            <td>의류</td>
                            <td>가족사진 반팔티</td>
                            <td>user1</td>
                            <td>23.05.26</td>
                            <td>23.05.30</td>
                        </tr>
                        <tr>
                            <td>접수중</td>
                            <td>의류</td>
                            <td>가족사진 반팔티</td>
                            <td>user1</td>
                            <td>23.05.26</td>
                            <td>23.05.30</td>
                        </tr>
                        <tr>
                            <td>접수중</td>
                            <td>의류</td>
                            <td>가족사진 반팔티</td>
                            <td>user1</td>
                            <td>23.05.26</td>
                            <td>23.05.30</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <br><br><br><br>



            <div class="center">
                페이징처리 할 곳
            </div>
        











        </div>

    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>