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
<div class="tea_con" style="padding-top:0;padding-left:0;">
  <p id="mbx">现在的位置：<a href="teach_info.jsp" target="main">首页</a>><span id="m_menu"></span></p>

  <ul class="list-group" id="tea_menu">
    <li class="list-group-item t_lc">教师信息</li>
    <li><a href="teach_info.jsp" class="list-group-item ejcd" target="main" id="xinxi">个人信息</a></li>
    <li><a href="../students/stu_gmm.jsp" class="list-group-item ejcd" target="main" id="gmm">修改密码</a></li>
    <li class="list-group-item t_lc" style="border-radius:4px;">学生成绩</li>
    <li><a href="t_dkcj.jsp" class="list-group-item ejcd" target="main" id="t_cj">成绩及排名</a></li>
    <li><a href="t_jige.jsp" class="list-group-item ejcd" target="main" id="t_cjfb">成绩分布</a></li>
    <li><a href="t_lucj.jsp" class="list-group-item ejcd" target="main" id="t_lcj">录入成绩</a></li>
    <a href="../login/login.jsp" target="_blank" style="font-size:16px"><li>退出登录</li></a>
  </ul>

</div>
<script>
  $("#xinxi").click(function(){
    $("#m_menu").html($(this).html());
    $("#xinxi").addClass("djxg");
    $("#gmm").removeClass("djxg");$("#t_cj").removeClass("djxg");
    $("#t_cjfb").removeClass("djxg");$("#t_lcj").removeClass("djxg");
  });
  $("#gmm").click(function(){
    $("#m_menu").html($(this).html());
    $("#gmm").addClass("djxg");
    $("#xinxi").removeClass("djxg");$("#t_cj").removeClass("djxg");
    $("#t_cjfb").removeClass("djxg");$("#t_lcj").removeClass("djxg");
  });
  $("#t_cj").click(function(){
    $("#m_menu").html($(this).html());
    $("#t_cj").addClass("djxg");
    $("#xinxi").removeClass("djxg");$("#gmm").removeClass("djxg");
    $("#t_cjfb").removeClass("djxg");$("#t_lcj").removeClass("djxg");
  });
  $("#t_cjfb").click(function(){
    $("#m_menu").html($(this).html());
    $("#t_cjfb").addClass("djxg");
    $("#xinxi").removeClass("djxg");$("#t_cj").removeClass("djxg");
    $("#gmm").removeClass("djxg");$("#t_lcj").removeClass("djxg");
  });
  $("#t_lcj").click(function(){
    $("#m_menu").html($(this).html());
    $("#t_lcj").addClass("djxg");
    $("#xinxi").removeClass("djxg");$("#t_cj").removeClass("djxg");
    $("#t_cjfb").removeClass("djxg");$("#gmm").removeClass("djxg");
  });

</script>
</body>
</html>
