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
				alert("请选择要关闭的服");
			}else if(idArray.length>1){
				alert("每次只能关闭1个服");
			}else{
				if(confirm('您确定要关闭该服信息吗 ？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/gameServer/openFunction?id="+id+"&ops="+0;
					
					window.location.href=url;			
				}
			}
		}
		function openF(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要开启的服");
			}else if(idArray.length>1){
				alert("每次只能开启1个服");
			}else{
				if(confirm('您确定要开启该服信息吗 ？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/gameServer/openFunction?id="+id+"&ops="+1;
					
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
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">服务器</span><span class="pl5">></span><span class="pl5">功能开关</span></p>
                </div>
                <!--功能按钮区域-->
              <!--  <div class="function">
                    <input style="display:none;" id="btnAddSer" type="button" value="新增服" class="btn_new commbtn" onclick="addSer()" />
                    <input style="display:none;" id="btnViewDept" type="button" value="维修回执" class="btn_find commbtn" onclick="viewDept()" />
                    <input style="display:none;" id="btnUpdateSer" type="button" value="修改服" class="btn_edit commbtn" onclick="updateSer()" />
                    <input style="display:none;" id="btnDeleteSer" type="button" value="删除服" class="btn_del commbtn" onclick="deleteSer();" />
                </div>  -->
                <div class="function">
                <input style="display:none;" id="btnOpenF" type="button" value="开启" class="btn_new commbtn" onclick="openF();" />
                <input style="display:none;" id="btnCloseF" type="button" value="关闭" class="btn_new commbtn" onclick="closeF();" />
                </div> 
                <div class="clear"></div>
                <!--查询条件区域-->
                <%-- <div class="funsearch">
                    <div class="search_list">
                    	<!-- <span>维修登记名称：</span>
                    	<input name="deptName" type="text" class="search_txt" value="${param.deptName }" /> -->
                    	开始时间：
                    	<input  name="createdatetimeStart" style="width: 120px;" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" value="${param.createdatetimeStart }" class="search_txt"  />-
                    	结束时间：
                    	<input name="createdatetimeEnd" style="width: 120px;" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" value="${param.createdatetimeEnd}" class="search_txt"  />
                    	用户ID：
                    	<input name="id" style="width: 120px;" value="${param.id}" class="search_txt"  />
                    	  好友uid：
                    	<input name="fid" style="width: 120px;" value="${param.fid}" class="search_txt"  />
                    	  原因 ：
                    	<input name="res" style="width: 120px;" value="${param.res}" class="search_txt"  />
                    	  	  
                    </div> --%>
                    	
                   <%--  <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="搜索" />
                	<a href="<%= request.getContextPath()%>/journal/friendExport.do?createdatetimeStart=${createdatetimeStart}&createdatetimeEnd=${createdatetimeEnd}&id=${id}&fid=${fid}&res=${res}" class="btn_new commbtn">
	 						<span class="Hui-iconfont"> 导出到Excel</span></a>
                </div> --%>
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
                                <input type="checkbox" onclick="CheckAll(this, 'chkDeptIds')" /></th>
                            <th style="width:10px;">序号</th>
                        
                            
							<th style="width:100px;">服务器名称</th>
							<th style="width:100px;">功能编号</th>
							<th style="width:100px;">参数</th>
							<th style="width:100px;">分布服务器</th>
							
							
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel.dateList}" var="f" varStatus="statu">
                        <tr>
                            <td>
                                <input id="id0" type="checkbox" name="chkDeptIds" value="${f.moduleName}" /></td>
                            <td>${statu.count}</td>                           
                        
                        
                            <td>${f.displayName}</td>
                            <td>${f.number }</td>
                             <td>${f.parameter }</td>
                             <td><c:if test="${f.swithOn==1 }">
                            	开启
                            	</c:if>
                            	<c:if test="${f.swithOn!=1 }">
                            	关闭
                            </c:if></td>
                        </tr>                        
                    </c:forEach>
                    
                    </tbody>
                </table>
		        
            </div>
        </div>
    </form>

</body>
</html>
	