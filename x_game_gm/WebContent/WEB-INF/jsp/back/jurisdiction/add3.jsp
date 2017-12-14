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
	
   <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/zTree/js/jquery.ztree.core-3.4.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/zTree/js/jquery.ztree.excheck-3.5.js"></script>
   
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/zTree/zTreeStyle/zTreeStyle.css">
   
	
	
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
    

    <%-- var setting = {  
        isSimpleData : true,              //数据是否采用简单 Array 格式，默认false  
        treeNodeKey : "funid",               //在isSimpleData格式下，当前节点id属性  
        treeNodeParentKey : "parentfunid",        //在isSimpleData格式下，当前节点的父节点id属性  
        showLine : true,                  //是否显示节点间的连线  
        checkable : true                  //每个节点上是否显示 CheckBox  
    };  
      
    var zTree;  
    var treeNodes;  
      
    $(function(){  
        $.ajax({  
            async : false,  
            cache:false,  
            type: 'POST',  
            dataType : "json",  
            url: "<%= request.getContextPath()%>/jurisdiction/tree.json",//请求的action路径  
            error: function () {//请求失败处理函数  
                alert('请求失败');  
            },  
            success:function(data){ //请求成功后处理函数。    
                alert(data);  
                treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes  
            }  
        });  
      
        zTree = $("#tree").zTree(setting, treeNodes);  
    });  
     --%>
     
     var zTree;
   //创建树型结构
   function createTree() {
     var setting = {
       check:{
         enable:true
       },
       view: {
         dblClickExpand: true,
         expandSpeed: ""
       },
       //异步加载
       async: {
         enable: true,//设置是否异步加载
         url:"<%= request.getContextPath()%>/jurisdiction/tree.json", //设置异步获取节点的 URL 地址
        
       },
        
       //这个data里面的pIdKey,idKey,name等等之类的都是对应后台查出的字段名字，
        在sql中写好或者在拼接json的时候先拼接好，前太接收的时候只要对应一直就可以了
       data: {
         simpleData: {
           enable: true,
           pIdKey: "parentfunid",
           idKey: "funid"
         },
           key: {
             checked: "checked",
             name:"name"
           }
       },
       callback: {
        onAsyncSuccess: zTreeOnAsyncSuccess 
     } 
     };
     //初始化  
     zTree = $.fn.zTree.init($("#tree"), setting);  
     zTree.expandAll(true);
   }
   /* 异步加载无法展开tree 默认展开一级菜单 */
   var firstAsyncSuccessFlag = 0;
   function zTreeOnAsyncSuccess(event, treeId, msg) { 
   if (firstAsyncSuccessFlag == 0) { 
        try { 
            //调用默认展开第一个结点 
            var selectedNode = zTree.getSelectedNodes(); 
            var nodes = zTree.getNodes(); 
            zTree.expandNode(nodes[0], true); 
            var childNodes = zTree.transformToArray(nodes[0]); 
            zTree.expandNode(childNodes[1], true); 
            zTree.selectNode(childNodes[1]); 
            var childNodes1 = zTree.transformToArray(childNodes[1]); 
            zTree.checkNode(childNodes1[1], true, true); 
            firstAsyncSuccessFlag = 1; 
         } catch (err) { 
          
         } 
      } 
   }
    
   $(function(){
     //页面加载完成创建树
     createTree();  
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
                    

            </table>
	
			<div>  
                <ul id="tree" class="ztree"></ul>  
            </div>  

		
				<c:forEach items="${menus }" var="menu">
				<c:if test="${menu.parentfunid==null }">
					<div>
						<h4><input type="checkbox" class="pmenu" />${ menu.funname }</h4>
						<div>
							<c:forEach items="${menus }" var="submenu">
								<c:if test="${submenu.parentfunid==menu.funid }">
									<span>
										<input name="funIds" value="${submenu.funid }" type="checkbox" />${ submenu.funname }
									</span>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</c:forEach>
				

	

            </div>
        </div>
    </div>
</form>	
</body>
</html>