<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/ad_index.css" />

    <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap.js"></script>
</head>

<body>
<div class="rank_rt">
    <div class="rank_btn size pass_btn">
        <div id="dropdown1" style="display:inline-block;position:relative;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" data-target="#dropdown1" id="Dept1">高一各级部前10名</button>
            <ul class="dropdown-menu gradetwo" style="min-width:158px;">
                <li id="Adept1"><a href="#">A级部</a></li>
                <li id="Bdept1"><a href="#">B级部</a></li>
            </ul>
        </div>
        <div id="dropdown2" style="display:inline-block;position:relative;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" data-target="#dropdown2" id="Dept2">高二各级部前10名</button>
            <ul class="dropdown-menu gradetwo" style="min-width:158px;">
                <li id="Adept2"><a href="#">A级部</a></li>
                <li id="Bdept2"><a href="#">B级部</a></li>
            </ul>
        </div>
        <div style="position:relative;display:inline-block;">
            <button class="btn btn-default dropdown-toggle size" data-toggle="dropdown" id="Dept3">高三各级部前10名</button>
            <ul class="dropdown-menu gradethree" style="min-width:158px;">
                <li id="Adept3"><a href="#">A级部</a></li>
                <li id="Bdept3"><a href="#">B级部</a></li>
            </ul>
        </div>
    </div>
    <!--高一A级部前10名-->
    <div id="adept1">
        <div class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
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
                    <li style="width:7%;">李丽红</li>
                    <li style="width:8%;">二班</li>

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
    <!--高一B级部前10名-->
    <div id="bdept1">
        <div class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
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
                    <li style="width:7%;">张珂</li>
                    <li style="width:8%;">一班</li>

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
    <!--高二A级部前10名-->
    <div id="adept2">
        <div class="rank_btn">
            <button class="btn btn-default" id="Adept2_art">文科班</button>
            <button class="btn btn-default" id="Adept2_sci">理科班</button>
        </div>
        <div id="adept2_art" class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>历史</li>
                <li>地理</li>
                <li>政治</li>
                <li style="width:9%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">高二</li>
                    <li style="width:8%;">文科</li>
                    <li>A</li>
                    <li>100</li>
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
        <div id="adept2_sci" class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>物理</li>
                <li>化学</li>
                <li>生物</li>
                <li style="width:9%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">高二</li>
                    <li style="width:8%;">理科</li>
                    <li>A</li>
                    <li>100</li>
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
    </div>
    <!--高二B级部前10名-->
    <div id="bdept2">
        <p class="rank_btn">
            <button class="btn btn-default" id="Bdept2_art">文科班</button>
            <button class="btn btn-default" id="Bdept2_sci">理科班</button>
        </p>
        <div id="bdept2_art" class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>历史</li>
                <li>地理</li>
                <li>政治</li>
                <li style="width:9%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">高二</li>
                    <li style="width:8%;">文科</li>
                    <li>B</li>
                    <li>100</li>
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
        <div id="bdept2_sci" class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>物理</li>
                <li>化学</li>
                <li>生物</li>
                <li style="width:9%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">高二</li>
                    <li style="width:8%;">理科</li>
                    <li>B</li>
                    <li>100</li>
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
    </div>

    <!--高三A级部前10名-->
    <div id="adept3">
        <p class="rank_btn">
            <button class="btn btn-default" id="Adept3_art">文科班</button>
            <button class="btn btn-default" id="Adept3_sci">理科班</button>
        </p>
        <div id="adept3_art" class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>历史</li>
                <li>地理</li>
                <li>政治</li>
                <li style="width:9%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">高三</li>
                    <li style="width:8%;">文科</li>
                    <li>A</li>
                    <li>100</li>
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
        <div id="adept3_sci" class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>物理</li>
                <li>化学</li>
                <li>生物</li>
                <li style="width:9%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">高三</li>
                    <li style="width:8%;">理科</li>
                    <li>A</li>
                    <li>100</li>
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
    </div>
    <!--高三B级部前10名-->
    <div id="bdept3">
        <p class="rank_btn">
            <button class="btn btn-default" id="Bdept3_art">文科班</button>
            <button class="btn btn-default" id="Bdept3_sci">理科班</button>
        </p>
        <div id="bdept3_art" class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>历史</li>
                <li>地理</li>
                <li>政治</li>
                <li style="width:9%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">高三</li>
                    <li style="width:8%;">文科</li>
                    <li>B</li>
                    <li>100</li>
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
        <div id="bdept3_sci" class="s_xx">
            <ul class="size heading" style="padding:10px 10px 40px 10px;">
                <li>名次</li>
                <li style="width:10%;">学号</li>
                <li style="width:7%;">姓名</li>
                <li style="width:8%;">班级</li>
                <li>语文</li>
                <li>数学</li>
                <li>英语</li>
                <li>物理</li>
                <li>化学</li>
                <li>生物</li>
                <li style="width:9%;">基本能力</li>
                <li>总分</li>
            </ul>
            <div class="clear"></div>
            <foreach>
                <ul>
                    <li>1</li>
                    <li style="width:10%;">20082213232</li>
                    <li style="width:7%;">高三</li>
                    <li style="width:8%;">理科</li>
                    <li>B</li>
                    <li>100</li>
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
    </div>
</div>
<script>
    $(function(){

        $("#Adept1").click(function(){
            $("#Dept2").removeClass("crs_click");
            $("#Dept3").removeClass("crs_click");
            $("#Dept1").addClass("crs_click");
            $("#Dept1").html("高一"+$(this).html()+"前10名");
            $("#Dept2").html("高二各级部前10名");
            $("#Dept3").html("高三各级部前10名");
            $("#adept1").show();
            $("#bdept1").hide();
            $("#adept2").hide();
            $("#bdept2").hide();
            $("#adept3").hide();
            $("#bdept3").hide();
        });
        $("#Bdept1").click(function(){
            $("#Dept2").removeClass("crs_click");
            $("#Dept3").removeClass("crs_click");
            $("#Dept1").addClass("crs_click");
            $("#Dept1").html("高一"+$(this).html()+"前10名");
            $("#Dept2").html("高二各级部前10名");
            $("#Dept3").html("高三各级部前10名");
            $("#bdept1").show();
            $("#adept1").hide();
            $("#adept2").hide();
            $("#bdept2").hide();
            $("#adept3").hide();
            $("#bdept3").hide();
        });
        $("#Adept2").click(function(){
            $("#Dept1").removeClass("crs_click");
            $("#Dept3").removeClass("crs_click");
            $("#Dept2").addClass("crs_click");
            $("#Dept2").html("高二"+$(this).html()+"前10名");
            $("#Dept1").html("高一各级部前10名");
            $("#Dept3").html("高三各级部前10名");
            $("#adept2").show();
            $("#adept1").hide();
            $("#bdept1").hide();
            $("#adept3").hide();
            $("#bdept2").hide();
            $("#bdept3").hide();
        });
        $("#Bdept2").click(function(){
            $("#Dept1").removeClass("crs_click");
            $("#Dept3").removeClass("crs_click");
            $("#Dept2").addClass("crs_click");
            $("#Dept2").html("高二"+$(this).html()+"前10名");
            $("#Dept1").html("高一各级部前10名");
            $("#Dept3").html("高三各级部前10名");
            $("#bdept2").show();
            $("#adept2").hide();
            $("#adept1").hide();
            $("#bdept1").hide();
            $("#adept3").hide();
            $("#bdept3").hide();
        });
        $("#Adept3").click(function(){
            $("#Dept1").removeClass("crs_click");
            $("#Dept2").removeClass("crs_click");
            $("#Dept3").addClass("crs_click");
            $("#Dept3").html("高三"+$(this).html()+"前10名");
            $("#Dept1").html("高一各级部前10名");
            $("#Dept2").html("高二各级部前10名");
            $("#adept3").show();
            $("#bdept3").hide();
            $("#adept1").hide();
            $("#bdept1").hide();
            $("#adept2").hide();
            $("#bdept2").hide();
        });
        $("#Bdept3").click(function(){
            $("#Dept1").removeClass("crs_click");
            $("#Dept2").removeClass("crs_click");
            $("#Dept3").addClass("crs_click");
            $("#Dept3").html("高三"+$(this).html()+"前10名");
            $("#Dept1").html("高一各级部前10名");
            $("#Dept2").html("高二各级部前10名");
            $("#bdept3").show();
            $("#adept3").hide();
            $("#adept1").hide();
            $("#bdept1").hide();
            $("#adept2").hide();
            $("#bdept2").hide();
        });
        $("#Adept2_art").addClass("crs_click");
        $("#Bdept2_art").addClass("crs_click");
        $("#Adept3_art").addClass("crs_click");
        $("#Bdept3_art").addClass("crs_click");
        $("#Adept2_art").click(function(){
            $("#adept2_sci").hide();
            $("#adept2_art").show();
        });
        $("#Adept2_sci").click(function(){
            $("#Adept2_art").removeClass("crs_click");
            $("#adept2_art").hide();
            $("#adept2_sci").show();
        });
        $("#Bdept2_art").click(function(){
            $("#bdept2_sci").hide();
            $("#bdept2_art").show();
        });
        $("#Bdept2_sci").click(function(){
            $("#Bdept2_art").removeClass("crs_click");
            $("#bdept2_art").hide();
            $("#bdept2_sci").show();
        });
        $("#Adept3_art").click(function(){
            $("#adept3_sci").hide();
            $("#adept3_art").show();
        });
        $("#Adept3_sci").click(function(){
            $("#Adept3_art").removeClass("crs_click");
            $("#adept3_art").hide();
            $("#adept3_sci").show();
        });
        $("#Bdept3_art").click(function(){
            $("#bdept3_sci").hide();
            $("#bdept3_art").show();
        });
        $("#Bdept3_sci").click(function(){
            $("#Bdept3_art").removeClass("crs_click");
            $("#bdept3_art").hide();
            $("#bdept3_sci").show();
        });
    })
</script>
</body>
</html>
