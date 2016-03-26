<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 18:46
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

<div class="tea_con">
  <div class="col-md-8">
    <div class="panel panel-success">
      <table class="table table-bordered">
        <thead>
        <tr class="btn-info" style="height:46px">

          <th>编号</th>
          <th>姓名</th>
          <th>性别</th>
          <th>教育程度</th>
          <th>职务</th>
          <th>部门</th>
          <th>政治面貌</th>
          <th>籍贯</th>
          <th>身份证号</th>

        </tr>
        </thead>
        <tbody>
        <tr>
          <td>${msTeacher.id}</td>
          <td>${msTeacher.name}</td>
          <td>${msTeacher.sex}</td>
          <td>${msTeacher.education}</td>
          <td>${msTeacher.title}</td>
          <td>${msTeacher.department}</td>
          <td>${msTeacher.email}</td>
          <td>${msTeacher.politicalLandscape}</td>
          <td>${msTeacher.birthPlace}</td>
          <td>${msTeacher.idCard}</td>
        </tr>
        </tbody>

      </table>
    </div>
  </div>
</div>
</body>
</html>
