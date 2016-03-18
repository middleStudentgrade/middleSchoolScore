<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/2
  Time: 20:10
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
<div id="con" >
  <div id="s_con">

    <!--修改密码-->
    <div id="stu_mm"  class="container">
      <div class="col-sm-5">
        <div class="panel panel-info">
          <div class="panel-heading">
            <h3 class="panel-title">修改密码</h3>
          </div>
          <div class="panel-body">
            <form class="form-signin" style="width:230px;margin:0 auto">


              <div class="form-group">
                <label >原密码</label>
                <input type="text" name="username" class="form-control"  placeholder="请输入原密码" >
              </div>
              <div class="form-group">
                <label >新密码</label>
                <input type="password" name="password" class="form-control" placeholder="请输入新密码" >
              </div>
              <div class="form-group">
                <label >确认密码</label>
                <input type="password" name="password" class="form-control" placeholder="确认输入密码" >
              </div>

              <button class="btn btn-info" type="submit">确认</button>
              <button class="btn" type="reset" style="float:right">取消</button>
            </form>


          </div>
        </div>
      </div>

    </div>
    <!--个人信息-->

  </div>
</div>
</body>
</html>
