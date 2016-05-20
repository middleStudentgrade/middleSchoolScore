<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/2
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="../css/stu_index.css">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
  <script src="../javaScript/student.js"></script>
</head>
<body>
<div style="height:60px"></div>

    <!--修改密码-->
    <div id="stu_mm"  class="container">
        <div class="panel panel-info" style="width:392px;">
          <div class="panel-heading">
            <h3 class="panel-title">修改密码</h3>
          </div>
          <div class="panel-body">
              <input id="studentId" type="text" value="${msStudent.id}" >
              <div class="form-group">
                <label >原密码:</label>
                <input  id="password" type="text" name="username" class="form-control"  placeholder="请输入原密码" onblur="password()" >
                 <br/> <span id="span1"></span>
                  <span id="error" style="margin-left:0;"></span>
              </div>
              <div class="form-group">
                <label >新密码:</label>
                <input id="rpwd" onblur="valPwd()" type="password" name="password" class="form-control" placeholder="请输入新密码" >
                  <br/><span id="span2"></span>
              </div>
              <div class="form-group">
                <label >确认密码:</label>
                <input id="newPassword" onblur="valRPwd()" type="password" name="password" class="form-control" placeholder="确认输入密码" >
                  <br/><span id="span3"></span>
              </div>
              <div style="width:296px;margin:0 auto;">
                <button id ="commit" class="btn btn-success" type="button" onclick="changepassword()">确认</button>
                <button class="btn btn-warning" type="reset" style="float:right">取消</button>
             </div>
          </div>
        </div>
      </div>
<script>3
    // 登录验证
   /* function valYhm(){
        var pwd=$("#password").val();
        if (pwd==""||pwd==null) {
            $("#span1").text("原密码不能为空");
        }
    }*/
    function valPwd(){
        var rpwd=$("#rpwd").val();
        if (rpwd == "" || rpwd == null) {
            $("#span2").text("新密码不能为空");
        }
        if(rpwd.length<6 || rpwd.length >15){
            $("#span2").text("密码长度须在6--15位之间");
        }
    }
    function valRPwd(){
        var repwd=$("#newPassword").val();
        var rpwd=$("#rpwd").val();
        if (repwd!=rpwd) {
            $("#span3").text("新密码和旧密码不一致");
        }
    }
</script>
</body>
</html>
