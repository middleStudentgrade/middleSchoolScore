<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
        <button class="btn btn-success size" data-toggle="modal" data-target="#mymodal" style="margin-right:10px;">添加学生信息</button>
    </div>

    <div class="panel panel-info s_xx">
        <ul class="panel-heading size" style="padding:0 16px 49px 5px;">
            <li>学号</li>
            <li style="width:8%;">姓名</li>
            <li style="width:4%;">性别</li>
            <li>班级</li>
            <li>入学时间</li>
            <li style="width:8%;">政治面貌</li>
            <li style="width:16%;">身份证号</li>
            <li style="width:18%;">籍贯</li>
        </ul>
        <div class="clear"></div>
        <foreach>
            <ul>
                <li>20082213232</li>
                <li style="width:8%;">姓名姓</li>
                <li style="width:4%;">男</li>
                <li>高一十一班</li>
                <li>2015.09.01</li>
                <li style="width:8%;">团员</li>
                <li style="width:16%;">372924199312025722</li>
                <li style="width:18%;">山东省菏泽市成武县张楼镇吕洼行政村齐庙村</li>
            </ul>
            <button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;">修改</button>
            <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3">删除</button>
            <div class="clear"></div>
            <div style="border-top:1px solid #e5e3da"></div>
        </foreach>
    </div>
    <div class="tcdPageCode"></div>
</div>
<!--模态弹框  添加学生信息-->
<div class="modal" id="mymodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="color:#27AE60">添加学生信息</h4>
            </div>
            <form class="form-inline">
                <div class="modal-body add_stu">
                    <ul>
                        <li>
                            <label class="size">学号：</label><input class="form-control" type="text" />
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
                            <label class="size">班级：</label>
                            <select>
                                <option>高一</option>
                                <option>高二</option>
                                <option>高三</option>
                            </select>
                            <select>
                                <option></option>
                                <option></option>
                            </select>


                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">政治面貌：</label>
                                <select>
                                    <option>共青团员</option>
                                    <option>党员</option>
                                    <option>群众</option>
                                </select>
                            </div>
                            <label class="size">入学时间：</label>
                            <select>
                                <option></option>
                                <option></option>
                                <option></option>
                            </select>
                            <select>
                                <option></option>
                                <option></option>
                                <option></option>
                            </select>
                        </li>
                        <li><label class="size">身份证号：</label><input class="form-control" type="text" /></li>
                        <li><label class="size">籍贯：</label><input style="width:370px;" class="form-control" type="text" /></li>
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
<!--模态弹框  修改学生信息-->
<div class="modal" id="mymoda2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="color:#27AE60">修改学生信息</h4>
            </div>
            <form class="form-inline">
                <div class="modal-body alt_stu">
                    <ul>
                        <li>
                            <label class="size">学号：</label><input class="form-control" type="text" />
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
                            <label class="size">班级：</label>
                            <select>
                                <option>高一</option>
                                <option>高二</option>
                                <option>高三</option>
                            </select>
                            <select>
                                <option></option>
                                <option></option>
                            </select>


                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">政治面貌：</label>
                                <select>
                                    <option>共青团员</option>
                                    <option>党员</option>
                                    <option>群众</option>
                                </select>
                            </div>
                            <label class="size">入学时间：</label>
                            <select>
                                <option></option>
                                <option></option>
                                <option></option>
                            </select>
                            <select>
                                <option></option>
                                <option></option>
                                <option></option>
                            </select>
                        </li>
                        <li><label class="size">身份证号：</label><input class="form-control" type="text" /></li>
                        <li><label class="size">籍贯：</label><input style="width:370px;" class="form-control" type="text" /></li>
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
                <h4>确认删除该学生信息？</h4>
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
