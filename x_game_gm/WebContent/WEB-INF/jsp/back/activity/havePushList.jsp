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
		
		function addEmp(){
			art.dialog.open("<%=path%>/adminuser/add.do", {
                width: '500px',
                height: '450px',
                title: "新增员工信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.addEmp();
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
	</script>

</head>
<body class="easyui-layout">
    <form id="form1" method="" action="<%= request.getContextPath()%>/activity/havePush">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>管理平台<span class="pl5">></span><span class="pl5">精彩活动管理</span><span class="pl5">></span><span class="pl5">已推送</span></p>
                </div>
                <!--功能按钮区域-->
               <%--  <div class="function">
                    <input style="display:none;" id="btnAddEmp" type="button" value="新增员工" class="btn_new commbtn" onclick="addEmp()" src="<%=request.getContentType() %>/Emp/add.do"/>
                    <input style="display:none;" id="btnUpdateEmp" type="button" value="修改员工" class="btn_edit commbtn" onclick="updateEmp()" />
                    <input style="display:none;" id="btnDeleteEmp" type="button" value="删除员工" class="btn_del commbtn" onclick="deleteEmp();" />
                </div> --%>
                <div class="clear"></div>
                <!--查询条件区域-->
                <div class="funsearch">
                  <%--   <div class="search_list">
                    	<span>员工名称：</span>
                    	<input name="adminname" type="text" class="search_txt" value="${param.adminname }" />
                    </div>
                    <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="搜索" />
        --%>         </div>
                <!--搜索结果-->
                <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <thead>
                    
                        <tr>
                            <th style="width:80px;">活动类型ID</th>
                            <th style="width:80px;">活动名称</th>
                            <th style="width:100px;">开始时间</th>
                            <th style="width:100px;">结束时间</th>
                            <th style="width:100px;">状态</th>
                            <th style="width:100px;">所属活动类型</th>
                            <th style="width:100px;">已推送的服</th>
                            
                           
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel.dateList}" var="have" varStatus="status">
                    
                        <tr>
                           <%-- 	<td>${(clients.pageIndex-1)*clients.pageSize+status.index+1 }</td> --%>
                           	<td>${have.actInfoId}</td>
                           <td>${have.actInfoName}</td>
                           <td>${have.actInfoStartTime}</td>
                           <td>${have.actInfoEndTime}</td>
                           <td>
									 <c:choose>
							    <c:when test="${have.state==-1 }">
								   暂停
							    </c:when>  
							    <%-- <c:when test="${have.state==0 }">
								   预约中
							    </c:when> --%>
							     <c:when test="${have.state==1&&have.hashPush==1 }">
								   进行中
							    </c:when>
							     <c:when test="${have.state==1&&have.hashPush==0 }">
								   准备中
							    </c:when>
							    <c:otherwise>
								过期
								</c:otherwise>
							</c:choose>

								</td>
								<td>
									<select name="actId" disabled="disabled">
		                        		<option <c:if test="${have.actId==1001}">selected="selected"</c:if> value="1001">每日充值</option>
		                        		<option <c:if test="${have.actId==1002}">selected="selected"</c:if> value="1002">充值返利</option>
		                        		<option <c:if test="${have.actId==1003}">selected="selected"</c:if> value="1003">等级达标</option>
		                        		<option <c:if test="${have.actId==1004}">selected="selected"</c:if> value="1004">竞技场达标</option>
		                        		<option <c:if test="${have.actId==1005}">selected="selected"</c:if> value="1005">神秘商城达标</option>
		                        		<option <c:if test="${have.actId==1006}">selected="selected"</c:if> value="1006">招募达标</option>
		                        		<option <c:if test="${have.actId==1007}">selected="selected"</c:if> value="1007">充值达标</option>
		                        		<option <c:if test="${have.actId==1008}">selected="selected"</c:if> value="1008">钻石消费循环达标</option>
		                        		<option <c:if test="${have.actId==1009}">selected="selected"</c:if> value="1009">累计消费钻石达标</option>
		                        		<option <c:if test="${have.actId==1010}">selected="selected"</c:if> value="1010">登陆达标</option>
		                        		<option <c:if test="${have.actId==1011}">selected="selected"</c:if> value="1011">芯片装备达标</option>
		                        		<option <c:if test="${have.actId==1012}">selected="selected"</c:if> value="1012">幸存者星级达标</option>
		                        		<option <c:if test="${have.actId==1013}">selected="selected"</c:if> value="1013">活动获得指定幸存者</option>
		                        		<option <c:if test="${have.actId==1014}">selected="selected"</c:if> value="1014">关卡进度达标(普通关卡)</option>
		                        		<option <c:if test="${have.actId==1015}">selected="selected"</c:if> value="1015">关卡进度达标(工业区)</option>
		                   
		                        	</select>
									
								</td>
								
								
                           <td>
							<c:forEach items="${serverList}" var="server">
								
							 <c:if test="${have.serverId==server.sid }">${server.name }</c:if>
							
							</c:forEach>
						</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
		        <!--数据分页-->
		         <jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
		        	<jsp:param value="form1" name="formid"/>
		        </jsp:include> 
            </div>
        </div>
    </form>

</body>
</html>