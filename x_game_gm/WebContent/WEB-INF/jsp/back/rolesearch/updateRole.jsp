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
	
	 
	
    	function updateRole(){
    		var serverId=$("#serverId").val();
    		$("#formadd").ajaxSubmit({
    			
    			url:"<%= request.getContextPath()%>/rolesearch/updateRole?serverId="+serverId,
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
                    alert("修改角色信息失败，请重试");
                } 
    		});
    	}
    	
    	
    	
    </script>

  
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="角色基本信息">
      <input id="serverId"  name="" type="hidden" style="width: 120px;" value="${serverId}" class="search_txt"  />               	
                 
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>uid：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="uid" disabled="disabled" value="${role.uid }">
                        </td>
                    </tr>
                   
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>openId：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="openId" disabled="disabled" value="${role.openId }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>name：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="name" disabled="disabled" value="${role.name }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>等级：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="level" disabled="disabled" value="${role.level }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>充值：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="money" disabled="disabled" value="${role.money }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>钻石：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="diamond" value="${role.diamond }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>金币：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="gold" value="${role.gold }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>精力：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="vigour" value="${role.vigour }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>水：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="water" value="${role.water }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>食物：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="food" value="${role.food }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>弹药：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="bullet" value="${role.bullet }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>药品：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="medicine" value="${role.medicine }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>荣誉点：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="honor" value="${role.honor }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>经验：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="exp" value="${role.exp }"/>
                        </td>
                    </tr>
                   

            </table>




            </div>
        </div>
    </div>
</form>	
</body>
</html>