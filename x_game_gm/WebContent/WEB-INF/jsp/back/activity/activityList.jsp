<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
	
		<%-- $(function(){
			
			var msg = '<%= request.getAttribute(ResourceKeys.ALERT_MESSAGE)==null ? "":request.getAttribute(ResourceKeys.ALERT_MESSAGE).toString()%>';
			if(msg!=""){
				alert(msg);
			}
		}); --%>
		
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
		
		function addRoleActivity()
		{
			var value = document.getElementById("activityType").options[document.getElementById("activityType").selectedIndex].value;
			if(value != "0"){
				//跳转到添加
				<%-- window.location="<%=request.getContextPath()%>/activityAdd?typeid="+value; --%>
				art.dialog.open("<%=path%>/activity/activityAdd?typeid="+value, {
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
 			var actTypeOFF =$("#actTypeOFF").val();
 			if(actTypeOFF!=null&&actTypeOFF!=""){
				showActivity(actTypeOFF);
 			}
 			
		});
	</script>

</head>
<body>
    <form id="form1" method="" action="">
        <div class="container">
            <div class="content">
                <input id="result"  name="" type="hidden" style="width: 120px;" value="${result}" class="search_txt"  />               	
                <input id="actResult"  name="" type="hidden" style="width: 120px;" value="${actResult}" class="search_txt"  />               	
                <input id="actTypeOFF"  name="" type="hidden" style="width: 120px;" value="${actTypeOFF}" class="search_txt"  />               	
                <input type="hidden"  class="" id="fals"  name="" value="${fals}"/>
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>管理平台<span class="pl5">></span><span class="pl5">精彩活动</span><span class="pl5">></span><span class="pl5">精彩活动</span></p>
                </div>
                <!--功能按钮区域-->
                <div class="function">
                  <%--   <input style="display:none;" id="btnAddEmp" type="button" value="添加新活动" class="btn_new commbtn" onclick="addAct()" src="<%=request.getContentType() %>/Emp/add.do"/>
                  --%>   <!-- <input style="display:none;" id="btnUpdateEmp" type="button" value="修改员工" class="btn_edit commbtn" onclick="updateEmp()" />
                    <input style="display:none;" id="btnDeleteEmp" type="button" value="删除员工" class="btn_del commbtn" onclick="deleteEmp();" />
        -->        添加新活动
					<select onchange="addRoleActivity()" id="activityType">
						<option value="0">请选择</option>
		                <option value="1001">每日充值</option>
		                <option value="1002">充值返利</option>
		                <option value="1003">等级达标</option>
		                <option value="1006">招募达标</option>
		                <option value="1010">登录达标</option>
		                <option value="1004">竞技场达标</option>
		                <option value="1007">充值循环达标</option>
		                <option value="1005">神秘商城达标</option>
		                <option value="1011">芯片装备达标</option>
		                <option value="1012">幸存者星级达标</option>
		                <option value="1008">钻石消费循环达标</option>
		                <option value="1009">累计消费钻石达标</option>
		                <option value="1013">活动获得指定幸存者</option>
		                <option value="1014">关卡进度达标(普通关卡)</option>
		                <option value="1015">关卡进度达标(工业区)</option>
					</select>
        				
        
        
        
       			  </div>	
                <div class="clear"></div>
                <!--查询条件区域-->
                <div class="funsearch">
                   <%--  <div class="search_list">
                    	<span>员工名称：</span>
                    	<input name="adminname" type="text" class="search_txt" value="${param.adminname }" />
                    </div>
                    <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="搜索" />
              --%>   </div>
                <!--搜索结果-->
                <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <thead>
                    
                        <tr>
                           <!--  <th style="width:60px;">
                                <input type="checkbox" onclick="CheckAll(this, 'chkDeptIds')" /></th> -->
                            <th style="width:80px;">序号</th>
                            <th style="width:80px;">活动类型名称</th>
                            <th style="width:100px;">排序</th>
                            <th style="width:100px;">热门状态</th>
                            <th style="width:100px;">操作列</th>
                           
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel.dateList}" var="emp" varStatus="status">
                    
                        <tr>
                            <%-- <td>
                                <input id="id0" type="checkbox" name="chkDeptIds" value="${emp.actId }" /></td>
                           	<td> --%>
                           <td>	
                           	<input type="button" onclick="showActivity(${emp.actId })" id="button${emp.actId }" value="显示活动">
                           	
                           	${status.count}</td>
                           	<td>${emp.actName}</td>
                           <td>${emp.actSort}</td>
                           <td>
                           <c:if test="${emp.actHotStatus==0}">
                            	无
                            </c:if>
                           	<c:if test="${emp.actHotStatus==1}">
                            	热销
                            </c:if>
                            <c:if test="${emp.actHotStatus==2 }">
                            	限时
                            </c:if>
                            <c:if test="${emp.actHotStatus==3 }">
                            	新
                            </c:if>
                            <c:if test="${emp.actHotStatus==4}">
                            	推荐
                            </c:if>
                           	
                           
                           </td>
                           <td>
                           
                           <a href="<%= request.getContextPath()%>/activity/update?aid=${emp.actId}">修改</a>
                           </td>
                           
                        </tr>
                        <tr height="5px">
			   				<td colspan="5">
		                        <div id="div${emp.actId }" style="display: none">
							   				<table cellspacing="0" cellpadding="0" border="0" class="table_list">
					                           <!--  <th style="width:80px;">活动类型ID</th> -->
					                            <th style="width:80px;">活动名称</th>
					                            <th style="width:100px;">是否开启模板</th>
					                            <th style="width:100px;">开始时间</th>
					                            <th style="width:100px;">结束时间</th>
					                            <th style="width:100px;">状态</th>
					                            <th style="width:100px;">操作列</th>
												<c:forEach items="${emp.activityInfoList}" var="actInfo" >
													<tr>
														<input name="activityId" type="hidden" id="activityId" value="${actInfo.actId}" onclick="showservers(',61261003,80411003,')">
														<td>${actInfo.actInfoName }</td>
														<td>${actInfo.isOpenTmpl }</td>
														<td>${actInfo.actInfoStartTime }</td>
														<td>${actInfo.actInfoEndTime }</td>
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
										   					<input type="button" onclick="javaScript:window.location='<%= request.getContextPath()%>/activity/activityEdit?actInfoId=${actInfo.actInfoId}&amp;actId=${actInfo.actId}'" value="编辑">
										   					<input type="button" onclick="javaScript:window.location='<%= request.getContextPath()%>/activity/activityCopy?actInfoId=${actInfo.actInfoId}&amp;actId=${actInfo.actId}'" value="复制">
										   					<input type="button" onclick="delActivity(${actInfo.actInfoId})" value="删除">
										   					
										   					<input type="button" onclick="javaScript:window.location='<%= request.getContextPath()%>/activity/pushActivity?actInfoId=${actInfo.actInfoId}&amp;actId=${actInfo.actId}'" value="推送">
										   					<input type="button" onclick="javaScript:window.location='<%= request.getContextPath()%>/activity/recoveryActivity?actInfoId=${actInfo.actInfoId}&amp;actId=${actInfo.actId}'" value="收回">
										   					
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
            			 window.location="<%= request.getContextPath()%>/activity/activityDel?&id="+id; 
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