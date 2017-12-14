<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-1.10.2.js"></script>
	

<script type="text/javascript">

<%-- 	function start(){
		
		 var time = document.getElementById("msgbox").innerHTML;
		
		time = parseInt(time) - 1;
		
		if(time<1){ 
			window.location="<%= request.getContextPath()%>/login.do";
		 }else{
			document.getElementById("msgbox").innerHTML=time;
			setTimeout(start, 1000);
		} 
		
	} --%>
	
	//页面初始化
	$(function(){
		alert("时间太久了，请重新登录！");
		window.location="<%= request.getContextPath()%>/login.do";
		
	})

</script>

</head>
<body> <!-- onload="setTimeout(start, 1000);" -->

	<h1>对不起，登录后方可继续</h1>
	
	<div style="width:500px;margin:100px auto;font-size:40px;"><span id="msgbox" style="color:#e73839;">1</span>秒后自动跳转.....</div>

</body>
</html>