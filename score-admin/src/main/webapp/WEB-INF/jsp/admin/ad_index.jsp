<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

<body style="margin:0;padding:0;">
<iframe src="/adTop" width=100% height=160 name="top" frameborder=0 scrolling="no"></iframe>
<iframe src="/adLeft" width=24% align=left height=600 name="left" frameborder=0 scrolling="no"></iframe>
<iframe src="/adSinfo" width=76% align=right height=1000 name="main" frameborder=0 scrolling="no"></iframe>

</body>
</html>
