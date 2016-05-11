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
    <script src="../../js/Chart.js"></script>
</head>

<body>
<div class="rank_rt">
    <div class="rank_btn size pass_btn" style="position:relative;">
        <button class="btn btn-default size" id="Pass1">高一年级及格率</button>
        <div id="dropdown1" style="display:inline-block;position:relative;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" data-target="#dropdown1" id="Pass2">高二年级及格率</button>
            <ul class="dropdown-menu gradetwo" style="min-width:140px;">
                <li id="Pass2_art"><a href="#">文科班</a></li>
                <li id="Pass2_sci"><a href="#">理科班</a></li>
            </ul>
        </div>
        <div style="position:relative;display:inline-block;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" id="Pass3">高三年级及格率</button>
            <ul class="dropdown-menu gradethree" style="min-width:140px;">
                <li id="Pass3_art"><a href="#">文科班</a></li>
                <li id="Pass3_sci"><a href="#">理科班</a></li>
            </ul>
        </div>
    </div>
    <!--高一及格率-->
    <div id="rate1">
        <canvas id="myChart1" width="600" height="500"></canvas>
    </div>
    <!--高二及格率-->
    <div id="rate2_art">
        <canvas id="myChart2" width="600" height="500"></canvas>
    </div>

    <div id="rate2_sci">
        <canvas id="myChart3" width="600" height="500"></canvas>
    </div>
    <!--高三及格率-->
    <div id="rate3_art">
        <canvas id="myChart4" width="600" height="500"></canvas>
    </div>

    <div id="rate3_sci">
        <canvas id="myChart5" width="600" height="500"></canvas>
    </div>

</div>
<script>
    window.onload = function(){
        var ctx = document.getElementById("myChart1").getContext("2d");
        window.myPie = new Chart(ctx).Bar(data);
    };
    var data = {
        labels : ["A级部","B级部","C级部"],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                data : [100,59,90]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(181,187,205,1)",
                data : [28,48,40]
            }
        ]
    }


    var ctx = document.getElementById("myChart2").getContext("2d");
    window.myPie = new Chart(ctx).Bar(data);

    var data = {
        labels : ["A级部","B级部","C级部"],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                data : [90,59,90]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(181,187,205,1)",
                data : [28,48,40]
            }
        ]
    }

    var ctx = document.getElementById("myChart3").getContext("2d");
    window.myPie = new Chart(ctx).Bar(data);

    var data = {
        labels : ["A级部","B级部","C级部"],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                data : [80,59,90]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(181,187,205,1)",
                data : [28,48,40]
            }
        ]
    }

    var ctx = document.getElementById("myChart4").getContext("2d");
    window.myPie = new Chart(ctx).Bar(data);

    var data = {
        labels : ["A级部","B级部","C级部"],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                data : [60,59,90]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(181,187,205,1)",
                data : [28,48,40]
            }
        ]
    }

    var ctx = document.getElementById("myChart5").getContext("2d");
    window.myPie = new Chart(ctx).Bar(data);

    var data = {
        labels : ["A级部","B级部","C级部"],
        datasets : [
            {
                fillColor : "rgba(220,220,220,0.5)",
                strokeColor : "rgba(220,220,220,1)",
                data : [40,59,90]
            },
            {
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                data : [28,48,40]
            },
            {
                fillColor : "rgba(214,187,205,0.5)",
                strokeColor : "rgba(181,187,205,1)",
                data : [28,48,40]
            }
        ]
    }

</script>

<script>
    $(function(){
        $("#Pass1").addClass("crs_click");
        $("#Pass1").click(function(){
            $("#Pass2").removeClass("crs_click");
            $("#Pass3").removeClass("crs_click");
            $("#Pass2").html("高二年级及格率");
            $("#Pass3").html("高三年级及格率");
            $("#rate1").show();
            $("#rate2_art").hide();
            $("#rate2_sci").hide();
            $("#rate3_art").hide();
            $("#rate3_sci").hide();
        });
        $("#Pass2_art").click(function(){
            $("#Pass1").removeClass("crs_click");
            $("#Pass3").removeClass("crs_click");
            $("#Pass2").addClass("crs_click");
            $("#Pass2").html("高二"+$(this).html()+"及格率");
            $("#Pass3").html("高三年级及格率");
            $("#rate1").hide();
            $("#rate2_art").show();
            $("#rate2_sci").hide();
            $("#rate3_art").hide();
            $("#gra3_sci").hide();
        });
        $("#Pass2_sci").click(function(){
            $("#Pass1").removeClass("crs_click");
            $("#Pass3").removeClass("crs_click");
            $("#Pass2").addClass("crs_click");
            $("#Pass2").html("高二"+$(this).html()+"及格率");
            $("#Pass3").html("高三年级及格率");
            $("#rate1").hide();
            $("#rate2_art").hide();
            $("#rate2_sci").show();
            $("#rate3_art").hide();
            $("#rate3_sci").hide();
        });
        $("#Pass3_art").click(function(){
            $("#Pass1").removeClass("crs_click");
            $("#Pass2").removeClass("crs_click");
            $("#Pass3").addClass("crs_click");
            $("#Pass3").html("高三"+$(this).html()+"及格率");
            $("#Pass2").html("高二年级及格率");
            $("#rate1").hide();
            $("#rate2_art").hide();
            $("#rate2_sci").hide();
            $("#rate3_art").show();
            $("#rate3_sci").hide();
        });
        $("#Pass3_sci").click(function(){
            $("#Pass1").removeClass("crs_click");
            $("#Pass2").removeClass("crs_click");
            $("#Pass3").addClass("crs_click");
            $("#Pass3").html("高三"+$(this).html()+"及格率");
            $("#Pass2").html("高二年级及格率");
            $("#rate1").hide();
            $("#rate2_art").hide();
            $("#rate2_sci").hide();
            $("#rate3_art").hide();
            $("#rate3_sci").show();
        });

    })
</script>
</body>
</html>
