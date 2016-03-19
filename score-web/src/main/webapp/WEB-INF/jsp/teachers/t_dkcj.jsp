<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/teach_index.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
  <script src="../javaScript/jquery.page.js"></script>
</head>

<body>
<div class="tea_con">

  <div class="col-md-8">
    <!-- <p class="rate">成绩及格率:</p>-->
    <div class="panel panel-success">
      <table class="table table-bordered">
        <thead>
        <tr class="btn-info" style="height:46px">
          <th>学号</th>
          <th>姓名</th>
          <th>成绩</th>
          <th>班级排名</th>
          <th>进步情况</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>100</td>
          <td></td>
          <td>100</td>
          <td>100</td>
          <td>100</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div><div style="clear:both"></div>
  <div class="tcdPageCode">
    <!--<a href="javascript:;" class="prevPage">上一页</a>
    <a href="javascript:;" class="tcdNumber">1</a>
    <a href="javascript:;" class="tcdNumber">2</a>
    <a href="javascript:;" class="tcdNumber">3</a>
    <a href="javascript:;" class="tcdNumber">4</a>
    <a href="javascript:;" class="tcdNumber">5</a>
    <a href="javascript:;" class="nextPage">下一页</a>
    -->
  </div>
</div>
<script>
  $(".tcdPageCode").createPage({
    pageCount:6,
    current:1,
    backFn:function(p){
      console.log(p);
    }
  });

</script>
</body>
</html>
