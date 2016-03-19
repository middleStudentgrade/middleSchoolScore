<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/teach_index.css">
  <link rel="stylesheet" href="../css/combo.select.css">
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/bootstrap.min.js"></script>
  <script src="../javaScript/jquery.combo.select.js"></script>
</head>

<body>
<div class="tea_con">
  <form>
    <label>选择年级：</label>
       <span class="lu_xz" >
           <select>
             <option>高一</option>
             <option>高二</option>
             <option>高三</option>

           </select>
       </span>
    <label>选择班级：</label>
       <span class="lu_xz">
           <select>
             <option></option>
             <option></option>
             <option></option>
           </select>
           </span>

  </form>
</div>
<script>
  $(function() {
    $('select').comboSelect();
  });
</script>
</body>
</html>

