<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
		
	
		
		
		function addshop(){
			art.dialog.open("<%=request.getContextPath()%>/shop/addOff",
				{
	                width: '1000px',
	                height: '750px',
	                title: "新增商城活动商品",
	                opacity: 0.3,
	                skin: 'green',
	                lock: true,
	                ok: function (iframeWin, topWin) {
	                    // iframeWin: 对话框iframe内容的window对象
	                    // topWin: 对话框所在位置的window对象
	                    iframeWin.Adds();
	                    return false;
	                },
	                cancel: true
            	});
		}
		
		function copyshop(id){
			
			
			var url = "<%=request.getContextPath()%>/shop/copyOffList?id="+id;
			
			window.location.href=url;	
		}
		function updateoff(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要修改的活动");
			}else if(idArray.length>1){
				alert("每次只能修改1个活动");
			}else{
				var id = idArray[0];
				art.dialog.open("<%=request.getContextPath()%>/shop/updateOff?id="+id, {
					width: '1000px',
	                height: '750px',	
	                title: "修改活动信息",
	                opacity: 0.3,
	                skin: 'green',
	                lock: true,
	                ok: function (iframeWin, topWin) {
	                    // iframeWin: 对话框iframe内容的window对象
	                    // topWin: 对话框所在位置的window对象
	                    iframeWin.updates();
	                    return false;
	                },
	                cancel: true
	            });
			}
		}
		
		function deleteoff(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要删除的活动");
			}else if(idArray.length>1){
				alert("每次只能删除1个活动");
			}else{
				if(confirm('您确定要删除该活动信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					var url = "<%=request.getContextPath()%>/shop/deleteOff?id="+id;
					
					window.location.href=url;			
				}
			}
			
			//checkError();
			
		}
		/* function checkError(){
			
			if($("#er").val()==null&&$("#er").val()==""){
				
				alert("删除成功！");
			}else{
				alert($("#er").val());
			}
		} */
		
		
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
			var re =$("#re").val();
			if(re!=null&&re!=""){
				
				alert(re);
			}
			
			var res =$("#res").val();
			if(res!=null&&res!=""){
				alert(res);
			}
			
		});
		
		
		function changeState(id,state,serverId)
		{
			
			if(state == 0 ? window.confirm("上架活动？"):window.confirm("下架活动？")){
				window.location="<%=request.getContextPath()%>/shop/publishServer?id="+id+"&state="+state+"&serverId="+serverId;
    			<%-- $.get(
    					"<%= request.getContextPath()%>/shop/publishServer?id="+id+"&state="+state+"&serverId="+serverId,
    					{},
    					function(data){
    						location.reload();
    					}
    				); --%>
			 }else{
				return false;
			} 
    		
		}
		
		
		
		
	</script>

</head>
<body>
	<form id="form1" method=""
		action="<%=request.getContextPath()%>/shop/offList">
		<input id="res"  type="hidden" value="${response }">
		<div class="container">
			<div class="content">
				<div class="loaction">
					<p>
						<span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span
							class="pl5">活动管理</span><span class="pl5">></span><span
							class="pl5">商城商品列表</span>
					</p>
				</div>
				<!--功能按钮区域-->
				<div class="function">
					<input style="display: none;" id="btnAddShop" type="button"
						value="添加" class="btn_new commbtn" onclick="addshop()" />
					<input style="display: none;" id="btnAddoff" type="button" value="下架"
						class="btn_new commbtn" onclick="addoff()" /> <input
						style="display: none;" id="btnViewoff" type="button" value="推送服务器"
						class="btn_find commbtn" onclick="changeState()" /> <input
						style="display: none;" id="btnUpdateoff" type="button" value="修改"
						class="btn_new commbtn" onclick="updateoff()" /> <input
						style="display: none;" id="btnDeleteoff" type="button" value="删除"
						class="btn_new commbtn" onclick="deleteoff();" />
				</div>
				<div class="clear"></div>
				<!--查询条件区域-->
				<%--   <div class="funsearch">
                   <div class="search_list">
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
               
               
                 <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="搜索" />
             
                 
                </div> --%>
				<input type="hidden" id="re" value="${re}" />
				<!--数据分页-->
				<jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
					<jsp:param value="form1" name="formid" />
				</jsp:include>

				<!--搜索结果-->
				<table id="tabledept" width="" border="0" cellspacing="1"
					cellpadding="0" class="table_list">
					<!--表头部分-->
					<thead>
						<tr>
							<th style="width: 60px;"><input type="checkbox"
								onclick="CheckAll(this, 'chkDeptIds')" /></th>
							<th style="width: 100px;">活动ID</th>
							<th style="width: 100px;">活动名称</th>
							<th style="width: 100px;">商品ID</th>
							<th style="width: 100px;">图片名称</th>
							<th style="width: 100px;">售价</th>
							<th style="width: 100px;">标记</th>
							<th style="width: 100px;">优先级</th>
							<th style="width: 100px;">最多购买</th>
							<th style="width: 100px;">开始时间</th>
							<th style="width: 100px;">结束时间</th>
							<th style="width: 100px;">状态</th>
							<th style="width: 100px;">可视条件</th>
							<th style="width: 200px;">是否出现活动曝光</th>
							<th style="width: 150px;">活动展示位</th>
							<th style="width: 150px;">类型及权重</th>
							<th style="width: 100px;">开启条件</th>
							<th style="width: 100px;">图标路径</th>
							<th style="width: 200px;">弹窗模板样式</th>
							<th style="width: 100px;">模板参数</th>
							<th style="width: 100px;">曝光信息</th>
							<th style="width: 100px;">操作项</th>


						</tr>
					</thead>
					<!--数据部分-->
					<tbody>
						<c:forEach items="${pageModel.dateList}" var="s"
							varStatus="status">
							<tr>
								<td style="width: 60px;"><input id="id0" type="checkbox" name="chkDeptIds"
									value="${s.id }" /></td>
								<td>${s.id }</td>
								<td>${s.act_name }</td>
								<td>${s.tmplId }</td>
								<td>${s.picture }</td>
								<td>${s.price }</td>
								<td><c:if test="${s.mark==0 }">无</c:if> <c:if
										test="${s.mark==1 }">HOT</c:if> <c:if test="${s.mark==2 }">Limited</c:if>
								</td>
								<td>${s.priority }</td>
								<td><c:if test="${s.maxBuy==-1 }">不限</c:if> <c:if
										test="${s.maxBuy!=-1 }">${s.maxBuy}</c:if></td>
								<td>${s.startTime }</td>
								<td>${s.endTime }</td>
								<td><c:choose>
										<c:when test="${s.state==-1 }">
								   暂停
							    </c:when>
										<c:when test="${s.state==0 }">
								   预约中
							    </c:when>
										<c:when test="${s.state==1&&s.hasPush==1 }">
								   进行中
							    </c:when>
										<c:when test="${s.state==1&&s.hasPush==0 }">
								   准备中
							    </c:when>
										<c:otherwise>
								过期
								</c:otherwise>
									</c:choose>
								</td>


								<td>${s.visableCond }</td>
								<td style="width:200px;">
									<c:if test="${s.bgActive ==1}">
                              			是
                              		
                              		</c:if> 
                              		<c:if test="${s.bgActive ==0}">
                              			否
                              		</c:if>
                              	</td>
								<td style="width: 150px;">${s.position }</td>
								<td style="width: 150px;">${s.typeWeight }</td>
								<td>${s.openCondition }</td>
								<td>${s.iconDir }</td>
								<td  style="width: 200px;">${s.tempId }</td>
								<td>
									<table>
										<tr>
											<td>语言</td>
											<td>内容</td>
										</tr>
										<c:forEach items="${s.contentInfo }" var="con">
											<tr>
												<td>${con.language }</td>
												<td>${con.content}</td>
											</tr>
										</c:forEach>
									</table>
								</td>
								<td>
									<table>
										<tr>
											<td>曝光节点</td>
											<td>曝光率</td>
											<td>曝光优先级</td>
											<td>每日曝光次数</td>
											<td>等级限制</td>
										</tr>
										<c:forEach items="${s.ruleInfo}" var="ru">
											<tr>
												<td>${ru.node }</td>
												<td>${ru.rate}</td>
												<td>${ru.priority}</td>
												<td>${ru.times}</td>
												<td>${ru.lvLimit}</td>
											</tr>
										</c:forEach>
									</table>
								</td >

								<td>
									<input type="button"
										onclick="javaScript:window.location='<%= request.getContextPath()%>/shop/publishServer?id=${s.id }&amp;state=${s.state}'"
										value="推送">
									<input type="button"
										onclick="javaScript:window.location='<%= request.getContextPath()%>/shop/recoveryShop?id=${s.id }'"
										value="收回">
									<input type="button"
										onclick="copyshop(${s.id })"
										value="复制">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<script type="text/javascript">
		        //显示隐藏
            	function showActivity(activityid){
            		var display = document.getElementById("div"+activityid).style.display;
            		if(display == "none"){
            			document.getElementById("div"+activityid).style.display="";
            			document.getElementById("button"+activityid).value = "隐藏活动";
            		}else{
            			document.getElementById("div"+activityid).style.display="none";
            			document.getElementById("button"+activityid).value = "显示活动";	
            		}
            		
            	}
		        
		        </script>
			</div>
		</div>
	</form>

</body>
</html>
