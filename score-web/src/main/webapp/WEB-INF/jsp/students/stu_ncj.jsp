<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/2
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="../css/stu_index.css">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
</head>
<body>
<div id="con">
  <div id="s_con">
    <!--成绩-->

    <div id="stu_ncj" class="container">
      <div class="col-sm-8" style="margin-bottom:20px">
        <button class="btn btn-info" style="border-radius:20px">本学期成绩</button>
        <a href="/student/getAllScore?id=${msStudent.id}" target="main"><button class="btn btn-warning">所有成绩</button></a>
      </div>
      <div class="col-sm-8">
        <div class="panel panel-success" style="border-color: #d6e9c6;">

          <table class="table table-bordered" style="height:90px">
            <thead>
            <tr class="success" style="height:46px">

              <th>数学</th>
              <th>语文</th>
              <th>英语</th>
              <th>物理</th>
              <th>化学</th>
              <th>生物</th>
              <th>政治</th>
              <th>地理</th>
              <th>历史</th>
              <th style="color:#C66">班级排名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>${nowScore.math}</td>
              <td>${nowScore.chinese}</td>
              <td>${nowScore.english}</td>
              <td>${nowScore.physico}</td>
              <td>${nowScore.chemical}</td>
              <td>${nowScore.biology}</td>
              <td>${nowScore.physico}</td>
              <td>${nowScore.geography}</td>
              <td>${nowScore.history}</td>
              <td>${ranking}</td>
            </tr>
            </tbody>
          </table>

        </div>
      </div>
    </div>
    <!--成绩-->
  </div>
</div>
</body>
</html>
