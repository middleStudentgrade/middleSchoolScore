<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/ad_login.css">
  <script src="../js/jquery.js"></script>
</head>

<body>
<div class="container" style="background-color:#34495a">

  <form class="con" action="/login" method="post">
    <div class="logo">
      <h3>中学生成绩管理系统</h3>
      <h4 style="line-height: 30px;color:#415d98;">Middle School Students achievement management system<em class="l_l">高中版</em></h4>
    </div>
    <div class="ad_login">
      <div class="login_top">管理员登录</div>
      <div class="form-group">
        <label>用户名</label>
        <input type="text" name="userName" id="userName" class="form-control" onblur="valYhm()"  placeholder="请输入用户名">
        <span id="span1">${username}</span>

      </div>
      <div class="form-group">
        <label >密码</label>
        <input type="password" name="password" id="pwd" class="form-control" onblur="valPwd()" placeholder="请输入密码">
        <span id="span2"></span>
      </div>
      <button class="btn" id="loginBtn" type="submit">登录</button>
</div>
  </form>
</div>


<script>
  // 登录验证

  function valYhm(){
    var userName=$("#userName").val();
    if (userName==""||userName==null) {
      $("#span1").text("用户名不能为空");
    }
  }
  function valPwd(){
    var pwd=$("#pwd").val();
    if (pwd == "" || pwd == null) {
      $("#span2").text("密码不能为空");
    }
    if(pwd.length<6 || pwd.length >15){
      $("#span2").text("密码长度须在6--15位之间");
    }
  }

</script>
</body>
</html>

