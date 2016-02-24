<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/2/21
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/login.css">
</head>


<body>
<div class="login_bg">
  <div class="login_con" >
    <form >
      <div class="ln_yh">
        <label >用户名1：</label>
        <input type="email" class="form-control" id="" placeholder="请输入您的用户名"> <br/>

        <label>密   码：</label>
        <input  class="form-control" type="password" id="exampleInputPassword1" placeholder="请输入您的密码">
      </div>
      <div class="checkbox">
        <label>
          <input type="checkbox"> 记住密码
        </label>
        <a href=" "><label style="float:right;color:#c3493c">忘记密码？</label></a>
      </div>
      <button type="submit" class="btn  btn-success" >登录</button>
      <a href="" style="padding-left:16px;">没有账号？去注册</a>
    </form>
  </div>

</div>
</body>
</html>
