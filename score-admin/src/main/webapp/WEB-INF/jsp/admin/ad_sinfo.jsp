<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生信息</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/bootstrap-datetimepicker.css"/>
    <link rel="stylesheet" href="../css/ad_index.css" />
    <link rel="stylesheet" href="../css/font-awesome.css" />
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/jquery.page.js"></script>
     <script src="../js/bootstrap-datetimepicker.js"></script>
     <script src="../js/bootstrap-datetimepicker.fr.js"></script>
    <script src="../js/bootstrap.min.js"></script>


</head>
    <style>
        .del_id{border:none;background:#fff;color:#fff;}
        .datetimepicker-hours{display:none;}
    </style>
<body>
<%--<a href="tests">ttest</a>--%>
<script type="text/javascript">
    //$(".form_datetime").datetimepicker({format: 'yyyy-mm-dd'});
    $(".form_datetime").
            datetimepicker({
                language: 'zh-CN',
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayBtn: true,
                startView: 'year',
                minView:'year',
                maxView:'decade'
            });
</script>
<div class="ad_rt">
    <div style="margin-bottom:20px;">
       <c:if test="${msUser.type==0}"> <button class="btn btn-success size" data-toggle="modal" data-target="#mymodal" style="margin-right:10px;">添加学生信息</button></c:if>
        <input type="text" class="studentContant form-control" placeholder="请输入学生学号或者姓名"/>
        <button type="submit" class="btn btn-warning selectStudent">查询</button>
    </div>

    <table class="s_info">
        <thead class="panel-heading size">
            <td>学号</td>
            <td >姓名</td>
            <td>性别</td>
            <td>班级</td>
            <td>入学时间</td>
            <td >政治面貌</td>
            <td >身份证号</td>
            <td style="width:18%">籍贯</td>
<c:if test="${msUser.type==0}">
            <td style="width:13%;">操作</td>
    </c:if>
        </thead>
        <div class="clear"></div>
            <tbody id="list"></tbody>
    </table>
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
            <form class="form-inline save_form">
                <div class="modal-body alt_stu">
                    <ul>
                        <li>
                            <label class="size" style="margin-left:20px">姓名：</label><input class="form-control sname" name="name" type="text"  />
                            <label class="size">年龄：</label><input class="form-control sage" type="number" name="age" style="width:180px;"/>
                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">性别：</label>
                                <select name="sex" class="ssex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                            <div style="width:274px;display:inline-block">
                                <label class="size">政治面貌：</label>
                                <select name="politicalLandscape" class="spoliticalLandscape">
                                    <option value="团员">团员</option>
                                    <option value="党员">党员</option>
                                    <option value="群众">群众</option>
                                </select>
                            </div>
                        </li>
                        <li>
                            <label class="size">班级：</label>
                            <select name="className" class="sclassName">
                                <option>高一</option>
                                <option>高二</option>
                                <option>高三</option>
                            </select>
                            <select name="grade" class="sgrade">
                                <option value="1">1</option>
                                <option  value="2">2</option>
                                <option value="3">3</option>
                                <option  value="4">4</option>
                                <option value="5">5</option>
                                <option  value="6">6</option>
                                <option value="7">7</option>
                                <option  value="8">8</option>
                                <option value="9">9</option>
                                <option  value="10">10</option>
                                <option value="11">11</option>
                                <option  value="12">12</option>
                            </select>

                        </li>
                        <li>
                            <label class="size">入学时间：</label>
                            <input size="16" type="text"  id="month_time" class="form_datetime form-control sdatesAttendance" name="datesAttendance">

                        </li>
                        <li><label class="size">身份证号：</label><input class="form-control sidCard" type="text" name="idCard" /></li>
                        <li><label class="size">籍贯：</label><input style="width:370px;" class="form-control sbirthPlace" type="text" name="birthPlace" /></li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default size">重置</button>
                    <button type="submit" class="btn btn_qd sbtn_qd " onclick="save()">确定</button>
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
            <form class="form-inline update_form">
                <div class="modal-body alt_stu">
                    <ul>
                        <li>
                            <label class="size">学号：</label><input class="form-control id" type="text" name="id" readonly/>
                            <label class="size" style="margin-left:20px">姓名：</label><input class="form-control name" name="name" type="text"  />
                            <label class="size">年龄：</label><input class="form-control age" type="number" name="age" />
                        </li>
                        <li>
                            <div style="width:274px;display:inline-block">
                                <label class="size">性别：</label>
                                <select name="sex" class="sex">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                            <div style="width:274px;display:inline-block">
                                <label class="size">级部：</label>
                                <select name="rankDept" class="rankDept">
                                    <option value="一级部">一级部</option>
                                    <option value="二级部">二级部</option>
                                </select>
                            </div>
                        </li>
                        <li>
                            <label class="size">班级：</label>
                            <select name="className" class="className">
                                <option>高一</option>
                                <option>高二</option>
                                <option>高三</option>
                            </select>
                            <select name="grade" class="grade">
                                <option value="1">1</option>
                                <option  value="2">2</option>
                                <option value="3">3</option>
                                <option  value="4">4</option>
                                <option value="5">5</option>
                                <option  value="6">6</option>
                                <option value="7">7</option>
                                <option  value="8">8</option>
                                <option value="9">9</option>
                                <option  value="10">10</option>
                                <option value="11">11</option>
                                <option  value="12">12</option>
                            </select>
                            <div style="width:274px;display:inline-block">
                                <label class="size">政治面貌：</label>
                                <select name="politicalLandscape" class="politicalLandscape">
                                    <option value="团员">团员</option>
                                    <option value="党员">党员</option>
                                    <option value="群众">群众</option>
                                </select>
                            </div>
                        </li>
                        <li>
                            <label class="size">入学时间：</label>
                            <input size="16" type="text"  class="form_datetime form-control datesAttendance" name="datesAttendance">
                        </li>
                        <li><label class="size">身份证号：</label><input class="form-control idCard" type="text" name="idCard" /></li>
                        <li><label class="size">籍贯：</label><input style="width:370px;" class="form-control birthPlace" type="text" name="birthPlace" /></li>
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
                <h4>确认删除该学生信息？</h4>
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
<input type="text" value="${count}" id="count" style="display:none;">
<input type="text" value="${msUser.type}" id="userType" style="display:none;">
<script>
    var format = function(time, format){
        var t = new Date(time);
        var tf = function(i){return (i < 10 ? '0' : '') + i};
        return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a){
            switch(a){
                case 'yyyy':
                    return tf(t.getFullYear());
                    break;
                case 'MM':
                    return tf(t.getMonth() + 1);
                    break;
                case 'dd':
                    return tf(t.getDate());
                    break;
                case 'HH':
                    return tf(t.getHours());
                    break;
                case 'mm':
                    return tf(t.getMinutes());
                    break;
            };
        });
    };
    $(document).ready(function() {
        $.ajax({
            url: "http://localhost:8080/admin/student/getAll",
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
                        $("#list").append('<td>' + item.className + item.grade + '班</td>');
                        $("#list").append('<td>' +format(item.datesAttendance,'yyyy-MM-dd') + '</td>');
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
                url: "http://localhost:8080/admin/student/getAll",
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
                            $("#list").append('<td>' + item.className + item.grade + '班</td>');
                            $("#list").append('<td>' + format(item.datesAttendance,'yyyy-MM-dd') + '</td>');
                            $("#list").append('<td>' + item.politicalLandscape + '</td>');
                            $("#list").append('<td>' + item.idCard + '</td>');
                            $("#list").append('<td>' + item.birthPlace + '</td>');
                            if($("#userType").val()==0) {
                                $("#list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 0;" onclick="updateSelect(' + item.id + ')">修改</button>');
                                $("#list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3"onclick="getdelid(' + item.id + ')">删除</button>');
                            }
                            $("#list").append('</tr>');
                        })
                    }
                }
            })
        }
    })

    $(".selectStudent").click(function(){
        $.ajax({
            url: "http://localhost:8080/admin/student/getStudent",
            data: {
                name:$(".studentContant").val(),
            },
            type: 'POST',
            dateType:"json",
            async: false,
            success: function (data) {
                if (data != null) {
                    $("#list").empty();
                    $(".tcdPageCode").empty();
                    $("#count").val(data.data.num);
                    $.each(data.data.datas, function (index, item) {
                        $("#list").append('<tr>');
                        $("#list").append('<td>' + item.id + '</td>');
                        $("#list").append('<td>' + item.name + '</td>');
                        $("#list").append('<td>' + item.sex + '</td>');
                        $("#list").append('<td>' + item.className + item.grade + '班</td>');
                        $("#list").append('<td>' +  format(item.datesAttendance,'yyyy-MM-dd') + '</td>');
                        $("#list").append('<td>' + item.politicalLandscape + '</td>');
                        $("#list").append('<td>' + item.idCard + '</td>');
                        $("#list").append('<td>' + item.birthPlace + '</td>');
                        if($("#userType").val()==0) {
                            $("#list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 0;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $("#list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3"onclick="getdelid(' + item.id + ')">删除</button>');
                        }
                        $("#list").append('</tr>');
                    })
                }
            }
        })
    })
    var updateSelect=function(id){
        $.ajax({
            url: "http://localhost:8080/admin/student/getOne",
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
                $(".className").val(data.data.className);
                $(".datesAttendance").val(format(data.data.datesAttendance,'yyyy-MM-dd HH:mm'));
                $(".politicalLandscape").val(data.data.politicalLandscape);
                $(".idCard").val(data.data.idCard);
                $(".birthPlace").val(data.data.birthPlace);
                $(".grade").val(data.data.grade);
                $(".rankDept").val(data.data.rankDept);
            }
        })
    };
    var save=function(){
        $.ajax({
            type : 'post',
            dateType:"json",
            data:$(".save_form").serialize(),
            url: "http://localhost:8080/admin/student/save",
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
    var update=function(){
        $.ajax({
            type : 'post',
            dateType:"json",
            data:$(".update_form").serialize(),
            url: "http://localhost:8080/admin/student/update",
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
            url: "http://localhost:8080/admin/student/delete",
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
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
</script>
</body>
</html>
