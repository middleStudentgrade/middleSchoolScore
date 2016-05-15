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
        <button class="btn btn-default size" id="grade1">高一总成绩前10名</button>
        <div id="dropdown1" style="display:inline-block;position:relative;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" data-target="#dropdown1" id="grade2">高二总成绩前10名</button>
            <ul class="dropdown-menu gradetwo">
                <li id="grade2_art"><a href="#">文综</a></li>
                <li id="grade2_sci"><a href="#">理综</a></li>
            </ul>
        </div>
        <div style="position:relative;display:inline-block;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" id="grade3">高三总成绩前10名</button>
            <ul class="dropdown-menu gradethree">
                <li id="grade3_art"><a href="#">文综</a></li>
                <li id="grade3_sci"><a href="#">理综</a></li>
            </ul>
        </div>

    </div>
    <!--高一总成绩前100-->
    <div id="gra1" >
        <table class="panel panel-info s_xx">
            <thead class="panel-heading size" style="padding:0 16px 49px 5px;">
            <td>学号</td>
            <td >姓名</td>
            <td>班级</td>
            <td>学期</td>
            <td>数学</td>
            <td >语文</td>
            <td >英语</td>
            <td >历史</td>
            <td >地理</td>
            <td >政治</td>
            <td >物理</td>
            <td >化学</td>
            <td >生物</td>
            <td >基本能力</td>
            </thead>
            <div class="clear"></div>
            <tbody class="list"></tbody>
        </table>
    </div>
    <!--高二文科总成绩前100-->
    <div id="gra2_art" class="panel panel-info s_xx">
        <table class="panel panel-info s_xx">
            <thead class="panel-heading size" style="padding:0 16px 49px 5px;">
            <td>学号</td>
            <td >姓名</td>
            <td>班级</td>
            <td>学期</td>
            <td>数学</td>
            <td >语文</td>
            <td >英语</td>
            <td >历史</td>
            <td >地理</td>
            <td >政治</td>
            <td >物理</td>
            <td >化学</td>
            <td >生物</td>
            <td >基本能力</td>
            </thead>
            <div class="clear"></div>
            <tbody class="list"></tbody>
        </table>
    </div>
    <!--高二理科总成绩前100-->
    <div id="gra2_sci" class="panel panel-info s_xx">
        <table class="panel panel-info s_xx">
            <thead class="panel-heading size" style="padding:0 16px 49px 5px;">
            <td>学号</td>
            <td >姓名</td>
            <td>班级</td>
            <td>学期</td>
            <td>数学</td>
            <td >语文</td>
            <td >英语</td>
            <td >历史</td>
            <td >地理</td>
            <td >政治</td>
            <td >物理</td>
            <td >化学</td>
            <td >生物</td>
            <td >基本能力</td>
            </thead>
            <div class="clear"></div>
            <tbody class="list"></tbody>
        </table>
    </div>
    <!--高三文科总成绩前100-->
    <div id="gra3_art" class="panel panel-info s_xx">
        <table class="panel panel-info s_xx">
            <thead class="panel-heading size" style="padding:0 16px 49px 5px;">
            <td>学号</td>
            <td >姓名</td>
            <td>班级</td>
            <td>学期</td>
            <td>数学</td>
            <td >语文</td>
            <td >英语</td>
            <td >历史</td>
            <td >地理</td>
            <td >政治</td>
            <td >物理</td>
            <td >化学</td>
            <td >生物</td>
            <td >基本能力</td>
            </thead>
            <div class="clear"></div>
            <tbody class="list"></tbody>
        </table>

    <!--高三理科总成绩前100-->
    <div id="gra3_sci" class="panel panel-info s_xx">
        <table class="panel panel-info s_xx">
            <thead class="panel-heading size" style="padding:0 16px 49px 5px;">
            <td>学号</td>
            <td >姓名</td>
            <td>班级</td>
            <td>学期</td>
            <td>数学</td>
            <td >语文</td>
            <td >英语</td>
            <td >历史</td>
            <td >地理</td>
            <td >政治</td>
            <td >物理</td>
            <td >化学</td>
            <td >生物</td>
            <td >基本能力</td>
            </thead>
            <div class="clear"></div>
            <tbody class="list"></tbody>
        </table>
</div>

</div>
</div>
<script>
    $(function(){
        $("#grade1").click(function(){
            $("#grade2").removeClass("crs_click");
            $("#grade3").removeClass("crs_click");
            $("#grade2").html("高二总成绩前10名");
            $("#grade3").html("高三总成绩前10名");
            $("#gra1").show();
            $("#gra2_art").hide();
            $("#gra2_sci").hide();
            $("#gra3_art").hide();
            $("#gra3_sci").hide();
            $.ajax({
                url: "http://localhost:8080/admin/score/gradeTopHundredthHighOne",
                data: {id:1},
                type: 'POST',
                success: function (data) {
                    if (data != null) {
                        $(".list").empty();
                        $.each(data.data.datas, function (index, item) {
                            $(".list").append('<tr>');
                            $(".list").append('<td>' + item.studentId + '</td>');
                            $(".list").append('<td>' + item.name + '</td>');
                            $(".list").append('<td>' + item.className + '</td>');
                            $(".list").append('<td>' + item.term + '</td>');
                            $(".list").append('<td>' + item.chinese + '</td>');
                            $(".list").append('<td>' + item.math + '</td>');
                            $(".list").append('<td>' + item.english + '</td>');
                            $(".list").append('<td>' + item.physico + '</td>');
                            $(".list").append('<td>' + item.chemical + '</td>');
                            $(".list").append('<td>' + item.biology + '</td>');
                            $(".list").append('<td>' + item.history + '</td>');
                            $(".list").append('<td>' + item.geography + '</td>');
                            $(".list").append('<td>' + item.political + '</td>');
                            $(".list").append('<td>' + item.basicCompetencies + '</td>');
                            $(".list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $(".list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                            $(".list").append('</tr>');
                        })
                    }
                }
            })


        });
        $("#grade2_art").click(function(){
            $("#grade1").removeClass("crs_click");
            $("#grade3").removeClass("crs_click");
            $("#grade2").addClass("crs_click size");
            $("#grade2").html("高二"+$(this).html()+"前10名");
            $("#grade3").html("高三总成绩前10名");
            $("#gra1").hide();
            $("#gra2_art").show();
            $("#gra2_sci").hide();
            $("#gra3_art").hide();
            $("#gra3_sci").hide();
            $.ajax({
                url: "http://localhost:8080/admin/score/gradeTopHundredthHighOne",
                data: {id:2},
                type: 'POST',
                success: function (data) {
                    if (data != null) {
                        $(".list").empty();
                        $.each(data.data.datas, function (index, item) {
                            $(".list").append('<tr>');
                            $(".list").append('<td>' + item.studentId + '</td>');
                            $(".list").append('<td>' + item.name + '</td>');
                            $(".list").append('<td>' + item.className + '</td>');
                            $(".list").append('<td>' + item.term + '</td>');
                            $(".list").append('<td>' + item.chinese + '</td>');
                            $(".list").append('<td>' + item.math + '</td>');
                            $(".list").append('<td>' + item.english + '</td>');
                            $(".list").append('<td>' + item.physico + '</td>');
                            $(".list").append('<td>' + item.chemical + '</td>');
                            $(".list").append('<td>' + item.biology + '</td>');
                            $(".list").append('<td>' + item.history + '</td>');
                            $(".list").append('<td>' + item.geography + '</td>');
                            $(".list").append('<td>' + item.political + '</td>');
                            $(".list").append('<td>' + item.basicCompetencies + '</td>');
                            $(".list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $(".list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                            $(".list").append('</tr>');
                        })
                    }
                }
            })
        });
        $("#grade2_sci").click(function(){
            $("#grade1").removeClass("crs_click");
            $("#grade3").removeClass("crs_click");
            $("#grade2").addClass("crs_click size");
            $("#grade2").html("高二"+$(this).html()+"前10名");
            $("#grade3").html("高三总成绩前10名");
            $("#gra1").hide();
            $("#gra2_art").hide();
            $("#gra2_sci").show();
            $("#gra3_art").hide();
            $("#gra3_sci").hide();
            $.ajax({
                url: "http://localhost:8080/admin/score/gradeTopHundredthHighOne",
                data: {id:3},
                type: 'POST',
                success: function (data) {
                    if (data != null) {
                        $(".list").empty();
                        $.each(data.data.datas, function (index, item) {
                            $(".list").append('<tr>');
                            $(".list").append('<td>' + item.studentId + '</td>');
                            $(".list").append('<td>' + item.name + '</td>');
                            $(".list").append('<td>' + item.className + '</td>');
                            $(".list").append('<td>' + item.term + '</td>');
                            $(".list").append('<td>' + item.chinese + '</td>');
                            $(".list").append('<td>' + item.math + '</td>');
                            $(".list").append('<td>' + item.english + '</td>');
                            $(".list").append('<td>' + item.physico + '</td>');
                            $(".list").append('<td>' + item.chemical + '</td>');
                            $(".list").append('<td>' + item.biology + '</td>');
                            $(".list").append('<td>' + item.history + '</td>');
                            $(".list").append('<td>' + item.geography + '</td>');
                            $(".list").append('<td>' + item.political + '</td>');
                            $(".list").append('<td>' + item.basicCompetencies + '</td>');
                            $(".list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $(".list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                            $(".list").append('</tr>');
                        })
                    }
                }
            })
        });
        $("#grade3_art").click(function(){
            $("#grade2").removeClass("crs_click");
            $("#grade1").removeClass("crs_click");
            $("#grade3").addClass("crs_click size");
            $("#grade3").html("高三"+$(this).html()+"前10名");
            $("#grade2").html("高二总成绩前10名");
            $("#gra1").hide();
            $("#gra2_art").hide();
            $("#gra2_sci").hide();
            $("#gra3_art").show();
            $("#gra3_sci").hide();
            $.ajax({
                url: "http://localhost:8080/admin/score/gradeTopHundredthHighOne",
                data: {id:4},
                type: 'POST',
                success: function (data) {
                    if (data != null) {
                        $(".list").empty();
                        $.each(data.data.datas, function (index, item) {
                            $(".list").append('<tr>');
                            $(".list").append('<td>' + item.studentId + '</td>');
                            $(".list").append('<td>' + item.name + '</td>');
                            $(".list").append('<td>' + item.className + '</td>');
                            $(".list").append('<td>' + item.term + '</td>');
                            $(".list").append('<td>' + item.chinese + '</td>');
                            $(".list").append('<td>' + item.math + '</td>');
                            $(".list").append('<td>' + item.english + '</td>');
                            $(".list").append('<td>' + item.physico + '</td>');
                            $(".list").append('<td>' + item.chemical + '</td>');
                            $(".list").append('<td>' + item.biology + '</td>');
                            $(".list").append('<td>' + item.history + '</td>');
                            $(".list").append('<td>' + item.geography + '</td>');
                            $(".list").append('<td>' + item.political + '</td>');
                            $(".list").append('<td>' + item.basicCompetencies + '</td>');
                            $(".list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $(".list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                            $(".list").append('</tr>');
                        })
                    }
                }
            })
        });
        $("#grade3_sci").click(function(){
            $("#grade2").removeClass("crs_click");
            $("#grade1").removeClass("crs_click");
            $("#grade3").addClass("crs_click size");
            $("#grade3").html("高三"+$(this).html()+"前10名");
            $("#grade2").html("高二总成绩前10名");
            $("#gra1").hide();
            $("#gra2_art").hide();
            $("#gra2_sci").hide();
            $("#gra3_art").hide();
            $("#gra3_sci").show();
            $.ajax({
                url: "http://localhost:8080/admin/score/gradeTopHundredthHighOne",
                data: {id:5},
                type: 'POST',
                success: function (data) {
                    if (data != null) {
                        $(".list").empty();
                        $.each(data.data.datas, function (index, item) {
                            $(".list").append('<tr>');
                            $(".list").append('<td>' + item.studentId + '</td>');
                            $(".list").append('<td>' + item.name + '</td>');
                            $(".list").append('<td>' + item.className + '</td>');
                            $(".list").append('<td>' + item.term + '</td>');
                            $(".list").append('<td>' + item.chinese + '</td>');
                            $(".list").append('<td>' + item.math + '</td>');
                            $(".list").append('<td>' + item.english + '</td>');
                            $(".list").append('<td>' + item.physico + '</td>');
                            $(".list").append('<td>' + item.chemical + '</td>');
                            $(".list").append('<td>' + item.biology + '</td>');
                            $(".list").append('<td>' + item.history + '</td>');
                            $(".list").append('<td>' + item.geography + '</td>');
                            $(".list").append('<td>' + item.political + '</td>');
                            $(".list").append('<td>' + item.basicCompetencies + '</td>');
                            $(".list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $(".list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                            $(".list").append('</tr>');
                        })
                    }
                }
            })
        });

    })
</script>
</body>
</html>
