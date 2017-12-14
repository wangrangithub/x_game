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
	
	
		$(function(){
			
			<%-- var msg = '<%= request.getAttribute(ResourceKeys.ALERT_MESSAGE)==null ? "":request.getAttribute(ResourceKeys.ALERT_MESSAGE).toString()%>';
			if(msg!=""){
				alert(msg);
			} --%>
		});
		
	</script>
	<script type="text/javascript">
		/**
		 * 查询 - 分页
		 * @param newPageIndex
		 * @param formid
		 */
		function pageIndexChanging(newPageIndex, formid){
			$("#pageIndex").val(newPageIndex);
			$("#"+formid).submit();
		}
		
		function refresh(){
			pageIndexChanging(1, "form1");
		}
		
		
		
		function Add(){
			art.dialog.open("<%= request.getContextPath()%>/jurisdiction/add.do", {
                width: '800px',
                height: '450px',
                title: "新增权限信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.Add();
                    return false;
                },
                cancel: true
            });
		}
		
		function updateEmp(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要修改的权限");
			}else if(idArray.length>1){
				alert("每次只能修改1个权限");
			}else{
				var id = idArray[0];
				art.dialog.open("<%= request.getContextPath()%>/jurisdiction/update.do?id="+id, {
	                width: '700px',
	                height: '450px',
	                title: "修改权限信息",
	                opacity: 0.3,
	                skin: 'green',
	                lock: true,
	                ok: function (iframeWin, topWin) {
	                    // iframeWin: 对话框iframe内容的window对象
	                    // topWin: 对话框所在位置的window对象
	                    iframeWin.updateEmp();
	                    return false;
	                },
	                cancel: true
	            });
			}
		}
		
		function deleteEmp(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要删除的权限");
			}else if(idArray.length>1){
				alert("每次只能删除1个权限");
			}else{
				if(confirm('您确定要删除该权限信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/jurisdiction/delete.do?id="+id;
					
					window.location.href=url;			
				}
			}
			
			//checkError();
			
		}
		
		
		function viewDept(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要查看的权限");
			}else if(idArray.length>1){
				alert("每次只能查看1个权限");
			}else{
				var id = idArray[0];
				viewDeptById(id);
			}
		}
		
		function viewDeptById(deptId){
			var url = "details.html";
			art.dialog.open(url, {
                width: '500px',
                height: '250px',
                title: "查看权限信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    return true;
                },
                cancel: true
            });
		}
		
		$(function(){
			//按钮权限
			var url = "<%=request.getContextPath()%>/jurisdiction/control.do";
			var href = window.location.pathname;
			//alert($(".function input")[0]);
			$.getJSON(url, {href:href}, function(data){
				//alert(data);
				$(".function input").each(function(i, item){
					var btnId = $(item).attr("id");
					//alert(btnId);
					var flag = false;
					$.each(data, function(j, menu){
						if(menu.funurl == btnId){
							flag = true;
						}
					});
					if(flag==true){
						$(item).show();
					}
				});
			});
			var er =$("#error").text();
			if(er!=null&&er!=""){
				
				alert(er);
			}
			var fail =$("#fail").val();
			if(fail!=null&&fail!=""){
				
				alert(fail);
			}
			var succ =$("#succ").val();
			if(succ!=null&&succ!=""){
				
				alert(succ);
			}
		})
		function Change_Select()
		{
		var type = $("#type").val();
		if(type == 6)
		{
			var html='<select name="itemid" id="itemid">';
				html+='<option selected="selected" value="20">金币</option>';
				html+='<option value="21">钻石</option>';
				html+='<option value="22">角色经验</option>';
				html+='<option value="23">体力</option>';
				html+='<option value="24">精力</option>';
				html+='<option value="25">竞技场积分</option>';
				html+='<option value="26">友情点</option>';
				html+='</select>';
			$("#inputid").html(html);
		} else if (type == 9) {
			var html = '<input type="text" style="width:70px" maxlength="10" class="required number" value="" id="itemid" name="itemid">&nbsp';
			html += '技能ID: <input type="text" style="width:70px" maxlength="10" class="required number" value="" id="skillid" name="skillid">';
			$("#inputid").html(html);
		}else{
			$("#inputid").html('<input type="text" style="width:70px" maxlength="10" class="required number" value="" id="itemid" name="itemid">');
		}
	}
		function additem()
		{
			$.ajax({
					url: "<%=request.getContextPath()%>/rolesearch/addResource",
					type: "post",
					data: $('#form1').serialize(),
					dataType: "json",
					cache: false,
					success: function(data) {
						if(data=="ok"){
							alert("新增成功！");
	    				}else{
	    					
	    					alert(data);
	    					
	    				}
					}
			});
		}
	</script>

</head>
<body class="easyui-layout">
 <form id="form1" method="post" action="<%=request.getContextPath()%>/rolesearch/addResource">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">角色管理</span><span class="pl5">></span><span class="pl5">添加资源</span></p>
                </div>
                <!--功能按钮区域-->
                <!-- <div class="function">
                    <input style="display:none;" id="btnAddDept" type="button" value="新增维修登记" class="btn_new commbtn" onclick="addDept()" />
                    <input style="display:none;" id="btnViewDept" type="button" value="维修回执" class="btn_find commbtn" onclick="viewDept()" />
                    <input style="display:none;" id="btnUpdateDept" type="button" value="修改维修登记" class="btn_edit commbtn" onclick="updateDept()" />
                    <input style="display:none;" id="btnDeleteDept" type="button" value="删除维修登记" class="btn_del commbtn" onclick="deleteDept();" />
                </div> -->
                <div class="clear"></div>
                <!--查询条件区域-->
                <div class="funsearch">
                    <div class="search_list">
                    	<div class="search_list">
                         	用户id：
                    	<input  name="uid" style="width: 120px;"  class="search_txt"  />                 	
                
                         	添加物品：
                         	
                    	类型：<select name="type" id="type" onChange="Change_Select()">
						<option selected="selected" value="0" >----</option>
						<option value="6">玩家属性</option>
						<option value="1">道具</option>
						<option value="4">武将</option>
						<option value="7">武将等级</option>
						<option value="9">武将技能</option>
						<option value="26">武将经验</option>
						<option value="27">武将压力</option>	
					</select>
						<span id="inputid">
						</span>
						
                 数量 : <input type="text" style="width:70px" maxlength="10" class="required number" value="1" id="num" name="num">
                    	 选择服：
                        <select class="select_gallery" name="serverId" style="width: 150px;">  
				            <optgroup label="服信息">  
								<option value="-1" >请选择</option>
							<c:forEach items="${serverList}" var="server">
								
								<option value="${server.sid }"  <c:if test="${param.serverId==server.sid }">selected="selected"</c:if>>${server.name }</option>
							
							</c:forEach>
				            </optgroup>  
				              
				        </select>
                    </div> 	
                    <input type="button" onclick="additem();"  class="search_bt commbtn" value="确定" />
                  	
                  <input id="fail" type="hidden" value="${fail}" style="width: 120px;"  class="search_txt"  />
                  <input id="succ" type="hidden" value="${succ}" style="width: 120px;"  class="search_txt"  />
               </div>
        </div>
    </form>

		
</body>
</html>
	