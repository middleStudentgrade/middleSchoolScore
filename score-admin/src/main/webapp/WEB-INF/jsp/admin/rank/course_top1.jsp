<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/ad_index.css" />

    <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/jquery.page.js"></script>
</head>

<body>
<div class="rank_rt">
    <div class="rank_btn size" style="position:relative;">
        <button class="btn btn-default size" id="Course1">高一各科最高成绩</button>
        <button class="btn btn-default size" id="Course2">高二各科最高成绩</button>
        <button class="btn btn-default size" id="Course3">高三各科最高成绩</button>
        <span class="explain"></span>
    </div>
    <!--高一各科最高成绩-->
    <div id="crs1">
        <table class="table table-bordered">
            <tr class="crs1_th">
                <td>科目</td>
                <td>成绩</td>
                <td>学号</td>
                <td>姓名</td>
                <td>班级</td>
            </tr>

            <c:forEach var="item" items="${sophomoreScore}" varStatus="status">
                <tr <c:if test="${status.count%2==0}">bgcolor="#CCCCFE"</c:if> align="left">
                    <td>${item.scoreName}</td>
                    <td>${item.score}</td>
                    <td>${item.stuNum}</td>
                    <td>${item.name}</td>
                    <td>${item.clasName}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
    <!--高二各科最高成绩-->
    <div id="crs2">
        <button class="btn btn-success size" style="margin-bottom:20px;">文科班</button>
        <table class="table table-bordered">
            <tr class="crs1_th">
                <th>科目</th>
                <th>成绩</th>
                <th>学号</th>
                <th>姓名</th>
                <th>班级</th>
            </tr>
            <c:forEach var="item" items="${juniorScoreArt}" varStatus="status">
                <tr <c:if test="${status.count%2==0}">bgcolor="#CCCCFE"</c:if> align="left">
                    <td>${item.scoreName}</td>
                    <td>${item.score}</td>
                    <td>${item.stuNum}</td>
                    <td>${item.name}</td>
                    <td>${item.clasName}</td>
                </tr>
            </c:forEach>
        </table>
        <button class="btn btn-success size" style="margin-bottom:20px;">理科班</button>
        <table class="table table-bordered">
            <tr class="crs1_th">
                <th>科目</th>
                <th>成绩</th>
                <th>学号</th>
                <th>姓名</th>
                <th>班级</th>
            </tr>
            <c:forEach var="item" items="${juniorScoreScience}" varStatus="status">
                <tr <c:if test="${status.count%2==0}">bgcolor="#CCCCFE"</c:if> align="left">
                    <td>${item.scoreName}</td>
                    <td>${item.score}</td>
                    <td>${item.stuNum}</td>
                    <td>${item.name}</td>
                    <td>${item.clasName}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <!--高三各科最高成绩-->
    <div id="crs3">
        <button class="btn btn-success size" style="margin-bottom:20px;">文科班</button>
        <table class="table table-bordered">
            <tr class="crs1_th">
                <th>科目</th>
                <th>成绩</th>
                <th>学号</th>
                <th>姓名</th>
                <th>班级</th>
            </tr>
            <c:forEach var="item" items="${seniorScoreArt}" varStatus="status">
                <tr <c:if test="${status.count%2==0}">bgcolor="#CCCCFE"</c:if> align="left">
                    <td>${item.scoreName}</td>
                    <td>${item.score}</td>
                    <td>${item.stuNum}</td>
                    <td>${item.name}</td>
                    <td>${item.clasName}</td>
                </tr>
            </c:forEach>
        </table>
        <button class="btn btn-success size" style="margin-bottom:20px;">理科班</button>
        <table class="table table-bordered">
            <tr class="crs1_th">
                <th>科目</th>
                <th>成绩</th>
                <th>学号</th>
                <th>姓名</th>
                <th>班级</th>
            </tr>
            <c:forEach var="item" items="${seniorScoreScience}" varStatus="status">
                <tr <c:if test="${status.count%2==0}">bgcolor="#CCCCFE"</c:if> align="left">
                    <td>${item.scoreName}</td>
                    <td>${item.score}</td>
                    <td>${item.stuNum}</td>
                    <td>${item.name}</td>
                    <td>${item.clasName}</td>
                </tr>
            </c:forEach>
        </table>
    </div>


</div>

<script>
    $(function(){
        $("#Course1").addClass("crs_click");
        $("#Course1").click(function(){
            $("#crs1").show();
            $("#crs2").hide();
            $("#crs3").hide();

        });
        $("#Course2").click(function(){
            $("#Course1").removeClass("crs_click");
            $("#crs2").show();
            $("#crs1").hide();
            $("#crs3").hide();

        });
        $("#Course3").click(function(){
            $("#Course1").removeClass("crs_click");
            $("#crs3").show();
            $("#crs1").hide();
            $("#crs2").hide();

        });


    })
</script>
</body>
</html>
