<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/ad_index.css" />
    <link rel="stylesheet" href="../css/font-awesome.css" />
</head>

<body>
<div class="ad_top">
    <p>中学生成绩管理系统<br/>
        <em style="font-size:24px;">Middle School Students Achievement Management System</em><br/></p>
    <%--<form class="" role="search" target="main">
        <div class="form-group">
            <input type="text" class="form-control search" placeholder="查询学生成绩，请输入学生学号：">
            <button type="submit" class="fa"><span class="glyphicon glyphicon-search"></span></button></div>
    </form>--%>
<div style="float: right;margin-right:30px;"><c:if test="${msUser.type==0}">管理员</c:if>
    <c:if test="${msUser.type==1}">${classMaster}&nbsp;&nbsp;班主任</c:if>
    </div>
</div>

</body>
</html>
