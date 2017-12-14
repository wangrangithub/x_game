<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/back/comm.css" />
    <script type="text/javascript" src="<%=path%>/thirdparts/time-text/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
    <script type="text/javascript" src="<%=path%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="<%=path%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/back/table-ghhs.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/jquery.form.js"></script>
    <script type="text/javascript" src="<%=path%>/resources/js/calendar.js"></script>
	<script type="text/javascript">
    	function change(){
    		var sort =$("#sort").val();
    		
			if(isNaN(Number(sort))){
				
				alert('请输入数字！');
				return false;
			} 
    		
    		
    		$("#formupdate").ajaxSubmit({
    			
    			url:"<%= request.getContextPath()%>/activity/update",
    			type:"post",
    			resetForm:false,
    			success:function(data){
    				if(data=="ok"){
    					//获取父窗口的window对象
    					var win = art.dialog.open.origin;  
    					//调用父窗口的js方法refresh();
    					win.refresh();
    					//关闭对话框
    					art.dialog.close();
    				}else{
    					alert(data);
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("修改失败，请重试");
                } 
    		});
    	}

    	function edit(){
   		 
    		$("#formupdate").ajaxSubmit({
    			
    			url:"<%= request.getContextPath()%>/activity/update",
    			type:"post",
    			data:  $('#formadd').serialize(),
 				dataType: "json",
    			resetForm:false,
    			success:function(data){
    				if(data=="ok"){
    					
    					alert("修改成功！");
    					window.location="<%= request.getContextPath()%>/activity/activityList"
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("修改失败，请重试");
                } 
    		});
		}	
    	
    	
    	function goBack(){
   		 window.location="<%= request.getContextPath()%>/activity/activityList"		    		 
   		 }
    	</script>
    
</head>
<body>
<form id="formupdate"<%-- method="post" action="<%= request.getContextPath()%>/activity/update" --%>>
	<input type="hidden" name="actId" value="${activity.actId}" />
	<div class="easyui-tabs" style="width: 100%;">
        <div title="活动基本信息">
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动类型名称：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="actName" value="${activity.actName }"/>
                            <form:errors path="*"></form:errors>
                        </td>
                    </tr>
                     
                    
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>排序：</td>
                        <td class="white-tr">
                            <input type="text" class="" id="sort" name="actSort" value="${activity.actSort }"/>只能为数字
                        </td>
                    </tr>
                           
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>热门状态：</td>
                        <td class="white-tr">
                         	<input type="radio" <c:if test="${activity.actHotStatus==0}">checked="checked"</c:if>  class="" id="txtdeptname" name="actHotStatus" value="0"/>无
                            <input type="radio" <c:if test="${activity.actHotStatus==1}">checked="checked"</c:if>  class="" id="txtdeptname" name="actHotStatus" value="1"/>热销
                            <input type="radio" <c:if test="${activity.actHotStatus==2}">checked="checked"</c:if> class="" id="txtdeptname" name="actHotStatus" value="2"/>限时
                            <input type="radio" <c:if test="${activity.actHotStatus==3}">checked="checked"</c:if> class="" id="txtdeptname" name="actHotStatus" value="3"/>新
                            <input type="radio" <c:if test="${activity.actHotStatus==4}">checked="checked"</c:if> class="" id="txtdeptname" name="actHotStatus" value="4"/>推荐
                        </td>
                    </tr>    
                                                    
                </table>
            </div>
        </div>
    </div>
    <br/><br/><input type="button" onclick="edit();" class="search_bt commbtn" value="修改" >
    <input type="button" onclick="goBack();" class="search_bt commbtn" value="返回" >
    <!--  <input type="submit"  class="search_bt commbtn" value="修改" />  -->
</form>	
</body>
</html>