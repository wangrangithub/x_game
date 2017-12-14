<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/time-text/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/back/comm.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>

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
		
	
		
		
		function AddNotice(){
			art.dialog.open("<%=request.getContextPath()%>/notice/addNotice", {
                width: '1000px',
                height: '800px',
                title: "新增公告信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.addNotice();
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
				art.dialog.open("<%=request.getContextPath()%>/jurisdiction/update.do?id="+id, {
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
		
		function deleteNotice(){
			var idArray = getSelectionIds("tabledept");
			var serverId = $("#serverIdSel").val();
			
			alert(serverId);
			if(idArray.length==0){
				alert("请选择要删除的公告");
			}else if(idArray.length>1){
				alert("每次只能删除1个公告");
			}else{
				if(confirm('您确定要删除该公告信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					 $.ajax({
	                     type:"post",
	                     url:'<%=request.getContextPath()%>/notice/deleteNotice.do',
	                     data:{
	                     	id:id,
	                     	serverId:serverId,
	                     	
	                     },
	                     success:function(data){
	                         if(data=="ok"){
	                         	location.reload() ;
	                         }
	                     },
	                     error:function(e){
	                         alert("错误！！");
	                     }
	                 });  		
				}
			}
			
			
		}
		  
        
		function publishNotice(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要预约的公告");
			}else if(idArray.length>1){
				alert("每次只能删除1个公告");
			}else{
				if(confirm('您确定要预约该公告信息吗 ？')){
					var id = idArray[0];
					var url = "<%=request.getContextPath()%>/notice/pubNotice?id="+id;
					
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
			var exit =$("#exit").val();
			if(exit!=null&&exit!=""){
				
				alert(exit);
			}
			var ed =$("#ed").val();
			if(ed!=null&&ed!=""){
				
				alert(ed);
			}
			var nome =$("#nome").val();
			if(nome!=null&&nome!=""){
				
				alert(nome);
			}
		})
		
	</script>

</head>
<body class="easyui-layout">
	<form id="form1" method="post"
		action="<%=request.getContextPath()%>/notice/comNotice">
		<div class="container">
			<div class="content">
				<div class="loaction">
					<p>
						<span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span
							class="pl5">公告管理</span><span class="pl5">></span><span
							class="pl5">公告列表</span>
					</p>
				</div>
				<!--功能按钮区域-->
				<div class="function">
					<input style="display: none;" id="btnAddNotice" type="button"
						value="添加公告" class="btn_new commbtn" onclick="AddNotice()" />
					<input style="display: none;" id="btnViewDept" type="button" value="维修回执"
						class="btn_find commbtn" onclick="viewDept()" /> 
					<input style="display: none;" id="btnUpdateDept" type="button"
						value="修改维修登记" class="btn_edit commbtn" onclick="updateDept()" />
					<input style="display: none;" id="btnPublishNotice" type="button"
						value="预约公告" class="btn_new commbtn" onclick="publishNotice();" />
                    <input style="display: none;" id="btnDeleteNotice" type="button"
						value="删除公告" class="btn_new commbtn" onclick="deleteNotice()" />   
				</div>
				<div class="clear"></div>
				<input id="fail" type="hidden" value="${fail}" style="width: 120px;"
					class="search_txt" /> <input id="succ" type="hidden"
					value="${succ}" style="width: 120px;" class="search_txt" /> <input
					id="exit" type="hidden" value="${exit}" style="width: 120px;"
					class="search_txt" /> <input id="ed" type="hidden" value="${ed}"
					style="width: 120px;" class="search_txt" /> <input id="nome"
					type="hidden" value="${nome}" style="width: 120px;"
					class="search_txt" />


				<!--查询条件区域-->
				<div class="funsearch">
					<div class="search_list">
						选择服： <select class="select_gallery" name="serverId"  id="serverIdSel"
							style="width: 150px;">
							<optgroup label="服信息">
								<option value="-1">请选择</option>
								<c:forEach items="${serverList}" var="server">

									<option value="${server.sid }"
										<c:if test="${param.serverId==server.sid }">selected="selected"</c:if>>${server.name }</option>

								</c:forEach>

							</optgroup>

						</select>
					</div>


					<input type="button" onclick="pageIndexChanging(1, 'form1');"
						class="search_bt commbtn" value="搜索" />
				</div>

				<!--数据分页-->
				<jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
					<jsp:param value="form1" name="formid" />
				</jsp:include>

				<table id="tabledept" width="100%" border="0" cellspacing="1"
					cellpadding="0" class="table_list">
					<!--表头部分-->
					<thead>
						<tr>
							<th style="width: 60px;"><input type="checkbox"
								onclick="CheckAll(this, 'chkDeptIds')" /></th>
							<th style="width: 80px;">序号</th>
							<th style="width: 100px;">id</th>
							<th style="width: 100px;">创建时间</th>
							<th style="width: 100px;">生效时间</th>
							<th style="width: 100px;">结束时间</th>
							<th style="width: 100px;">默认语言公告内容</th>
							<th style="width: 100px;">状态</th>

						</tr>
					</thead>
					<!--数据部分-->
					<tbody>
						<c:forEach items="${pageModel.dateList}" var="notice"
							varStatus="status">

							<tr>
								<td><input id="noticeTdId" type="checkbox" name="chkDeptIds"
									value="${notice.id }" /></td>
								<td>${status.count}</td>
								<td >${notice.id}</td>
								<td><fmt:formatDate type="date" value="${notice.ceateTime}"
										dateStyle="default" /></td>
								<td><fmt:formatDate type="date"
										value="${notice.beginTime }" dateStyle="default" /></td>
								<td><fmt:formatDate type="date" value="${notice.endTime }"
										dateStyle="default" /></td>
								<td>${notice.content }</td>
								<td>${notice.status }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</form>

</body>
</html>
