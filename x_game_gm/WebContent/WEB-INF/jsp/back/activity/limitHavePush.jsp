<jsp:useBean id="dateObject" class="java.util.Date" scope="page"></jsp:useBean>
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
    <form id="form1" method="" action="<%= request.getContextPath()%>/activity/limithavePush">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>管理平台<span class="pl5">></span><span class="pl5">精彩活动管理</span><span class="pl5">></span><span class="pl5">已推送的特殊活动</span></p>
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
                            <th style="width:80px;">活动ID</th>
                            <th style="width:80px;">活动名称</th>
                            <th style="width:100px;">开始时间</th>
                            <th style="width:100px;">结束时间</th>
                            <th style="width:100px;">状态</th>
                            <th style="width:100px;">已推送的服</th>
                            
                           
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel}" var="have" varStatus="status">
                    
                        <tr>
                           <td>${have.actId}</td>
                           <td><c:if test="${have.actType==2001}">财神投注活动</c:if></td>
                           <td>
                           		
                           		<jsp:setProperty property="time" name="dateObject" value="${have.beginTime}" />
								<fmt:formatDate value="${dateObject}" pattern="yyyy-MM-dd HH:mm:ss" />
									
                           </td>
                           <td>
                           		
                           		<jsp:setProperty property="time" name="dateObject" value="${have.endTime}" />
								<fmt:formatDate value="${dateObject}" pattern="yyyy-MM-dd HH:mm:ss" />
                           </td>
                           <td>
                           	 <c:choose>
							    <c:when test="${have.status==0 }">
								   暂停
							    </c:when>  
							     <c:when test="${have.status==1}">
								   进行中
							    </c:when> 
							      <c:when test="${have.status==3}">
								 	准备中
							    </c:when>
							    <c:otherwise>
								   过期
								</c:otherwise>
							</c:choose>
                           </td>
                           <td>
								${have.serverIdList }
							</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </form>

</body>
</html>