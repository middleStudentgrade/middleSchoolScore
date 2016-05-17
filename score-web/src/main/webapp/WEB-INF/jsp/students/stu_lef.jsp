<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/5/13
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="css/stu_index.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="javaScript/jquery.js"></script>
  <script src="javaScript/bootstrap.min.js"></script>
</head>
<body>
<div style="height:60px;"></div>
<ul class="list-group" id="stu_menu">
  <li ><a href="stuInfo" class="list-group-item" target="main" id="xinxi">个人信息</a></li>
  <li ><a href="stuGmm" class="list-group-item" target="main" id="changePassword">修改密码</a></li>
  <li ><a href="student/getNowScore?id=${msStudent.id}" class="list-group-item" target="main" id="myScore">我的成绩</a></li>
  <li ><a href="retLogin" target="_blank" class="list-group-item">退出登录</a></li>

</ul>
</body>
</html>
