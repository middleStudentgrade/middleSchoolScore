<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form action="admin/downloadFile/download" method="post">
            <input type="text" name="grade" id="stuGrade" value="${grade}">
            <input type="text" name="className" id="stuClassName" value="${className}">
        <button class="btn btn-info size download">学生成绩录入模板下载</button>
        </form>
        <input type="text" class="ScoreId" />

        <button type="submit" class="btn selectScore" style="color:#fff">单个学生成绩查询</button>

        <label class="size">班级：</label>
        <form action="/adScore" method="post">
        <select name="className"  id="className" value ="${className}" onchange="updateClass()">
            <option value="高一" <c:if test="${className=='高一'}">selected</c:if>>高一</option>
            <option value="高二" <c:if test="${className=='高二'}">selected</c:if>>高二</option>
            <option value="高三" <c:if test="${className=='高三'}">selected</c:if>>高三</option>
        </select>
        <select name="grade" id="grade" value ="${grade}" onchange="updateClass()">
            <option value="1" <c:if test="${grade=='1'}">selected</c:if>>1</option>
            <option  value="2" <c:if test="${grade=='2'}">selected</c:if>>2</option>
            <option value="3" <c:if test="${grade=='3'}">selected</c:if>>3</option>
            <option  value="4" <c:if test="${grade=='4'}">selected</c:if>>4</option>
            <option value="5" <c:if test="${grade=='5'}">selected</c:if>>5</option>
            <option  value="6" <c:if test="${grade=='6'}">selected</c:if>>6</option>
            <option value="7" <c:if test="${grade=='7'}">selected</c:if>>7</option>
            <option  value="8" <c:if test="${grade=='8'}">selected</c:if>>8</option>
            <option value="9" <c:if test="${grade=='9'}">selected</c:if>>9</option>
            <option  value="10" <c:if test="${grade=='10'}">selected</c:if>>10</option>
            <option value="11" <c:if test="${grade=='11'}">selected</c:if>>11</option>
            <option  value="12" <c:if test="${grade=='12'}">selected</c:if>>12</option>
        </select>
       <button type="submit" class="btn selectScore" style="color:#fff">班级成绩查询</button>
        </form>
    </div>

    <table class="panel panel-info s_xx">
        <thead class="panel-heading size" style="padding:0 16px 49px 5px;">
        <td>学号</td>
        <td >姓名</td>
        <td>班级</td>
        <td>学期</td>
        <td>数学</td>
        <td >语文</td>
        <td >英语</td>
        ${grade}
        <c:if test="${grade<7 ||className=='高一'}">
        <td >历史</td>
        <td >地理</td>
        <td >政治</td>
        </c:if>
        <c:if test="${grade>6 ||className=='高一'}">
        <td >物理</td>
        <td >化学</td>
        <td >生物</td>
        </c:if>
        <c:if test="${className=='高三'}">
        <td >基本能力</td>
        </c:if>
        </thead>
        <div class="clear"></div>
        <tbody id="list"></tbody>
    </table>
    <div class="tcdPageCode"></div>
</div>
<div class="modal" id="mymodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="color:#27AE60">上传学生成绩</h4>
            </div>
            <form class="form-inline" action="admin/score/import" encType="multipart/form-data" method="post">
                <div class="modal-body add_stu" >
                           <select name="className"  value ="${className}">
                                <option value="高一" >高一</option>
                                <option value="高二" >高二</option>
                                <option value="高三" >高三</option>
                            </select>
                            <select name="grade" value ="${grade}">
                                <option value="1" >1</option>
                                <option  value="2">2</option>
                                <option value="3" >3</option>
                                <option  value="4" >4</option>
                                <option value="5" >5</option>
                                <option  value="6" >6</option>
                                <option value="7" >7</option>
                                <option  value="8" >8</option>
                                <option value="9" >9</option>
                                <option  value="10">10</option>
                                <option value="11" >11</option>
                                <option  value="12">12</option>
                            </select>
                    <label class="size" style="margin-left:20px">上传文件：</label><input type="file" name="file" />

                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default size">重置</button>
                    <button type="submit" class="btn btn_qd" style="color:#fff">确定</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--模态弹框  修改成绩-->
<div class="modal" id="mymoda2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" style="color:#27AE60">修改学生成绩</h4>
            </div>
            <form class="form-inline update_form" >
                <div class="modal-body add_stu" id="alt_sco">
                    <ul>
                        <li>
                            <input class="form-control id" type="text" name="id" />
                            <label class="size" style="margin-left:20px">学号：</label> <input class="form-control studentId" type="text" name="studentId" />
                                <label class="size" style="margin-left:20px">姓名：</label><input class="form-control name" type="text" name="name" />
                            <label class="size" style="margin-left:20px">班级：</label><input class="form-control className" type="text" name="className" />
                            <label class="size" style="margin-left:20px">学期：</label><input class="form-control term" type="text" name="term" />
                        </li>
                        <li>
                            <label class="size">语文：</label><input class="form-control chinese" type="text" />
                            <label class="size" style="margin-left:20px">数学：</label><input class="form-control math" name="math" type="text" />
                            <label class="size">英语：</label><input class="form-control english" name="english" type="text" />
                        </li>
                        <li>

                            <label class="size">物理：</label><input class="form-control physico" name="physico" type="text" />
                            <label class="size">化学：</label><input class="form-control chemical" name="chemical" type="text" />
                            <label class="size">生物：</label><input class="form-control biology" name="biology" type="text" />
                        </li>
                        <li>
                            <label class="size">历史：</label><input class="form-control history" name="history" type="text" />
                            <label class="size">地理：</label><input class="form-control geography" name="geography" type="text" />
                            <label class="size">政治：</label><input class="form-control political" name="political" type="text" />
                        </li>
                        <li><label class="size">基本能力：</label><input class="form-control basicCompetencies" name="basicCompetencies" type="text" /></li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default size">重置</button>
                    <button type="submit" class="btn btn_qd" style="color:#fff" onclick="update()">确定</button>
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
                    <input type="text" class="del_id">
                    <button class="btn btn-default size" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn_delqd" style="color:#fff">确定</button>
                </form>
            </div>

        </div>
    </div>
</div>
<input type="text" value="${count}" id="count">
<script>
    $(document).ready(function() {
        $.ajax({
            url: "http://localhost:8080/admin/score/getAll",
            data: {
                grade:$("#grade").val(),
                name:$("#className").val(),
            },
            type: 'POST',
            async: false,
            success: function (data) {
                $("#list").empty();
                if (data.data.num !=0) {
                    $.each(data.data.datas, function (index, item) {
                        $("#list").append('<tr>');
                        $("#list").append('<td>' + item.studentId + '</td>');
                        $("#list").append('<td>' + item.name + '</td>');
                        $("#list").append('<td>' + item.className + '</td>');
                        $("#list").append('<td>' + item.term + '</td>');
                        $("#list").append('<td>' + item.chinese + '</td>');
                        $("#list").append('<td>' + item.math + '</td>');
                        $("#list").append('<td>' + item.english + '</td>');
                        if(item.type==1||item.type==3) {
                            $("#list").append('<td>' + item.physico + '</td>');
                            $("#list").append('<td>' + item.chemical + '</td>');
                            $("#list").append('<td>' + item.biology + '</td>');
                        }
                        if(item.type==1||item.type==2) {
                            $("#list").append('<td>' + item.history + '</td>');
                            $("#list").append('<td>' + item.geography + '</td>');
                            $("#list").append('<td>' + item.political + '</td>');
                        }
                        if(item.type==4||item.type==5)
                        $("#list").append('<td>' + item.basicCompetencies + '</td>');
                        $("#list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;" onclick="updateSelect(' + item.id + ')">修改</button>');
                        $("#list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                        $("#list").append('</tr>');
                    })
                }
            }
        })
    })

    $(".selectScore").click(function(){
        $.ajax({
            url: "http://localhost:8080/admin/score/getScore",
            data: {
                name:$(".scoreId").val(),
            },
            type: 'POST',
            dateType:"json",
            async: false,
            success: function (data) {
                $("#list").empty();
                $(".tcdPageCode").empty();
                if (data.data.datas != null) {
                    $.each(data.data.datas, function (index, item) {
                        $("#list").append('<tr>');
                        $("#list").append('<td>' + item.studentId + '</td>');
                        $("#list").append('<td>' + item.name + '</td>');
                        $("#list").append('<td>' + item.className + '</td>');
                        $("#list").append('<td>' + item.term + '</td>');
                        $("#list").append('<td>' + item.chinese + '</td>');
                        $("#list").append('<td>' + item.math + '</td>');
                        $("#list").append('<td>' + item.english + '</td>');
                        if(item.type==1||item.type==3) {
                            $("#list").append('<td>' + item.physico + '</td>');
                            $("#list").append('<td>' + item.chemical + '</td>');
                            $("#list").append('<td>' + item.biology + '</td>');
                        }
                        if(item.type==1||item.type==2) {
                            $("#list").append('<td>' + item.history + '</td>');
                            $("#list").append('<td>' + item.geography + '</td>');
                            $("#list").append('<td>' + item.political + '</td>');
                        }
                        if(item.type==4||item.type==5)
                            $("#list").append('<td>' + item.basicCompetencies + '</td>');
                        $("#list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;" onclick="updateSelect(' + item.id + ')">修改</button>');
                        $("#list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
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
                url: "http://localhost:8080/admin/score/getAll",
                data: {
                    offset: p,
                    grade:$("#grade").val(),
                    name:$("#className").val(),
                },
                async: false,
                type: 'POST',
                success: function (data) {
                    $("#list").empty();
                    if (data.data.datas != null) {
                        $.each(data.data.datas, function (index, item) {
                            $("#list").append('<tr>');
                            $("#list").append('<td>' + item.studentId + '</td>');
                            $("#list").append('<td>' + item.name + '</td>');
                            $("#list").append('<td>' + item.className + '</td>');
                            $("#list").append('<td>' + item.term + '</td>');
                            $("#list").append('<td>' + item.chinese + '</td>');
                            $("#list").append('<td>' + item.math + '</td>');
                            $("#list").append('<td>' + item.english + '</td>');
                            if(item.type==1||item.type==3) {
                                $("#list").append('<td>' + item.physico + '</td>');
                                $("#list").append('<td>' + item.chemical + '</td>');
                                $("#list").append('<td>' + item.biology + '</td>');
                            }
                            if(item.type==1||item.type==2) {
                                $("#list").append('<td>' + item.history + '</td>');
                                $("#list").append('<td>' + item.geography + '</td>');
                                $("#list").append('<td>' + item.political + '</td>');
                            }
                            if(item.type==4||item.type==5)
                                $("#list").append('<td>' + item.basicCompetencies + '</td>');
                            $("#list").append('<button class="btn btn-info" data-toggle="modal" data-target="#mymoda2" style="margin:10px 10px 10px 16px;" onclick="updateSelect(' + item.id + ')">修改</button>');
                            $("#list").append(' <button class="btn btn-warning" data-toggle="modal" data-target="#mymoda3" onclick="getdelid(' + item.id + ')">删除</button>');
                            $("#list").append('</tr>');
                        })
                    }
                }
            })
        }
    })


    var updateSelect=function(id){
        $.ajax({
            url: "http://localhost:8080/admin/score/getOne",
            data: {
                id:id,
            },
            dateType:"json",
            type: 'POST',
            success: function (data) {
                $(".studentId").val(data.data.studentId);
                $(".name").val(data.data.name)
                $(".className").val(data.data.className);
                $(".chinese").val(data.data.chinese);
                $(".term").val(data.data.term);
                $(".math").val(data.data.math);
                $(".english").val(data.data.english);
                if(data.data.type==1||data.data.type==3) {
                    $(".physico").val(data.data.physico);
                    $(".chemical").val(data.data.chemical);
                    $(".biology").val(data.data.biology);
                }
                if(data.data.type==1||data.data.type==2) {
                    $(".history").val(data.data.history);
                    $(".geography").val(data.data.geography);
                    $(".political").val(data.data.political);
                }
                if(data.data.type==4||data.data.type==5) {
                    $(".basicCompetencies").val(data.data.basicCompetencies);
                }
            }
        })
    };
    var save=function(){
        $.ajax({
            type : 'post',
            dateType:"json",
            data:$(".save_form").serialize(),
            url: "http://localhost:8080/admin/score/save",
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
            url: "http://localhost:8080/admin/score/update",
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
            url: "http://localhost:8080/admin/score/delete",
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

    var updateClass=function(){
        $("#stuGrade").val($("#grade").val());
        $("#stuClassName").val($("#className").val());
    }

</script>
</body>
</html>
