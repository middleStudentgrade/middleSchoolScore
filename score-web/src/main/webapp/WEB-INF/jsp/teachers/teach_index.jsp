<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 18:45
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
<!--<frameset rows="280,*" frameborder="0" scrolling="yes">
     <frame src="teach_top.html" name="top" scrolling="no"/>
     <frameset cols="450,*">
         <frame src="teach_left.html" name="left" scrolling="yes"/>
         <frame src="teach_main.html" name="main" scrolling="no"/>
      </frameset>
  </frameset><noframes></noframes>-->
<iframe src="teachTop" width=100% height=280 name="top" frameborder=0 scrolling="no"></iframe>
<iframe src="teachLeft" width=35% align=left height=600 name="left" frameborder=0 scrolling="no"></iframe>
<iframe src="teachInfo" width=65% align=right height=600 name="main" frameborder=0 scrolling="no"></iframe>
<body>

</body>
</html>
