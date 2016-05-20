<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/2
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>以前的成绩</title>
  <link rel="stylesheet" href="../css/stu_index.css">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
</head>
<body>
<div style="height:60px;"></div>
    <!--成绩-->

    <div id="score_before">
      <div class="col-sm-8" style="margin-bottom:30px">
        <a href="/student/getNowScore?id=${msStudent.id}"> <button class="btn btn-warning">本学期成绩</button></a>
        <button class="btn btn-default">所有成绩</button>
      </div>
      <div class="col-sm-9">
        <div class="score_info" style="width:720px;">
          <table class="table table-bordered">
            <thead>
            <tr class="btn-info" style="height:46px">
              <th>学期</th>
              <th>数学</th>
              <th>语文</th>
              <th>英语</th>
              <th>物理</th>
              <th>化学</th>
              <th>生物</th>
              <th>政治</th>
              <th>地理</th>
              <th>历史</th>
              <th>基本能力</th>
              <th>总成绩</th>
            </tr>
            </thead>
            <tbody>
<c:forEach items="${requestScope.scores}" var="s">
            <tr>
              <td>${s.grade}</td>
              <td>${s.math}</td>
              <td>${s.chinese}</td>
              <td>${s.english}</td>
              <td>${s.physico}</td>
              <td>${s.chemical}</td>
              <td>${s.biology}</td>
              <td>${s.political}</td>
              <td>${s.geography}</td>
              <td>${s.history}</td>
              <td>${s.basicCompetencies}</td>
              <td>${s.allScore}</td>
            </tr>
  </c:forEach>
            </tbody>
          </table>

        </div>
      </div>
    </div>
    <!--成绩-->
</body>
</html>
