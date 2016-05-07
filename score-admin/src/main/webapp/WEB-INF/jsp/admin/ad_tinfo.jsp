<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/ad_index.css" />

    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery.page.js"></script>

</head>

<body>

<div class="ad_rt">
    <div style="margin:30px 30px 20px;">

        <button class="btn btn-success size" data-toggle="modal" data-target="#mymodal" style="margin-right:10px;">添加教师信息</button>
        <form style="display:inline-block">
            <input type="text" class="form-control cz_js" placeholder="请输入教师编号"/>
            <button type="submit" class="btn btn_qd" style="color:#fff">查找</button>
        </form>
    </div>

    <div class="panel panel-info s_xx">
        <ul class="panel-heading size" style="padding:0px 16px 49px 10px;">
            <li>编号</li>
            <li style="width:8%;">姓名</li>
            <li style="width:6%;">性别</li>

            <li>职务</li>
            <li style="width:9%;">年级</li>
            <li>教授课程</li>
            <li>教育程度</li>
            <li style="width:22%;">邮箱</li>
        </ul>
        <div class="clear"></div>
        <foreach>
            <ul style="padding-left:10px;">
                <li>20082213232</li>
                <li style="width:8%;">姓名姓</li>
                <li style="width:6%;">男</li>

                <li>高级教师</li>
                <li style="width:8%;">高三</li>
                <li >英语</li>
                <li>硕士</li>
                <li style="width:22%;">wenlilincheng@163.com</li>
            </ul>
            <button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 10px;">修改</button>
            <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3">删除</button>
            <div class="clear"></div>
            <div style="border-top:1px solid #e5e3da"></div>
        </foreach>
    </div>
    <div class="tcdPageCode"></div>
</div>
<!--模态弹框  添加教师信息-->
<div class="modal" id="mymodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="color:#27AE60">添加教师信息</h4>
            </div>
            <form class="form-inline">
                <div class="modal-body add_stu">
                    <ul>
                        <li>
                            <label class="size">编号：</label><input class="form-control" type="text" />
                            <label class="size" style="margin-left:20px">姓名：</label><input class="form-control" type="text" />
                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">性别：</label>
                                <select>
                                    <option>男</option>
                                    <option>女</option>
                                </select>
                            </div>
                            <label class="size">教育程度：</label>
                            <select>
                                <option>本科</option>
                                <option>硕士</option>
                                <option>博士</option>
                            </select>

                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">职务：</label>
                                <select>
                                    <option>讲师</option>
                                    <option>高级教师</option>
                                    <option>特级教师</option>
                                </select>
                            </div>
                            <label class="size">年级：</label>
                            <select>
                                <option>高一</option>
                                <option>高二</option>
                                <option>高三</option>
                            </select>

                        </li>
                        <li><label class="size">教授课程：</label>
                            <select>
                                <option>语文</option>  <option>数学</option>
                                <option>英语</option>  <option>地理</option>
                                <option>历史</option>  <option>政治</option>
                                <option>生物</option>  <option>物理</option>
                                <option>化学</option>  <option>基本能力</option>
                            </select>
                        </li>
                        <li><label class="size">邮箱：</label><input style="width:240px;" class="form-control" type="text" /></li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default size">重置</button>
                    <button type="submit" class="btn btn_qd" style="color:#fff">添加</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--模态弹框  修改教师信息-->
<div class="modal" id="mymoda2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="color:#27AE60">修改教师信息</h4>
            </div>
            <form class="form-inline">
                <div class="modal-body alt_stu">
                    <ul>
                        <li>
                            <label class="size">编号：</label><input class="form-control" type="text" value="20082213232" style="width:128px"/>
                            <label class="size" style="margin-left:65px">姓名：</label><input class="form-control" value="真实姓名" type="text" style="width:98px" />
                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">性别：</label>
                                <select>
                                    <option>男</option>
                                    <option>女</option>
                                </select>
                            </div>
                            <label class="size">教育程度：</label>
                            <select>
                                <option>本科</option>
                                <option selected="selected">硕士</option>
                                <option>博士</option>
                            </select>
                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">职务：</label>
                                <select>
                                    <option>讲师</option>
                                    <option>高级教师</option>
                                    <option>特级教师</option>
                                </select>
                            </div>
                            <label class="size">年级：</label>
                            <select>
                                <option>高一</option>
                                <option>高二</option>
                                <option>高三</option>
                            </select>
                        </li>
                        <li><label class="size">教授课程：</label>
                            <select>
                                <option>语文</option>  <option>数学</option>
                                <option>英语</option>  <option>地理</option>
                                <option>历史</option>  <option>政治</option>
                                <option>生物</option>  <option>物理</option>
                                <option>化学</option><option>基本能力</option>
                            </select></li>
                        <li><label class="size">邮箱：</label><input style="width:240px;" class="form-control" type="text" value="wenlilincheng@163.com"/></li>
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
                <h4>确认删除该教师信息？</h4>
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
