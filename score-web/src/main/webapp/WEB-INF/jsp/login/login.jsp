<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/login.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
  <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
</head>


<body>
<div class="container">

  <form class="form-signin" action="/login" method="post">
    <div class="denglu_top">用户登录</div>
    <div class="form-group">
      <label >用户名</label>
      <input type="text" name="userName" id="userName" class="form-control" onblur="valYhm()"  placeholder="请输入用户名">
      <span id="span1"></span>
    <%--<form:errors path="userName" style="color:red"></form:errors><br/>--%>
    </div>
    <div class="form-group">
      <label >密码</label>
      <input type="password" name="password" id="pwd" class="form-control" onblur="valPwd()" placeholder="请输入密码">
      <span id="span2"></span>
    <%--  <form:errors path="password" style="color:red"></form:errors><br/>--%>
    </div>
        <span  class="form-group denglu_sel" >
           <select name="type" class="form-control">
             <option value="2">教师</option>
             <option value="1">学生</option>
           </select>
       </span>

    <div style="clear:both"></div>
    <button class="btn  btn-success btn-lg btn-block" type="submit">登录</button>
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
