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
    <title>教师信息</title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/teach_index.css" />
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
</head>

<body>
<div id="tea_info">
    <div class="panel panel-success" style="width:650px;">
      <div class="panel-heading">
        <h3 class="panel-title">教师信息</h3>
      </div>
      <div class="panel-body">
        <div class="col-md-12">
          <table class="table ">
            <tr >
              <td> 编号：</td>
              <td>${msTeacher.id}</td>
              <td>姓名：</td>
              <td>${msTeacher.name}</td>
            </tr>
            <tr>
              <td>性别：</td>
              <td>${msTeacher.sex}</td>
              <td>学历：</td>
              <td>${msTeacher.education}</td>
            </tr>
            <tr>
              <td>年龄：</td>
              <td>${msTeacher.age}</td>
              <td>政治面貌：</td>
              <td>${msTeacher.politicalLandscape}</td>
            </tr>
            <tr>
              <td>职务：</td>
              <td>${msTeacher.title}</td>
              <td>身份证号：</td>
              <td>${msTeacher.idCard}</td>
            </tr>
            <tr>
              <td>部门：</td>
              <td>${msTeacher.department}</td>
              <td>邮箱：</td>
              <td>${msTeacher.email}</td>
            </tr>
            <tr>
              <td>籍贯：</td>
              <td>${msTeacher.birthPlace}</td>
            </tr>
          </table>
        </div>

      </div>
    </div>
  </div>

<!--个人信息-->

</body>
</html>
