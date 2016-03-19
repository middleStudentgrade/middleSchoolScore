<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/3/19
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/teach_index.css" />
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/Chart.js"></script>

</head>

<body>
<div class="tea_con" style="padding-left:100px">
  <div class="tea_sm">
    <button class="btn btn1">90分以上</button><span></span>
    <button class="btn btn2"> 75~90</button>
    <button class="btn btn3"> 60~75</button>
    <button class="btn btn4">60分以下 </button>
  </div>
  <canvas id="myChart" width="300" height="300"></canvas>
</div>


<script>
  window.onload = function(){
    var ctx = document.getElementById("myChart").getContext("2d");
    window.myPie = new Chart(ctx).Pie(Data);
  };
  /*var ctx = $("#myChart").get(0).getContext("2d");

   var myNewChart = new Chart(ctx);
   new Chart(ctx).Pie(data,options);*/
  var Data = [
    {
      value : 60,
      color : "#aec978"
    },
    {
      value : 50,
      color : "#E0E4CC"
    },
    {
      value: 30,
      color:"#e9c75c"
    },

    {
      value:20,
      color:"#A8B3C5"
    }
  ]
</script>
</body>
</html>

