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
	
	 
	
    	function updateR(){
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/rolesearch/updateRune",
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
                    alert("修改符文信息失败，请重试");
                } 
    		});
    	}
    	
    	 function edit(id,hid,runeId,position){
    			/* alert(uid+","+heroId+","+$("#towerFloor"+heroId).val()); */
    			var serverId=$("#serverId").val();
    			$.ajax({
    					url: "<%= request.getContextPath()%>/rolesearch/updateRune",
    					type: "post",
    					data:{"id":id,"hid":hid,"runeId":runeId,"position":position,"serverId":serverId},
    					dataType: "json",
    					cache: false,
    					success: function(data) {
    						//window.location.href=url;
    						alert("成功");
    					},
    					error: function(data) {
    						//window.location.href=url;
    					}
    				}); 
    		 }
    	
    </script>

  
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="符文基本信息">
      <input id="serverId"  name="" type="hidden" style="width: 120px;" value="${serverId}" class="search_txt"  />               	
      
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>uid：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="id" disabled="disabled" value="${h.uid }">
                             <input type="hidden" class="form-text" id="txtdeptname" name="id" value="${h.uid }">
                        </td>
                    </tr>
                   
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>英雄Id：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="heroId" disabled="disabled" value="${h.heroId }"/>
                            <input type="hidden" class="form-text" id="txtdeptname" name="heroId" value="${h.heroId }"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>符文1：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="rune1Id"  value="${h.rune1Id }"/><br/><a  href="" onclick="edit('${h.uid}','${h.heroId}','${h.rune1Id}',1);">卸下符文</a>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>符文2：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="rune2Id"  value="${h.rune2Id }"/><br/><a  href="" onclick="edit('${h.uid}','${h.heroId}','${h.rune2Id}',2);">卸下符文</a>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>符文3：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="rune3Id"  value="${h.rune3Id }"/><br/><a  href="" onclick="edit('${h.uid}','${h.heroId}','${h.rune3Id}',3);">卸下符文</a>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>符文4：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="rune4Id"  value="${h.rune4Id }"/><br/><a  href="" onclick="edit('${h.uid}','${h.heroId}','${h.rune4Id}',4);">卸下符文</a>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>符文5：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="rune5Id"  value="${h.rune5Id }"/><br/><a  href="" onclick="edit('${h.uid}','${h.heroId}','${h.rune5Id}',5);">卸下符文</a>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>符文6：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="rune6Id"  value="${h.rune6Id }"/><br/><a  href="" onclick="edit('${h.uid}','${h.heroId}','${h.rune6Id}',6);">卸下符文</a>
                        </td>
                    </tr>
            </table>




            </div>
        </div>
    </div>
</form>	
</body>
</html>