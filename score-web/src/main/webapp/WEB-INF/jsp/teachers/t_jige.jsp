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
  <p id="rate1">${passNum[0]}</p>
  <p id="rate2">${passNum[1]}</p>
  <p id="rate3">${passNum[2]}</p>
  <p id="rate4">${passNum[3]}</p>
</div>


<script>
  window.onload = function(){
    var ctx = document.getElementById("myChart").getContext("2d");
    window.myPie = new Chart(ctx).Pie(Data);
  };
  var rate1=$("#rate1").html();
  var rate2=$("#rate2").html();
  var rate3=$("#rate3").html();
  var rate4=$("#rate4").html();
console.log(rate4);
  var Data = [
    {
      value : rate1,
      color : "#aec978"
    },
    {
      value : rate2,
      color : "#E0E4CC"
    },
    {
      value: rate3,
      color:"#e9c75c"
    },

    {
      value:rate4,
      color:"#A8B3C5"
    }
  ]
</script>
</body>
</html>

