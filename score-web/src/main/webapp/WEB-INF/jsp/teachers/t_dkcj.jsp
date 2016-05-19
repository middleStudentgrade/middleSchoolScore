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
    <title>成绩排名和最高成绩</title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/teach_index.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
  <script src="../javaScript/jquery.page.js"></script>
  <script src="../javaScript/bootstrap-paginator.js"></script>
</head>
<style>
  #courseName{border:none;background:#fff;}
</style>
<body>

  <div id="tea_score" style="width:600px;">
    <!-- <p class="rate">成绩及格率:</p>-->
       <%-- <input id="teacherId" type="text" value="${msTeacher.id}" >--%>
        <input id="count" type="text" value="${count}"><br/>
        课程：
        <input  type="text" value="${courseName}" name="courseName" id="courseName">
        <div style="float:right">年级最高成绩：<input type="text" id="top" class="form-control"></div>
        <form:form action="/teacher/scoreSort" method="post">
            <input type="text" value="${msTeacher.id}" name="id" class="tea_id">
    <br/>   <select name="name" id="name">
                 <c:forEach var="item" items="${classNames}" varStatus="status">
                      <option value="${item.value}" <c:if test="${name==item.value}">selected</c:if>>${item.value}</option>
                </c:forEach>
             </select>
             <button type="submit" class="btn btn-warning selectScore">本班成绩查询</button>
             <div style="float: right">平均成绩：<input type="text" id="avg" class="form-control"></div>
        </form:form>
      <div style="margin:20px 0">
      </div>
 <div>
   <table class="table table-bordered">
       <tr class="btn-info" style="height:46px">
          <th>学号</th>
          <th>姓名</th>
          <th>成绩</th>
          <th>班级排名</th>
        </tr>
        <tbody id="list">
        </tbody>
    </table>
   </div>
  <div class="tcdPageCode"></div>
 </div>
<script>
  $(document).ready(function(){
    $.ajax({
      url: "http://localhost:8081/teacher/scoreSelect",
      data: {
        name:$("#name").val(),
        course:$("#courseName").val(),
      },
      type: 'POST',
      success: function (data) {
        if (data != null) {
          $("#avg").val(data.data.avg);
          $("#top").val(data.data.top);
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
        url: "http://localhost:8081/teacher/scoreSelect",
        data: {
          name:$("#name").val(),
          course:$("#courseName").val(),
          offset:p
        },
        type: 'POST',
        success: function (data) {
          if (data != null) {
            $("#avg").val(data.data.avg);
            $("#top").val(data.data.top);
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
