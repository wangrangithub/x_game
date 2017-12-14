<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">		
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

	<!--CSS 样式 -->

	<style>
		  body{
			background:url(<%=path %>/images/111.jpg) top left no-repeat;
			background-size:cover;
		  }
	</style>	
	
	
	<link href="<%=path %>/resources/css/charisma-app.css" rel="stylesheet">
	<link id="bs-css" href="<%=path %>/resources/css/bootstrap-cerulean.min.css" rel="stylesheet">
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- JS库 -->
	
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
    

    <script type="text/javascript">
	    function reloadcode() {  
	        var verify = document.getElementById('safeCode');  
	        /*Math.random()点击验证码图片随机生成  */  
	       	verify.setAttribute('src', 'makePicture.jsp?it=' + Math.random());
	        return false; 
	    } 
    	$(function(){
    		$("#faildiv").hide();
    		var fail =$("#fail").val();
			if(fail!=null&&fail!=""){
				
				$("#faildiv").show();
			}
			$("#faildivyzm").hide();
    		var fail =$("#fail").val();
			if(fail!=null&&fail!=""){
				
				$("#faildivyzm").show();
			}
    		
    	})	
    
		/* alert("时间太久了，请重新登录！"); */
      if (window != top)
	    top.location.href = location.href;	
	</script>
	

</head>

<body>
<div><img alt="" src=""></div>
<input type="hidden" name="" id="er" class="form-control" placeholder="" value="${er}">
<div class="ch-container">
    <div class="row">
        
    <div class="row" style="margin:50px;">
        <div class="col-md-12 center login-header">
            <h2>《陰屍之路》后台管理系统</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row" style="margin:100px;">
        <div class="well col-md-5 center login-box">
            <div class="alert alert-info">
               		请输入用户名,密码和验证码
            </div>
             <div id="faildiv" class="alert alert-info">
               		${fail}
            </div>
            
            <form class="form-horizontal" action="<%=request.getContextPath() %>/login.do" method="post">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" name="username" class="form-control" placeholder="用户名">
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input type="password" name="userpass" class="form-control" placeholder="密码">
                    </div><br>
					<!-- <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-check"></i></span>
                        <input type="password" name="safeCode" class="form-control" placeholder="验证码">
                        <span class="input-group-addon"> 
                        	<img src= "makePicture.jsp"  onclick="reloadcode();" id="safeCode" title="点击刷新验证码"   style="cursor:pointer">  
                        </span> 
                    </div> -->
					
                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" id="remember"> Remember me</label>
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">
                        <button type="submit" class="btn btn-primary">登录</button>
                    </p>
                </fieldset>
            </form>
             <input id="fail" type="hidden" name="" value="${fail}" style="width: 120px;"  class="search_txt"  />
		         
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

<!-- external javascript -->


</body>
</html>
