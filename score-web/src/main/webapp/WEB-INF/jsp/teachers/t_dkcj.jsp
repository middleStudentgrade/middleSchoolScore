<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/teach_index.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
  <script src="../javaScript/jquery.page.js"></script>
  <script src="../javaScript/bootstrap-paginator.js"></script>
</head>

<body>
<div class="tea_con">

  <div class="col-md-8">
    <!-- <p class="rate">成绩及格率:</p>-->
    <div class="panel panel-success">
      <table class="table table-bordered">
        <input id="teacherId" type="text" value="${msTeacher.id}" >
        <input id="count" type="text" value="${count}">
        <thead>
        <tr class="btn-info" style="height:46px">
          <th>学号</th>
          <th>姓名</th>
          <th>成绩</th>
          <th>班级排名</th>
        </tr>
        </thead>
        <tbody id="list">
        </tbody>
  </table>
      <div class="tcdPageCode"></div>
</div>
    </div>
  </div>
<script>
  $(document).ready(function(){
    $.ajax({
      url: "http://localhost:8080/teacher/scoreSelect",
      data: {
        id: $("#teacherId").val(),
      },
      type: 'POST',
      success: function (data) {
        if (data != null) {
          $("#list").empty();
          $.each(data.data.datas, function (index, item) {
            $("#list").append('<tr>');
            $("#list").append('<td>' + item.id + '</td>');
            $("#list").append('<td>' + item.name + '</td>');
            $("#list").append('<td>' + item.score + '</td>');
            $("#list").append('<td>' + item.ranking + '</td>');
            $("#list").append('</tr>');
          })
        }
      }})})
  $(".tcdPageCode").createPage({
    pageCount:$("#count").val(),
    current:1,
    backFn:function(p){
      $.ajax({
        url: "http://localhost:8080/teacher/scoreSelect",
        data: {
          id: $("#teacherId").val(),
          offset:p
        },
        type: 'POST',
        success: function (data) {
          if (data != null) {
            $("#list").empty();
            $.each(data.data.datas, function (index, item) {
              $("#list").append('<tr>');
              $("#list").append('<td>' + item.id + '</td>');
              $("#list").append('<td>' + item.name + '</td>');
              $("#list").append('<td>' + item.score + '</td>');
              $("#list").append('<td>' + item.ranking + '</td>');
              $("#list").append('</tr>');
            })
        }
  }})}});
</script>
</body>
</html>
