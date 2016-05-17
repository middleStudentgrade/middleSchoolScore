<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/teach_index.css" />
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
</head>

<body>
<div style="height:60px"></div>

  <ul class="list-group" id="tea_menu">
    <li class="list-group-item t_lc">教师信息</li>
    <li><a href="teachInfo" class="list-group-item ejcd" target="main">个人信息</a></li>
    <li><a href="teachGmm" class="list-group-item ejcd" target="main">修改密码</a></li>
    <li class="list-group-item t_lc" style="border-radius:4px;">学生成绩</li>
    <li><a href="teacher/scoreSort?id=${msTeacher.id}" class="list-group-item ejcd" target="main">成绩及排名</a></li>
    <li><a href="teacher/passRate?id=${msTeacher.id}" class="list-group-item ejcd" target="main">成绩分布</a></li>
    <li><a href="retLogin" target="_blank" class="list-group-item ejcd">退出登录</a></li>
  </ul>

<script>
</script>
</body>
</html>
