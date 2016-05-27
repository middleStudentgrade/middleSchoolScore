<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        .del_id{border:none;background:#fff;color:#fff;}
    </style>
<body>

<div class="ad_rt">
<c:if test="${msUser.type==0}"> <button class="btn btn-success size" data-toggle="modal" data-target="#mymodal" style="margin-right:10px;">添加教师信息</button></c:if>
            <input type="text" class="form-control teaId" placeholder="请输入教师编号或者教师名"/>
            <button type="submit" class="btn btn-warning selectTeacher">查询</button>


    <table class="t_info" style="margin-top:20px;">
        <thead class="panel-heading size">
        <td style="width:8%;">教师编号</td>
        <td style="width:8%;">姓名</td>
        <td style="width:4%;">性别</td>
        <td style="width:8%;">政治面貌</td>
        <td style="width:16%;">身份证号</td>
        <td style="width:18%;">籍贯</td>
<c:if test="${msUser.type==0}">
    <td style=";width:13%;">操作</td>
    </c:if>
        </thead>
        <tbody id="list"></tbody>
    </table>
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
            <form class="form-inline save_form">
                <div class="modal-body add_stu">
                    <ul>
                        <li>
                            <label class="size" style="margin-left:20px">姓名：</label><input class="form-control sname" name="name" type="text" />
                            <label class="size" style="margin-left:20px">年龄：</label><input style="width:100px;" class="form-control sage" name="age" type="number" />
                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">性别：</label>
                                <select class="ssex" name="sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                            <label class="size">学历：</label>
                            <select class="seducation" name="education">
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>

                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size" >职务：</label>
                                <select class="stitle" name="title">
                                    <option value="讲师">讲师</option>
                                    <option value="高级教师">高级教师</option>
                                    <option value="特级教师">特级教师</option>
                                </select>
                            </div>
                            <div style="width:274px;display:inline-block">
                                <label class="size" >政治面貌：</label>
                                <select class="spoliticalLandscape" name="politicalLandscape">
                                    <option value="党员">党员</option>
                                    <option value="群众">群众</option>
                                </select>
                            </div>
                        </li>
                        <li>
                            <label class="size">部门：</label><input class="form-control sdepartment" type="text" name="department" />
                            <label class="size">身份证号：</label><input class="form-control sidCard" type="text" name="idCard" />
                        </li>
                        <li><label class="size">邮箱：</label><input style="width:240px;" class="form-control semail" name="email" type="text" /></li>
                            <label class="size">籍贯：</label><input style="width:240px;" class="form-control sbirthPlace" type="text" name="birthPlace" />
                        </ul>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default size">重置</button>
                    <button type="submit" class="btn btn_qd" onclick="save()">添加</button>
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
            <form class="form-inline update_form" >
                <div class="modal-body alt_stu">
                    <ul>
                        <li>
                            <label class="size">编号：</label><input class="form-control id" type="text" name="id" readonly/>
                            </li>
                        <li><label class="size" style="margin-left:20px">姓名：</label><input class="form-control name" name="name" type="text" />
                            <label class="size" style="margin-left:20px">年龄：</label><input class="form-control age" name="age" type="number" />
                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">性别：</label>
                                <select class="sex" name="sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                            <label class="size">学历：</label>
                            <select class="education" name="education">
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>

                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size" >职务：</label>
                                <select  class="size title" name="title">
                                    <option value="讲师">讲师</option>
                                    <option value="高级教师">高级教师</option>
                                    <option value="特级教师">特级教师</option>
                                </select>
                            </div>
                            <div style="width:274px;display:inline-block">
                                <label class="size">政治面貌：</label>
                                <select class="politicalLandscape" name="politicalLandscape">
                                    <option value="党员">党员</option>
                                    <option value="团员">团员</option>
                                    <option value="群众">群众</option>
                                </select>
                            </div>
                        </li>
                           <label class="size">部门：</label><input class="form-control department" type="text" name="department" />
                           <label class="size">身份证号：</label><input class="form-control idCard" type="text" name="idCard" />

                        <li>

                        </li>
                        <li><label class="size">邮箱：</label><input style="width:240px;" class="form-control email" name="email" type="text" /></li>
                            <label class="size">籍贯：</label><input style="width:240px;" class="form-control birthPlace" type="text" name="birthPlace" />
                        </ul>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default size">重置</button>
                    <button type="submit" class="btn btn_qd" onclick="update()">确定</button>
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
                    <input type="text" class="del_id">
                    <button class="btn btn-default size" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn_qd btn_delqd">确定</button>
                </form>
            </div>
        </div>
        </div>
    </div>
</div>
<input type="text" value="${count}" id="count" style="display:none;">
    <input type="text" value="${msUser.type}" id="userType" style="display:none;">
<script>
    $(document).ready(function() {
        $.ajax({
            url: "http://localhost:8080/admin/teacher/getAll",
            data: {},
            type: 'POST',
            success: function (data) {
                if (data != null) {
                    $("#list").empty();
                    $.each(data.data.datas, function (index, item) {
                        $("#list").append('<tr>');
                        $("#list").append('<td>' + item.id + '</td>');
                        $("#list").append('<td>' + item.name + '</td>');
                        $("#list").append('<td>' + item.sex + '</td>');
                        $("#list").append('<td>' + item.politicalLandscape + '</td>');
                        $("#list").append('<td>' + item.idCard + '</td>');
                        $("#list").append('<td>' + item.birthPlace + '</td>');
                        if($("#userType").val()==0) {
                            $("#list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 0;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $("#list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                        }
                        $("#list").append('</tr>');
                    })
                }
            }
        })
    })


    $(".tcdPageCode").createPage({
        pageCount: $("#count").val(),
        current: 1,
        backFn: function (p) {
            $.ajax({
                url: "http://localhost:8080/admin/teacher/getAll",
                data: {
                    offset: p
                },
                type: 'POST',
                success: function (data) {
                    if (data != null) {
                        $("#list").empty();
                        $.each(data.data.datas, function (index, item) {
                            $("#list").append('<tr>');
                            $("#list").append('<td>' + item.id + '</td>');
                            $("#list").append('<td>' + item.name + '</td>');
                            $("#list").append('<td>' + item.sex + '</td>');
                            $("#list").append('<td>' + item.politicalLandscape + '</td>');
                            $("#list").append('<td>' + item.idCard + '</td>');
                            $("#list").append('<td>' + item.birthPlace + '</td>');
                            if($("#userType").val()==0) {
                                $("#list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 0;" onclick="updateSelect(' + item.id + ')">修改</button>');
                                $("#list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                            }
                            $("#list").append('</tr>');
                        })
                    }
                }
            })
        }
    })


    var updateSelect=function(id){
        $.ajax({
            url: "http://localhost:8080/admin/teacher/getOne",
            data: {
                id:id,
            },
            dateType:"json",
            type: 'POST',
            success: function (data) {
                $(".id").val(data.data.id);
                $(".name").val(data.data.name)
                $(".sex").val(data.data.sex);
                $(".age").val(data.data.age);
                $(".politicalLandscape").val(data.data.politicalLandscape);
                $(".idCard").val(data.data.idCard);
                $(".birthPlace").val(data.data.birthPlace);
                $(".email").val(data.data.email);
                $(".department").val(data.data.department);
                $(".education").val(data.data.education);
                $(".title").val(data.data.title);
            }
        })
    };


    var save=function(){
        $.ajax({
            type : 'post',
            dateType:"json",
            data:$(".save_form").serialize(),
            url: "http://localhost:8080/admin/teacher/save",
            async: false,
            error : function(data){
                console.log("保存失败");
            },
            success : function(data){
                if(data.status==200){
                    alert("保存成功");
                }
                else{
                    alert("保存失败");
                }
            },
        });
    }


    $(".selectTeacher").click(function(){
        $.ajax({
            url: "http://localhost:8080/admin/teacher/getTeacher",
            data: {
                name:$(".teaId").val(),
            },
            type: 'POST',
            dateType:"json",
            async: false,
            success: function (data) {

               if (data != null) {
                $("#list").empty();
                $(".tcdPageCode").empty();
                    $.each(data.data.datas, function (index, item) {
                        $("#list").append('<tr>');
                        $("#list").append('<td>' + item.id + '</td>');
                        $("#list").append('<td>' + item.name + '</td>');
                        $("#list").append('<td>' + item.sex + '</td>');
                        $("#list").append('<td>' + item.politicalLandscape + '</td>');
                        $("#list").append('<td>' + item.idCard + '</td>');
                        $("#list").append('<td>' + item.birthPlace + '</td>');
                        if($("#userType").val()==0) {
                            $("#list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 0;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $("#list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                        }
                        $("#list").append('</tr>');
                    })
                }
            }
        })
    })
    var update=function(){
        $.ajax({
            type : 'post',
            dateType:"json",
            data:$(".update_form").serialize(),
            url: "http://localhost:8080/admin/teacher/update",
            async: false,
            error : function(data){
                console.log("保存失败");
            },
            success : function(data){
                if(data.status==200){
                    alert("保存成功");
                }
                else{
                    alert("保存失败");
                }
            },
        });
    }
    $(".btn_delqd").click(function(){
        $.ajax({
            type : 'post',
            dateType:"json",
            data:{"id": $(".del_id").val()},
            url: "http://localhost:8080/admin/teacher/delete",
            async: false,
            error : function(){
                console.log("删除失败");
            },
            success : function(data){
                if(data.status==200){
                    alert("删除成功");
                }
                else{
                    alert("删除失败");
                }
            },
        });
    })
    var getdelid=function(id){
        $(".del_id").val(id);
    }


</script>
</body>
</html>
