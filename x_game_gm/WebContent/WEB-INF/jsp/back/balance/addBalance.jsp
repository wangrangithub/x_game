<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/back/comm.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/time-text/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/demo/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/My97DatePicker/WdatePicker.js" language="javascript"></script>
	<script type="text/javascript">
	
	 
	
    	function AddBuff(){
    		if ($('select[name="serverId"]').val() == '-1')
            {
                alert('请选择服!');
                return false;
            }
    		
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/balance/addBuff",
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
                    alert("新增buff失败，请重试");
                } 
    		});
    	}
    	
    	
    	
    </script>

   
    
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="全局buff基本信息">
      
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                
                	<tr>
                        <td width="100px"><span class="font01 pr5">*</span>选择服：</td>
                        <td class="white-tr">
                          <select class="select_gallery" name="serverId" style="width: 150px;">  
				            <optgroup label="服信息">  
								<option value="-1" >请选择</option>
							<c:forEach items="${serverList}" var="server">
								
								<option value="${server.sid }"  <c:if test="${param.serverId==server.sid }">selected="selected"</c:if>>${server.name }</option>
							
							</c:forEach>
  
				            </optgroup>  
				              
				        </select> 
                        </td>
                    </tr>
                   
                    <tr>
                        <td width="50px"><span class="font01 pr5">*</span>效果说明：</td>
                       
                        <td class="white-tr">
                           <!--  <input type="text" class="form-text" id="txtdeptname" name="effectID" /> -->
                           
                           <select class="select_gallery" name="effectID" style="width:250px;">  
				            <optgroup label="buff效果信息">  
								<option value="-1" >请选择</option>
							<c:forEach items="${effectMap}" var="effect">
								
								<option value="${effect.key }"  <c:if test="${param.key==effect.key }">selected="selected"</c:if>>${effect.value }</option>
							
							</c:forEach>
  
				            </optgroup>  
				              
				        </select> 
                        </td>
                    </tr>
                    <tr>
                        <td width="50px"><span class="font01 pr5">*</span>开始时间：</td>
                        <td class="">
                            <input type="text" id="txtdeptname" name="startTimes"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  maxlength="100" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td width="50px"><span class="font01 pr5">*</span>结束时间：</td>
                        <td class="">
                            <input type="text"  id="txtdeptname" name="endTimes" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  maxlength="100" required="true" />
                        </td>
                    </tr>
                    <!-- <tr>
                        <td width="100px"><span class="font01 pr5">*</span>效果说明：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="details" />
                        </td>
                    </tr> -->
                   <!-- <tr>
                        <td width="100px"><span class="font01 pr5">*</span>状态：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="state" />
                        </td>
                    </tr> -->



					 <tr>
                        <td width="50px"><span class="font01 pr5">*</span>全局buff或者个人buff：</td>
                        <td class="white-tr">
                            <input type="radio" class="" id="txtdeptname" name="type" value="1"/>全局buff
                            <input type="radio" class="" id="txtdeptname" name="type" value="2"/>个人buff
                        </td>
                    </tr>
                 	 <tr>
                        <td width="50px"><span class="font01 pr5">*</span>是否推送：</td>
                        <td class="white-tr">
                            <input type="radio" class="" id="txtdeptname" name=hasPush value="1"/>推送
                            <input type="radio" class="" id="txtdeptname" name="hasPush" value="0"/>不推送
                        </td>
                    </tr>
                 	
            </table>




            </div>
        </div>
    </div>
</form>	
</body>
</html>