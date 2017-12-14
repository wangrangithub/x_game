<%@page import="java.security.Timestamp"%>
<jsp:useBean id="dateObject" class="java.util.Date" scope="page"></jsp:useBean>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/back/comm.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/time-text/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
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
			var server = $("#server").val();
			
			$("#"+formid).submit();
			
		}
		
		function refresh(){
			pageIndexChanging(1, "form1");
		}
		
	
		
		
		function Addcdk(){
			art.dialog.open("<%=request.getContextPath()%>/Cdk/addCdk", {
                width: '800px',
                height: '450px',
                title: "新增cdk信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.Addcd();
                    return false;
                },
                cancel: true
            });
		}
		
		
		
		function deleteCdk(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要删除的cdk");
			}else if(idArray.length>1){
				alert("每次只能删除1个cdk");
			}else{
				if(confirm('您确定要删除该cdk信息吗？')){
					var id = idArray[0];
					var serverId = $("#serverId").val();
					var url = "<%=request.getContextPath()%>/Cdk/deleteCdk?id="+id+"&serverId="+serverId;
					
					window.location.href=url;			
				}
			}
			
			//checkError();
			
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
			var result =$("#result").text();
			if(result!=null&&result!=""){
				
				alert(result);
			}
			var succ =$("#succ").val();
			if(succ!=null&&succ!=""){
				
				alert(succ);
			}
		})
		function Export(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要导出的cdk");
			}else if(idArray.length>1){
				alert("每次只能导出1个cdk");
			}else{
				if(confirm('您确定要导出该cdk信息吗？')){
					var id = idArray[0];
					var url = "<%=request.getContextPath()%>/Cdk/exportCdks?id="+id;
					window.location.href=url;			
				}
			}
			
			//checkError();
			
		}
	</script>

</head>
<body class="easyui-layout">
	<form id="form1" method="post"
		action="<%=request.getContextPath()%>/Cdk/cdkList">
		<div class="container">
			<div class="content">
				<div class="loaction">
					<p>
						<span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span
							class="pl5">活动管理</span><span class="pl5">></span><span
							class="pl5">cdk活动</span>
					</p>
				</div>
				<!--功能按钮区域-->
				<div class="function">
					<input style="display: none;" id="btnAddCdk" type="button"
						value="新增" class="btn_new commbtn" onclick="Addcdk()" /> <input
						style="display: none;" id="btnViewDept" type="button" value="维修回执"
						class="btn_find commbtn" onclick="viewDept()" /> <input
						style="display: none;" id="btnUpdateDept" type="button"
						value="修改维修登记" class="btn_edit commbtn" onclick="updateDept()" />
					<input style="display: none;" id="btnDeleteCdk" type="button"
						value="删除" class="btn_new commbtn" onclick="deleteCdk();" /> <input
						style="display: none;" id="btnExport" type="button" value="导出CVS"
						class="btn_new commbtn" onclick="Export();" />

				</div>
				<div class="clear"></div>
				<!--查询条件区域-->
				<div class="funsearch">
					<div class="search_list">
						<!-- <span>维修登记名称：</span>
                    	<input name="deptName" type="text" class="search_txt" value="${param.deptName }" /> -->
						CDK使用情况： <input name="cdk" style="width: 120px;"
							value="${param.cdk}" class="search_txt" />
						<%-- 选择服：
                        <select class="select_gallery" name="serverId" style="width: 150px;">  
				            <optgroup label="服信息">  
								<option value="-999" >请选择</option>
							<c:forEach items="${serverList}" var="server">
								
								<option value="${server.sid }"  <c:if test="${param.serverId==server.sid }">selected="selected"</c:if>>${server.name }</option>
							
							</c:forEach>
  
				            </optgroup>  
				              
				        </select>  --%>
					</div>

					<input type="button" onclick="pageIndexChanging(1, 'form1');"
						class="search_bt commbtn" value="搜索" />

				</div>
				<input id="succ" type="hidden" value="${succ}" style="width: 120px;"
					class="search_txt" />


				<!--数据分页-->
				<jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
					<jsp:param value="form1" name="formid" />
				</jsp:include>

				<!-- 服serverId -->

				<input id="serverId" type="hidden" value="${serverId}"
					style="width: 120px;" class="search_txt" /> <input id="result"
					type="hidden" value="${result}" style="width: 120px;"
					class="search_txt" />
				<!--搜索结果-->
				<table id="tabledept" width="100%" border="0" cellspacing="1"
					cellpadding="0" class="table_list">
					<!--表头部分-->
					<thead>
						<tr>
							<th style="width: 60px;"><input type="checkbox"
								onclick="CheckAll(this, 'chkDeptIds')" /></th>
							<th style="width: 80px;">序号</th>
							<th style="width: 100px;">id</th>
							<th style="width: 100px;">开始时间</th>
							<th style="width: 100px;">结束时间</th>
							<th style="width: 100px;">当批数量</th>
							<th style="width: 100px;">使用数量</th>
							<th style="width: 100px;">奖励1</th>
							<th style="width: 100px;">奖励1数量</th>
							<th style="width: 100px;">奖励2</th>
							<th style="width: 100px;">奖励2数量</th>
							<th style="width: 100px;">奖励3</th>
							<th style="width: 100px;">奖励3数量</th>
							<th style="width: 100px;">奖励4</th>
							<th style="width: 100px;">奖励4数量</th>
						</tr>
					</thead>
					<!--数据部分-->
					<tbody>
						<c:forEach items="${pageModel.dateList}" var="cdk"
							varStatus="status">
							<tr>
								<td><input id="id0" type="checkbox" name="chkDeptIds"
									value="${cdk.id }" /></td>
								<td>${status.count}</td>
								<td>${cdk.id }</td>
								<td  value="${cdk.createTime }">
									<jsp:setProperty property="time" name="dateObject" value="${cdk.createTime}" />
									<fmt:formatDate value="${dateObject}" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>

								<td  value="${cdk.endTime }">
								<!-- 时间戳转化为日期-时间格式 yyyy-MM-dd HH:mm:ss -->
									<jsp:setProperty property="time" name="dateObject" value="${cdk.endTime}" />
									<fmt:formatDate value="${dateObject}" pattern="yyyy-MM-dd HH:mm:ss" />
										
								</td>
								<td>${cdk.num}</td>
								<td>${cdk.usedNum }</td>
								<td>${cdk.itemId1 }</td>
								<td>${cdk.num1 }</td>
								<td>${cdk.itemId2 }</td>
								<td>${cdk.num2 }</td>
								<td>${cdk.itemId3 }</td>
								<td>${cdk.num3 }</td>
								<td>${cdk.itemId4 }</td>
								<td>${cdk.num4 }</td>

							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>
	</form>
</body>

</html>
