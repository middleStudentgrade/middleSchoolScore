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
    <title>学生基本信息</title>
  <link rel="stylesheet" href="../css/stu_index.css">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
</head>
<body>
<div style="height:60px;"></div>
    <!--个人信息-->
    <div id="stu_info">
      <div class="col-sm-8">
        <div class="panel panel-success">
          <div class="panel-heading">
            <h3 class="panel-title" style="font-size:18px;">学生信息</h3>
          </div>
          <div class="panel-body">
            <div class="col-md-12">
              <table class="table ">
                <tr >
                  <td> 学号：</td>
                  <td>${msStudent.id }</td>
                  <td>姓名：</td>
                  <td>${msStudent.name}</td>
                </tr>
                <tr>
                  <td>性别：</td>
                  <td>${msStudent.sex}</td>
                  <td>政治面貌：</td>
                  <td>${msStudent.politicalLandscape}</td>
                </tr>
                <tr>
                  <td>年级：</td>
                  <td>${msClass.name}</td>
                  <td>身份证号：</td>
                  <td>${msStudent.idCard}</td>
                </tr>

                <tr>
                  <td>班级：</td>
                  <td>${msClass.grade}班</td>
                  <td>籍贯：</td>
                  <td>${msStudent.birthPlace}</td>
                </tr>
              </table>
            </div>

          </div>
        </div>
      </div>

    </div>
    <!--个人信息-->

</body>
</html>
