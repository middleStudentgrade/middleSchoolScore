<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <title>成绩分布</title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/teach_index.css" />
  <script src="../javaScript/jquery.js"></script>
  <script src="../javaScript/Chart.js"></script>

</head>

<body>
<div id="tea_pie" style="width:534px;">
  <form:form action="/teacher/passRate" method="post">
      <input type="text" name="id" value="${msTeacher.id}" style="display:none" >
    <input  type="text" value="${courseName}" name="courseName" class="courseName">成绩段分布情况
    <div style="float:right;margin-right:30px;">
        <select name="className" id="className">
        <c:forEach var="item" items="${classNames}" varStatus="status">
           <option value="${item.value}" <c:if test="${name==item.value}">selected</c:if>>${item.value}</option>
         </c:forEach>
        </select>
        <button type="submit" class="btn btn-warning selectScore">本班成绩查询</button>
    </div>
  </form:form>
  <div class="tea_sm">
    <c:if test="${courseName=='语文'||courseName=='数学'||courseName=='英语'}">
      <button class="btn btn1">135分以上</button><span></span>
      <button class="btn btn2"> 112.5~135</button>
      <button class="btn btn3"> 90~112.5</button>
      <button class="btn btn4" style="margin-right:0;">90分以下 </button>
    </c:if>
<c:if test="${courseName=='政治'||courseName=='历史'||courseName=='物理'||courseName=='地理'||courseName=='生物'||courseName=='化学'||courseName=='基本能力'}">
    <button class="btn btn1">90分以上</button><span></span>
    <button class="btn btn2"> 75~90</button>
    <button class="btn btn3"> 60~75</button>
    <button class="btn btn4" style="margin-right:0;">60分以下 </button>
  </c:if>
  </div>
  <canvas id="myChart" width="500" height="240"></canvas>
  <p id="rate1">${passNum[0]}</p>
  <p id="rate2">${passNum[1]}</p>
  <p id="rate3">${passNum[2]}</p>
  <p id="rate4">${passNum[3]}</p>
</div>


<script>
  window.onload = function(){
    var ctx1 = document.getElementById("myChart").getContext("2d");
//    window.myPie = new Chart(ctx).Pie(Data);
    var data1 = {
      labels: [<c:if test="${courseName=='语文'||courseName=='数学'||courseName=='英语'}">
             "135分以上","112.5~135","90~112.5","90分以下"
              </c:if>
              <c:if test="${courseName=='政治'||courseName=='历史'||courseName=='物理'||courseName=='地理'||courseName=='生物'||courseName=='化学'||courseName=='基本能力'}">
              "90分以上","75~90","60~75","60分以下"
              </c:if>],
      datasets: [
        {
          fillColor: ["#aec978","#E0E4CC","#e9c75c","#A8B3C5",],
          strokeColor: "#bfbfbf",
          data: [rate1,rate2,rate3,rate4],
        },
      ]
    }
    window.myPie = new Chart(ctx1).Bar(data1);

  };
  var rate1=$("#rate1").html();
  var rate2=$("#rate2").html();
  var rate3=$("#rate3").html();
  var rate4=$("#rate4").html();
console.log(rate4);

  /*var Data = [
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
  ]*/
</script>
</body>
</html>

