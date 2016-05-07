<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title><link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/ad_index.css" />

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery.page.js"></script>

</head>

<body>

<div class="ad_rt">
    <div style="margin:30px 30px 20px;">
        <button class="btn btn-success size" data-toggle="modal" data-target="#mymodal" style="margin-right:10px;">上传成绩单</button>
        <button class="btn btn-info size">学生成绩录入模板下载</button>
    </div>

    <div id="sco_gl" class="panel panel-info s_xx">
        <ul class="panel-heading size" style="padding:0 16px 49px 10px;">
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
        </ul>
        <div class="clear"></div>
        <foreach>
            <ul>
                <li style="width:10%;">20082213232</li>
                <li style="width:7%;">姓名姓</li>
                <li style="width:8%;">高一十一班</li>
                <li>90</li>
                <li>100</li>
                <li>100</li>
                <li>90</li>
                <li>99</li>
                <li>100</li>
                <li>80</li>
                <li>88</li>
                <li>90</li>
                <li>50</li>
            </ul>
            <button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 22px;">修改</button>
            <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3">删除</button>
            <div class="clear"></div>
            <div style="border-top:1px solid #e5e3da"></div>
        </foreach>
    </div>
    <div class="tcdPageCode"></div>
</div>

<!--模态弹框  修改成绩-->
<div class="modal" id="mymoda2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="color:#27AE60">修改学生成绩</h4>
            </div>
            <form class="form-inline">
                <div class="modal-body add_stu" id="alt_sco">
                    <ul>
                        <li>
                            <label class="size">学号：</label><span>20122213246</span>
                            <label class="size" style="margin-left:20px">姓名：</label><span>njkjuh</span>
                        </li>
                        <li>
                            <label class="size">语文：</label><input class="form-control" type="text" />
                            <label class="size" style="margin-left:20px">数学：</label><input class="form-control" type="text" />
                            <label class="size">英语：</label><input class="form-control" type="text" />
                        </li>
                        <li>

                            <label class="size">物理：</label><input class="form-control" type="text" />
                            <label class="size">化学：</label><input class="form-control" type="text" />
                            <label class="size">生物：</label><input class="form-control" type="text" />

                        </li>
                        <li>
                            <label class="size">历史：</label><input class="form-control" type="text" />
                            <label class="size">地理：</label><input class="form-control" type="text" />
                            <label class="size">生物：</label><input class="form-control" type="text" />
                        </li>
                        <li><label class="size">基本能力：</label><input class="form-control" type="text" /></li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default size">重置</button>
                    <button type="submit" class="btn btn_qd" style="color:#fff">确定</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--模态弹框 删除提示-->
<div class="modal" id="mymoda3" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:400px">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4>确认删除该学生成绩？</h4>
            </div>
            <div class="modal-footer">
                <form>
                    <button class="btn btn-default size" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn_qd" style="color:#fff">确定</button>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    $(".tcdPageCode").createPage({
        pageCount:6,
        current:1,
        backFn:function(p){
            console.log(p);
        }
    });

</script>
</body>
</html>
