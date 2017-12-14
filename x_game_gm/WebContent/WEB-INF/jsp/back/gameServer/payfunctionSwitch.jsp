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
	
		
		
		function addSer(){
			art.dialog.open("<%= request.getContextPath()%>/gameServer/addServer", {
                width: '800px',
                height: '450px',
                title: "新增服信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.AddS();
                    return false;
                },
                cancel: true
            });
		}
		
		function updateSer(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要修改的服");
			}else if(idArray.length>1){
				alert("每次只能修改1个服");
			}else{
				var id = idArray[0];
				art.dialog.open("<%= request.getContextPath()%>/gameServer/updateServer?id="+id, {
	                width: '700px',
	                height: '450px',
	                title: "修改服信息",
	                opacity: 0.3,
	                skin: 'green',
	                lock: true,
	                ok: function (iframeWin, topWin) {
	                    // iframeWin: 对话框iframe内容的window对象
	                    // topWin: 对话框所在位置的window对象
	                    iframeWin.updateS();
	                    return false;
	                },
	                cancel: true
	            });
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
		})
		function closeF(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要关闭的渠道");
			}else if(idArray.length>1){
				alert("每次只能关闭1个渠道");
			}else{
				if(confirm('您确定要关闭该信息吗 ？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/gameServer/payfunctionSwitchOnOff?channelId="+id+"&ops="+1;
					
					window.location.href=url;			
				}
			}
		}
		function openF(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要开启的渠道");
			}else if(idArray.length>1){
				alert("每次只能开启1个渠道");
			}else{
				if(confirm('您确定要开启该渠道信息吗 ？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/gameServer/payfunctionSwitchOnOff?channelId="+id+"&ops="+0;
					
					window.location.href=url;			
				}
			}
		}
	</script>

</head>
<body class="easyui-layout">
 <form id="form1" method="post" action="<%=request.getContextPath()%>/gameServer/gameServer">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">服务器</span><span class="pl5">></span><span class="pl5">支付渠道开关</span></p>
                </div>
                <div class="function">
	                <input style="display:none;" id="btnOpenF" type="button" value="开启" class="btn_new commbtn" onclick="openF();" />
	                <input style="display:none;" id="btnCloseF" type="button" value="关闭" class="btn_new commbtn" onclick="closeF();" />
                </div> 
                 <!--数据分页-->
		         <jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
		        	<jsp:param value="form1" name="formid"/>
		        </jsp:include> 
                
                <!--搜索结果-->
               <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <thead>
                        <tr>
                            <th style="width:10px;">
                                <!-- <input type="checkbox" onclick="CheckAll(this, 'chkDeptIds')" /> --></th>
							<th style="width:100px;">渠道ID</th>
							<th style="width:100px;">名称</th>
							<th style="width:100px;">状态</th>
							<th style="width:100px;">是否强制充值</th>
							<th style="width:100px;">是否可关闭</th>
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
	                    <c:forEach items="${channelBeans}" var="ch" varStatus="statu">
	                        <tr>
	                            <td>
	                            	<c:if test="${ch.canTurnOff ==1}">
	                            		<input id="id0" type="checkbox" name="channelId" value="${ch.channelId}" />
	                            	</c:if>    	
	                            </td>
	                            <td>${ch.channelId}</td>
	                            <td>${ch.name }</td>
	                            
	                            <td>
	                            	<c:if test="${ch.status==1 }">
		                            	关闭
		                            </c:if>
		                            <c:if test="${ch.status!=1 }">
		                            	开启
	                            	</c:if>
	                            </td>
	                            <td>
	                            	<c:if test="${ch.forceRecharge ==1}">
	                            		是
	                            	</c:if>
	                            	<c:if test="${ch.forceRecharge ==0}">
	                            		否
	                            	</c:if>
	                            </td>
	                            <td>
		                            <c:if test="${ch.canTurnOff ==1}">
		                            		是
		                            </c:if>
		                            <c:if test="${ch.canTurnOff ==0}">
		                            		否
		                            </c:if>
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
	