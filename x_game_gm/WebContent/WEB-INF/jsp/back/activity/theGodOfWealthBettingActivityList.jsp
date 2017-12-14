<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/css/back/comm.css" />
	<script type="text/javascript" src="<%=path%>/thirdparts/time-text/WdatePicker.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
	<script type="text/javascript" src="<%=path%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="<%=path%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/back/table-ghhs.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery.form.js"></script>

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
		
		function addAct(){
			art.dialog.open("<%=path%>/activity/activityAdd", {
                width: '900px',
                height: '750px',
                title: "新增活动信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.addAc();
                    return false;
                },
                cancel: true
            });
		}
		
		function updateEmp(){
			var idArray = getSelectionIds("tabledept");			
			if(idArray.length==0){
				alert("请选择要修改的员工");
			}else if(idArray.length>1){
				alert("每次只能修改1个员工");
			}else{
				var id = idArray[0];
				
				art.dialog.open("<%=path%>/adminuser/update.do?id="+id, {
	                width: '500px',
	                height: '250px',
	                title: "修改员工信息",
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
				alert("请选择要删除的员工");
			}else if(idArray.length>1){
				alert("每次只能删除1个员工");
			}else{
				if(confirm('您确定要删除该员工信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					
					var url = "<%=path%>/adminuser/deleteEmp.do?id="+id;
					window.location.href=url;
				}
			}
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
				//	alert(btnId);
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
		})
		
		//添加活动
		function addRoleActivity(){
			var value = document.getElementById("activityType").options[document.getElementById("activityType").selectedIndex].value;
			if(value != "0"){
				//跳转到添加
				art.dialog.open("<%=path%>/activity/activityBettingAdd?typeid="+value,
					{
		                width: '900px',
		                height: '750px',
		                title: "新增特殊活动信息",
		                opacity: 0.3,
		                skin: 'green',
		                lock: true,
		                ok: function (iframeWin, topWin) {
		                    // iframeWin: 对话框iframe内容的window对象
		                    // topWin: 对话框所在位置的window对象
		                    iframeWin.addAc();
		                    return false;
		                },
		                cancel: true
		            });
			}
		}
		
		$(function(){
			var result =$("#result").val();
			if(result!=null&&result!=""){
				
				alert(result);
			}
			var actResult =$("#actResult").val();
			if(actResult!=null&&actResult!=""){
				
				alert(actResult);
			}
			var fals =$("#fals").val();
 			if(fals!=null&&fals!=""){
 				
 				alert(fals);
 			}
		})
	</script>

</head>
<body class="">
    <form id="form1" method="" action="">
        <div class="container">
            <div class="content">
                <input id="result"  name="" type="hidden" style="width: 120px;" value="${result}" class="search_txt"  />               	
                <input id="actResult"  name="" type="hidden" style="width: 120px;" value="${actResult}" class="search_txt"  />               	
                <input type="hidden"  class="" id="fals"  name="" value="${fals}"/>
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>管理平台<span class="pl5">></span><span class="pl5">精彩活动</span>
                    								<span class="pl5">></span><span class="pl5">活动管理</span></p>
                </div>
                <!--功能按钮区域-->
                <div class="function">
        			添加新活动:
					<select onchange="addRoleActivity()" id="activityType">
						<option value="0">请选择</option>
		                <option value="2001">财神投注活动</option>
					</select>
       			  </div>	
                <div class="clear"></div>
                <!--搜索结果-->
                <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <thead>
                    
                        <tr>
                            <th style="width:80px;">序号</th>
                            <th style="width:80px;">活动类型名称</th>
                            <th style="width:100px;">排序</th>
                            <th style="width:100px;">操作列</th>
                           
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel.dateList}" var="emp" varStatus="status">
                        <tr>
                           <td>	
	                           	<input type="button" onclick="showActivity(${emp.actId })" id="button${emp.actId }" value="显示活动">
	                           	${status.count}
                           	</td>
                           	<td>${emp.actName}</td>
                         	<td>${emp.actSort}</td>
                           <td>
                           	<a href="<%= request.getContextPath()%>/activity/update2?aid=${emp.actId}">修改</a>
                           </td>
                           
                        </tr>
                        <tr height="5px">
			   				<td colspan="5">
		                        <div id="div${emp.actId }" style="display: none">
					   				<table  cellspacing="0" cellpadding="0" class="table_list">
						   				<tr>
						   					<th>活动名称</th>
				                            <th>活动描述</th>
				                            <th>开始时间</th>
				                            <th>结束时间</th>
				                            <th>状态</th>
				                            <th>操作</th>
						   				</tr>
			                           
										<c:forEach items="${emp.activityInfoList}" var="actInfo" >
												<input name="activityId" type="hidden" id="activityId" value="${actInfo.actId}" />
											<tr>
												<td><c:if test="${actInfo.actType==2001 }"> 财神投注</c:if>  </td>
								   				<td>${actInfo.description}</td>
												<td>${actInfo.beginTime }</td>
												<td>${actInfo.endTime }</td>
												<td> <c:choose>
													    <c:when test="${actInfo.state==-1 }">
														   暂停
													    </c:when>  
													    <c:when test="${actInfo.state==0 }">
														   预约中
													    </c:when>
													     <c:when test="${actInfo.state==1&&actInfo.hashPush==1 }">
														   进行中
													    </c:when>
													     <c:when test="${actInfo.state==1&&actInfo.hashPush==0 }">
														   准备中
													    </c:when>
													    <c:otherwise>
														过期
														</c:otherwise>
													</c:choose>(${actInfo.lineCount })</td>
								   				<td>
								   					<input type="button" onclick="javaScript:window.location='<%= request.getContextPath()%>/activity/activityGodEdit?actId=${actInfo.actId}'" value="编辑">
								   					<input type="button" onclick="delActivity(${actInfo.actId})" value="删除">
								   					
								   					<input type="button" onclick="javaScript:window.location='<%= request.getContextPath()%>/activity/pushGodActivity?actInfoId=${actInfo.actId}'" value="推送">
								   					<input type="button" onclick="javaScript:window.location='<%= request.getContextPath()%>/activity/uypushBetGodActivityById?actInfoId=${actInfo.actId}'" value="收回">
								   					
								       			</td>
											</tr>
										</c:forEach>
									</table>
								</div>
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
                
            	function showservers(serverids){
           		 $("input[name='serverId']").each(function(){
           		 	var value= $(this).attr("value");
           		 	if(serverids.indexOf(value) >= 0){
           				$(this).attr("checked",true);	 	
           		 	}else{
           		 		$(this).attr("checked",false);
           		 	}
                     });
                     //取消双选全选
                     $("#selBut").attr("checked",false);
                     $("#backselBut").attr("checked",false);
          		 }
                
          	function delActivity(id){
          		if(confirm("确定删除吗?")){
          			window.location="<%=request.getContextPath()%>/activity/activityGodDel?&id="+id;
          		}
          	}
          	
            	
                </script>
                
                
		        <!--数据分页-->
		        <%--  <jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
		        	<jsp:param value="form1" name="formid"/>
		        </jsp:include> --%> 
            </div>
        </div>
    </form>

</body>
</html>