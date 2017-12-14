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
	
	 
	
    	function updateI(){
    		var serverId=$("#serverId").val();
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/rolesearch/updateItem?serverId="+serverId,
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
                    alert("修改道具信息失败，请重试");
                } 
    		});
    	}
    	
    	
    	
    </script>

  
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="道具基本信息">
      <input id="serverId"  name="" type="hidden" style="width: 120px;" value="${serverId}" class="search_txt"  />               	
      
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>uid：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="id" disabled="disabled" value="${t.uid }">
                             <input type="hidden" class="form-text" id="txtdeptname" name="id" value="${t.uid }">
                        </td>
                    </tr>
                   
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>ItemID：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="itemId" disabled="disabled" value="${t.itemId }"/>
                            <input type="hidden" class="form-text" id="txtdeptname" name="tid" value="${t.itemId }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>num：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="num"  value="${t.num }"/>
                        </td>
                    </tr>
                    

                    

            </table>




            </div>
        </div>
    </div>
</form>	
</body>
</html>