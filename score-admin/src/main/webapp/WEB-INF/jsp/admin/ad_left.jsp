<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/ad_index.css" />
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>


    <script type="text/javascript">
        $(function(){
            $(".subNav").click(function(){
                $(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd")
                $(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt")

                // 修改数字控制速度， slideUp(500)控制卷起速度
                $(this).next(".navCon").slideToggle(300).siblings(".navCon").slideUp(300);

            })
        })
    </script>
</head>

<body>

<div class="ad_lf">

    <div class="subNav currentDd currentDt"><p>学生信息管理</p></div>
    <ul class="navCon">
        <li id="s_info"><a href="ad_sinfo.jsp" class="list-group-item" target="main" >查看学生信息</a></li>
    </ul>
    <div style="height:30px;"></div>
    <div class="subNav currentDd currentDt"><p>教师信息管理</p></div>
    <ul class="navCon">
        <li id="t_info"><a href="ad_tinfo.jsp" class="list-group-item" target="main">查看教师信息</a></li>
    </ul>
    <div style="height:30px;"></div>
    <div class="subNav currentDd currentDt"><p>成绩管理</p></div>
    <ul class="navCon">

        <li><div class="subNav currentDd currentDt" style="font-size:16px;padding-left:10px;">排行榜</div>
            <ul class="navCon phb" style="line-height:30px;">
                <li><a href="" target="main">查询年级前100名</a></li>
                <li><a href="" target="main">查询年级各科最高成绩</a></li>
                <li><a href="" target="main">查询各班及格率</a></li>
                <li><a href="" target="main">查询各级部前十名</a></li>
            </ul>
        </li>
        <li id="cj_info"><a href="ad_score.jsp" class="list-group-item" target="main">成绩管理</a></li>
    </ul>

</div>


</body>
</html>
