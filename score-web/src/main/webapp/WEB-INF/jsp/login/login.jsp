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
  <link rel="stylesheet" href="../css/bootstrap.css">
  <link rel="stylesheet" href="../css/login.css">
</head>


<body>
<div class="container">

  <form class="form-signin">
    <div class="denglu_top">用户登录</div>

    <div class="form-group">
      <label >用户名</label>
      <input type="text" name="username" class="form-control"  placeholder="请输入用户名" >
    </div>
    <div class="form-group">
      <label >密码</label>
      <input type="password" name="password" class="form-control" placeholder="请输入密码" >
    </div>
        <span class="form-group denglu_sel" >
           <select class="form-control">
             <option>教师</option>
             <option>学生</option>
             <option>管理员</option>
           </select>
       </span>

    <div style="clear:both"></div>
    <button class="btn  btn-success btn-lg btn-block" type="submit">登录</button>
  </form>

</div>



</body>
</html>
