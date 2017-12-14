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
	
	 
	
    	function Addcd(){
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/Cdk/addCdk",
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
                    alert("新增cdk失败，请重试");
                } 
    		});
    	}
    	
    	
    	
    </script>

   
    
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="cdk基本信息">
      
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                
                	<%-- <tr>
                        <td width="100px"><span class="font01 pr5">*</span>选择服：</td>
                        <td class="white-tr">
                            <select class="select_gallery" name="serverId" style="width: 150px;">  
				            <optgroup label="服信息">  
								
							<c:forEach items="${serverList}" var="server">
								
								<option value="${server.sid }" >${server.name }</option>
							
							</c:forEach>
  
				            </optgroup>  
				              
				        </select> 
                        </td>
                    </tr> --%>
                
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>描述说明：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="desc" />
                        </td>
                    </tr>
                   
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>当批数量：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="num" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>开始时间：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="starttime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  maxlength="100" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>结束时间：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="endtime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  maxlength="100" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>奖励一：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="itemId1" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>奖励一数量：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="num1" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>奖励二：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="itemId2s" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>奖励二数量：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="num2s" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>奖励三：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="itemId3s" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>奖励三数量：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="num3s" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>奖励四：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="itemId4s" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>奖励四数量：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="num4s" />
                        </td>
                    </tr>
                 
            </table>




            </div>
        </div>
    </div>
</form>	
</body>
</html>