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
	<script type="text/javascript" src="<%=request.getContextPath()%>/jslib/extJs.js" charset="utf-8"></script>
	<link id="easyuiTheme" rel="stylesheet" href="<%=request.getContextPath()%>/jslib/easyui1.4.2/themes/<c:out value="${cookie.easyuiThemeName.value}" default="gray"/>/easyui.css" type="text/css">
	<link id="easyuiTheme" rel="stylesheet" href="<%=request.getContextPath()%>/jslib/easyui1.4.2/themes/icon.css" type="text/css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/jslib/easyui1.4.2/jquery.easyui.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jslib/easyui1.4.2/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
	
	
	
	<script type="text/javascript">
	
	 
	
    	function Add(){
    		var funids = getChecked();
    		//alert(funids);
    		//alert(funids);
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/jurisdiction/add.do?funids="+funids,
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
    				}else{
    					
    					alert(data.message);
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("新增权限失败，请重试");
                } 
    		});
    	}
    	
    	
    	
    </script>


    <!-- <script type="text/javascript">
        $(function(){

            
            $(".pmenu").click(function(){
                var chk = this;
                $(this).parent().next().find(":checkbox").each(function(i, item){
                    item.checked = chk.checked;
                });
            });
        });
    </script> -->
    
    
    <script type="text/javascript">
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
    var treeGrid;
	$(function() {
		
		treeGrid = $('#treeGrid').treegrid({
			url : '<%= request.getContextPath()%>/jurisdiction/treegrid',
			idField : 'id',
			treeField : 'name',
			parentField : 'pid',
			fit : true,
			fitColumns : false,
			border : false,
			frozenColumns : [ [ {
				title : '编号',
				field : 'id',
				width : 40
			} ] ],
			columns : [ [ {
				field : 'name',
				title : '资源名称',
				width : 150
			}, {
				field : 'url',
				title : '资源路径',
				width : 200
			}, {
				field : 'resourcetype',
				title : '资源类型',
				width : 80,
				formatter : function(value, row, index) {
					switch (value) {
					case 0:
						return '菜单';
					case 1:
						return '按钮';
					}
				}
			}, {
				field : 'pid',
				title : '上级资源ID',
				width : 150,
				hidden : true
			}, {
				field : 'action',
				title : '操作',
				width : 80,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					if ($.canEdit) {
					str += $.formatString('<a href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
					}
					if ($.canDelete) {
					str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
					str += $.formatString('<a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
					}
					return str;
				}
			} ] ],
			toolbar : '#toolbar'
		});
	});
    
    </script>
    
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="权限基本信息">
        <form:errors path="*"></form:errors>
        <form:errors path="funids"></form:errors>
            <div class="dialog-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>角色名称：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="rolename" />
                        </td>
                    </tr>
                   

                   <%--  <tr>                           
                            <td width="100px"><span class="font01 pr5"></span>权限信息：</td>
                            <td class="white-tr">
			                  <div data-options="region:'center',split:true" title="权限树"  style="padding: 5px">
								 <ul id="tt" class="easyui-tree" data-options="url:'<%= request.getContextPath()%>/jurisdiction/tree.json',method:'get',animate:true,lines:true,checkbox:true"></ul>
								</div>
                        </td>
                    </tr> --%>
                    <tr>
                   
                    	
                    	
						
                    
                    

            </table>

				<div class="easyui-layout" data-options="fit:true,border:false">
							<div data-options="region:'center',border:false"  style="overflow: hidden;">
								<table id="treeGrid"></table>
							</div>
						</div>


            </div>
        </div>
    </div>
</form>	
</body>
</html>