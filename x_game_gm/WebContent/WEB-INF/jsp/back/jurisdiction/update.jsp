<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
	
	<script type="text/javascript">
    	function updateEmp(){
    		var funids = getChecked();
    		//alert(funids);
    		$("#formupdate").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/jurisdiction/update.do?funids="+funids,
    			type:"post",
    			resetForm:false,
    			success:function(data){
    				if(data.result==true){
    					//获取父窗口的window对象
    					var win = art.dialog.open.origin;  
    					//调用父窗口的js方法refresh();
    					win.refresh();
    					//关闭对话框
    					art.dialog.close();
    				}
    				else{
    					
    					alert(data.message);
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("修改角色失败，请重试");
                } 
    		});
    	}
    	
    	function getChecked() {
        	var array = new Array();
            var nodes = $('#tt').tree('getChecked');
            var nodeParent = $('#tt').tree('getChecked', 'indeterminate');
            var s = '';
            for (var i = 0; i < nodes.length; i++) {
            	var node = nodes[i];
				array.push(node.id);
            }
            
            for (var i = 0; i < nodeParent.length; i++) {
            	var nod = nodeParent[i];
				array.push(nod.id);
            }
            var ids = array.join(",");
			return ids;
        }
    </script>

 
    <script type="text/javascript">
        
       /* 
        $(function(){
        	
        	 var arr = $("input:first").val();
        	 for(var i = 0; i < arr.length; i++){
        		 alert(arr[i]);
        		 
        		 
        	 }
        	 var nodes = jqTree.data("allNodeList");  
        	 var node = tree.getRoots(jqTree);
        	 alert(node);
             var s = '';
             for (var i = 0; i < nodes.length; i++) {
            	 //alert(nodes[i].id);
            	 for(var i = 0; i < arr.length; i++){
            		 alert(arr[i].id);
            		 if(nodes[i].id==arr[i].id){
            			 
            			 $('#tt').tree('getChecked');
            		 }
            		 
            	 }
            	 
     		 }
        	
        	
        }) */
        
         /**  
     * 获取easyui tree的所有node节点  
     */  
    function getAllNodes(jqTree, tree) {  
        var allNodeList = jqTree.data("allNodeList");  
        if (!allNodeList) {  
            var roots = tree.getRoots(jqTree);  
            allNodeList = getChildNodeList(jqTree, tree, roots);  
            jqTree.data("allNodeList", allNodeList);  
        }  
        return allNodeList;  
    }  
        
    
    </script>
    
</head>
<body>
<form id="formupdate">
	
    <input type="hidden" name="roleid" value="${role.roleid}" />
	<div class="easyui-tabs" style="width: 100%;">
        <div title="权限基本信息">
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>角色名称：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="rolename" value="${role.rolename}"/>
                        </td>
                    </tr>
                   

                    <tr>                           
                            <td width="100px"><span class="font01 pr5">*</span>权限信息：</td>
                            <td class="white-tr">
                           <%--  <c:forEach  items="${rfs}" var="r">
                            <input id="hid" type="hidden" name="ids" value="${r}"/>
                            </c:forEach> --%>
		                      <div data-options="region:'center',split:true" title="权限树"  style="padding: 5px">
							 
							 	<ul id="tt" class="easyui-tree" data-options="url:'<%= request.getContextPath()%>/jurisdiction/updatetree.json?id=${role.roleid }',method:'get',animate:true,lines:true,checkbox:true"></ul>
								
								</div>
							
                            </td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
</form>	
</body>
</html>	