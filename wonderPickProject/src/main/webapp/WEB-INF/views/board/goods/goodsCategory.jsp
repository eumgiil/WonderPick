<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
<title>굿즈 카테고리</title>
<style>
        .category{
            float: left;
            margin-left: 5%;
            margin-top: 10%;
            height: 500px;

        }
        .category a{
            text-decoration: none;
            color: black;
            font-weight: bolder;
        }
        .category a:hover{
            color :rgb(255, 131, 153);
            font-size: larger;
        }
        .category_option{
            height: 300px;
            width: 100%;
        }
    </style>
</head>
<body>

 <div class="category">
        <h3 style="font-weight: bold; color:rgb(255, 131, 153) ;">카테고리</h3>
        <hr style="border: 1px solid black; width: 200px;">
        <table class="category_option">
            <tr>
                <td><a href="categorylist.go?goodsCategory=${ g.goodsCategory.equals('FASHION') }&cPage=1">패션</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=${category.kitchen}&cPage=1">주방</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=${category.interior}&cPage=1">인테리어</a></td>
            </tr>
            <tr>
                <td><a href="categorylist.go?goodsCategory=${category.stationery}&cPage=1">문구</a></td>
            </tr>
            <tr>
            </tr>
                <td><a href="categorylist.go?goodsCategory=${category.etc}&cPage=1">기타</a></td>
            </tr>
        </table>


    </div>

</body>
</html>