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
        <button class="btn btn-default size" id="grade1">高一总成绩前100名</button>
        <div id="dropdown1" style="display:inline-block;position:relative;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" data-target="#dropdown1" id="grade2">高二总成绩前100名</button>
            <ul class="dropdown-menu gradetwo">
                <li id="grade2_art"><a href="#">文综</a></li>
                <li id="grade2_sci"><a href="#">理综</a></li>
            </ul>
        </div>
        <div style="position:relative;display:inline-block;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" id="grade3">高三总成绩前100名</button>
            <ul class="dropdown-menu gradethree">
                <li id="grade3_art"><a href="#">文综</a></li>
                <li id="grade3_sci"><a href="#">理综</a></li>
            </ul>
        </div>

    </div>
    <!--高一总成绩前100-->
    <div id="gra1" >
        <div class="panel panel-info s_xx">
            <ul class="panel-heading size" style="padding:10px 16px 42px 5px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>物理</li>
                <li style="width: 7%">生物</li>
                <li>化学</li>
                <li>历史</li>
                <li>地理</li>
                <li>政治</li>
                <li style="width:8%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">姓名姓</li>
                    <li style="width:8%;">十一班</li>

                    <li>90</li>
                    <li>100</li>
                    <li>100</li>
                    <li style="width:5%;">90</li>
                    <li style="width:7%;">99</li>
                    <li>100</li>
                    <li>80</li>
                    <li>88</li>
                    <li>90</li>
                    <li>50</li>
                    <li style="width:9%;">887</li>
                </ul>
                <div class="clear"></div>
                <div style="border-top:1px solid #e5e3da"></div>
            </foreach>

        </div>
        <div class="tcdPageCode"></div>
    </div>
    <!--高二文科总成绩前100-->
    <div id="gra2_art" class="panel panel-info s_xx">
        <div>
            <ul class="panel-heading size" style="padding:10px 16px 42px 5px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li>姓名</li>
                <li >班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>历史</li>
                <li>地理</li>
                <li>政治</li>
                <li >基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li >姓名姓</li>
                    <li >五班</li>
                    <li>90</li>
                    <li style="width:7%;">100</li>
                    <li>100</li>
                    <li>80</li>
                    <li>88</li>
                    <li>90</li>
                    <li>50</li>
                    <li >887</li>
                </ul>
                <div class="clear"></div>
                <div style="border-top:1px solid #e5e3da"></div>
            </foreach>
        </div>
        <div class="tcdPageCode"></div>
    </div>
    <!--高二理科总成绩前100-->
    <div id="gra2_sci" class="panel panel-info s_xx">
        <div>
            <ul class="panel-heading size" style="padding:10px 16px 42px 5px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li>姓名</li>
                <li >班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>物理</li>
                <li>化学</li>
                <li>生物</li>
                <li >基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li >姓名姓</li>
                    <li >五班</li>
                    <li>90</li>
                    <li style="width:7%;">100</li>
                    <li>100</li>
                    <li>80</li>
                    <li>88</li>
                    <li>90</li>
                    <li>50</li>
                    <li >887</li>
                </ul>
                <div class="clear"></div>
                <div style="border-top:1px solid #e5e3da"></div>
            </foreach>
        </div>
        <div class="tcdPageCode"></div>
    </div>
    <!--高三文科总成绩前100-->
    <div id="gra3_art" class="panel panel-info s_xx">
        <div>
            <ul class="panel-heading size" style="padding:10px 16px 42px 5px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li>姓名</li>
                <li >班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>历史</li>
                <li>地理</li>
                <li>政治</li>
                <li >基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li >姓名姓</li>
                    <li >五班</li>
                    <li>90</li>
                    <li style="width:7%;">100</li>
                    <li>100</li>
                    <li>80</li>
                    <li>88</li>
                    <li>90</li>
                    <li>50</li>
                    <li >887</li>
                </ul>
                <div class="clear"></div>
                <div style="border-top:1px solid #e5e3da"></div>
            </foreach>
        </div>
        <div class="tcdPageCode"></div>
    </div>
    <!--高三理科总成绩前100-->
    <div id="gra3_sci" class="panel panel-info s_xx">
        <div>
            <ul class="panel-heading size" style="padding:10px 16px 42px 5px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li>姓名</li>
                <li >班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>物理</li>
                <li>化学</li>
                <li>生物</li>
                <li >基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li >姓名姓</li>
                    <li >五班</li>
                    <li>90</li>
                    <li style="width:7%;">100</li>
                    <li>100</li>
                    <li>80</li>
                    <li>88</li>
                    <li>90</li>
                    <li>50</li>
                    <li >887</li>
                </ul>
                <div class="clear"></div>
                <div style="border-top:1px solid #e5e3da"></div>
            </foreach>
        </div>
        <div class="tcdPageCode"></div>
    </div>
</div>



<script>
    $(function(){
        $("#grade1").click(function(){
            $("#grade2").removeClass("crs_click");
            $("#grade3").removeClass("crs_click");
            $("#grade2").html("高二总成绩前100名");
            $("#grade3").html("高三总成绩前100名");
            $("#gra1").show();
            $("#gra2_art").hide();
            $("#gra2_sci").hide();
            $("#gra3_art").hide();
            $("#gra3_sci").hide();
        });
        $("#grade2_art").click(function(){
            $("#grade1").removeClass("crs_click");
            $("#grade3").removeClass("crs_click");
            $("#grade2").addClass("crs_click size");
            $("#grade2").html("高二"+$(this).html()+"前100名");
            $("#grade3").html("高三总成绩前100名");
            $("#gra1").hide();
            $("#gra2_art").show();
            $("#gra2_sci").hide();
            $("#gra3_art").hide();
            $("#gra3_sci").hide();
        });
        $("#grade2_sci").click(function(){
            $("#grade1").removeClass("crs_click");
            $("#grade3").removeClass("crs_click");
            $("#grade2").addClass("crs_click size");
            $("#grade2").html("高二"+$(this).html()+"前100名");
            $("#grade3").html("高三总成绩前100名");
            $("#gra1").hide();
            $("#gra2_art").hide();
            $("#gra2_sci").show();
            $("#gra3_art").hide();
            $("#gra3_sci").hide();
        });
        $("#grade3_art").click(function(){
            $("#grade2").removeClass("crs_click");
            $("#grade1").removeClass("crs_click");
            $("#grade3").addClass("crs_click size");
            $("#grade3").html("高三"+$(this).html()+"前100名");
            $("#grade2").html("高二总成绩前100名");
            $("#gra1").hide();
            $("#gra2_art").hide();
            $("#gra2_sci").hide();
            $("#gra3_art").show();
            $("#gra3_sci").hide();
        });
        $("#grade3_sci").click(function(){
            $("#grade2").removeClass("crs_click");
            $("#grade1").removeClass("crs_click");
            $("#grade3").addClass("crs_click size");
            $("#grade3").html("高三"+$(this).html()+"前100名");
            $("#grade2").html("高二总成绩前100名");
            $("#gra1").hide();
            $("#gra2_art").hide();
            $("#gra2_sci").hide();
            $("#gra3_art").hide();
            $("#gra3_sci").show();
        });

    })
</script>
</body>
</html>
