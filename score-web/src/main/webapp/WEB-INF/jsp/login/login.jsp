<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/login.css">
</head>


<body>
<div class="container">

  <form class="form-signin" action="/login" method="post">
    <div class="denglu_top">用户登录</div>

    <div class="form-group">
      <label >用户名</label>
      <input type="text" name="userName" class="form-control"  placeholder="请输入用户名" >
      <%--<form:errors path="userName" style="color:red"></form:errors><br/>--%>
    </div>
    <div class="form-group">
      <label >密码</label>
      <input type="password" name="password" class="form-control" placeholder="请输入密码" >
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



</body>
</html>
