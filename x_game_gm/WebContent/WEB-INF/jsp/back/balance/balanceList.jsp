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
			var server = $("#server").val();
			
			
			$("#"+formid).submit();
		}
		
		function refresh(){
			pageIndexChanging(1, "form1");
		}
		
	
		
		
		function Addbuff(){
			art.dialog.open("<%= request.getContextPath()%>/balance/addBuff", {
                width: '800px',
                height: '450px',
                title: "新增buff信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.AddBuff();
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
					var url = "<%= request.getContextPath()%>/Cdk/deleteCdk?id="+id+"&serverId="+serverId;
					
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
					var url = "<%= request.getContextPath()%>/Cdk/exportCdks?id="+id;
					window.location.href=url;			
				}
			}
			
			//checkError();
			
		}
		
		
		
		function changeState(id,state,serverId)
		{
			
			if(state == 0 ? window.confirm("上架活动？"):window.confirm("下架活动？")){
				
    			$.post(
    					"<%=request.getContextPath()%>/balance/changeState?id="+id+"&state="+state+"&serverId="+serverId,
    					{},
    					function(data){
    						if(data==1){
    							location.reload();
    						}
    					}
    				);
    			/* $.ajax({
	 				 type: "post",
	 	             url: "",
	 	             data: ,
	 	             dataType: "json",   				
    				 success:function(data){
    					 
    				 },error:function(data){
    					 
    				 }	
    				
    			});
    			 */
    			
    			
    			
			}else{
				return false;
			}
		}
		
		function updateBuff(){
			var idArray = getSelectionIds("tabledept");			
			if(idArray.length==0){
				alert("请选择要修改");
			}else if(idArray.length>1){
				alert("每次只能修改1个");
			}else{
				var id = idArray[0];
				art.dialog.open("<%=request.getContextPath()%>/balance/updateBuff?id="+id, {
	                width: '500px',
	                height: '250px',
	                title: "修改buff信息",
	                opacity: 0.3,
	                skin: 'green',
	                lock: true,
	                ok: function (iframeWin, topWin) {
	                    // iframeWin: 对话框iframe内容的window对象
	                    // topWin: 对话框所在位置的window对象
	                    iframeWin.updateBuff();
	                    return false;
	                },
	                cancel: true
	            });
			}
		}
		
		
		function deleteBuf(id,state,serverId)
		{
				//alert(id+state+serverId);
				var url = "<%= request.getContextPath()%>/balance/deleteBuff?id="+id+"&state="+state+"&serverId="+serverId;
				
				window.location.href=url;	
    			
		}
		
		
		
		
	</script>

</head>
<body class="easyui-layout">
 <form id="form1" method="post" action="<%=request.getContextPath()%>/balance/buffList">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">活动管理</span><span class="pl5">></span><span class="pl5">全局buff</span></p>
                </div>
                <!--功能按钮区域-->
               <div class="function">
                    <input style="display:none;" id="btnAddCdk" type="button" value="新增" class="btn_new commbtn" onclick="Addbuff()" />
                 
                    <input style="display:none;" id="btnUpdateBuff" type="button" value="修改" class="btn_new commbtn" onclick="updateBuff()" />
                   <!--  <input style="display:none;" id="btnDeleteCdk" type="button" value="删除" class="btn_del commbtn" onclick="deleteCdk();" />
                	 -->
                </div> 
                <div class="clear"></div>
                <!--查询条件区域-->
                <div class="funsearch">
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
                	
                </div>
                 <input id="succ" type="hidden" value="${succ}" style="width: 120px;"  class="search_txt"  />
		         
                
                <!--数据分页-->
		         <jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
		        	<jsp:param value="form1" name="formid"/>
		        </jsp:include> 
		        
		        <!-- 服serverId -->
		        
		         <input id="serverId" type="hidden" value="${serverId}" style="width: 120px;"  class="search_txt"  />
		        
                <input id="result" type="hidden" value="${result}" style="width: 120px;"  class="search_txt"  />
                <!--搜索结果-->
               <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <thead>
                        <tr>
                            <th style="width:60px;">
                                <input type="checkbox" onclick="CheckAll(this, 'chkDeptIds')" /></th>
                            <th style="width:80px;">序号</th>
                            <th style="width:100px;">活动ID</th>
							<th style="width:100px;">效果说明</th>
							<th style="width:100px;">开始时间</th>
							<th style="width:100px;">结束时间</th>
							<th style="width:100px;">状态</th>
							<th style="width:100px;">操作列</th>
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel.dateList}" var="buf" varStatus="status">
                        <tr>
                            <td>
                                <input id="id0" type="checkbox" name="chkDeptIds" value="${buf.id}" /></td>
                            <td>${status.count}</td> 
                            <td>${buf.id }</td>                  
                            <td>${buf.details }</td>
                            <td>${buf.startTime}</td>
                            <td>${buf.endTime }</td>
                            <td>
                             <c:choose>
							    <c:when test="${buf.hasPush==1&&buf.state==0}">
								已推送(预约中)
							    </c:when>  
							    <c:when test="${buf.hasPush==0 }">
								  未推送
							    </c:when>
							     <c:when test="${buf.state==2&&buf.hasPush==1 }">
								   过期
							    </c:when>
							     <c:when test="${buf.state==1&&buf.hasPush==1 }">
								   上线中
							    </c:when> 
							    
							</c:choose>
                              </td>
            				<td>
            				<a href="javascript:void(-1)" onclick="changeState('${buf.id}','0','${buf.serverId}')" class="pn-opt"> 推送服务器</a>
            				<a href="javascript:void(-1)" onclick="deleteBuf('${buf.id}','0','${buf.serverId}')" class="pn-opt"> 删除</a>
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
	