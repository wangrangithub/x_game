<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		
		function updateSta(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要修改的服");
			}else{
				//var id = idArray[0];
				//alert(idArray);
				art.dialog.open("<%= request.getContextPath()%>/gameServer/batchUpdateState?ids="+idArray, {
	                width: '700px',
	                height: '450px',
	                title: "修改服状态",
	                opacity: 0.3,
	                skin: 'green',
	                lock: true,
	                ok: function (iframeWin, topWin) {
	                    // iframeWin: 对话框iframe内容的window对象
	                    // topWin: 对话框所在位置的window对象
	                    iframeWin.updateSta();
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
		});
		function deleteSer(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要删除的服");
			}else if(idArray.length>1){
				alert("每次只能删除1个服");
			}else{
				if(confirm('您确定要删除该服信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/gameServer/deleteServer?id="+id;
					
					window.location.href=url;			
				}
			}
		} 
		
		
	</script>

</head>
<body class="">
 <form id="form1" method="" action="<%=request.getContextPath()%>/gameServer/gameServer">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">服务器</span><span class="pl5">></span><span class="pl5">服务器列表</span></p>
                </div>
                <!--功能按钮区域-->
               <div class="function">
                    <input style="display:none;" id="btnAddSer" type="button" value="新增服" class="btn_new commbtn" onclick="addSer()" />
                    <input style="display:none;" id="btnViewDept" type="button" value="维修回执" class="btn_find commbtn" onclick="viewDept()" />
                    <input style="display:none;" id="btnUpdateSer" type="button" value="修改服" class="btn_new commbtn" onclick="updateSer()" />
                    <input style="display:none;" id="btnUpdateSta" type="button" value="批量改状态" class="btn_new commbtn" onclick="updateSta()" />
                    <input style="display:none;" id="btnDeleteSer" type="button" value="删除服" class="btn_new commbtn" onclick="deleteSer();" />
                </div> 
                <!--查询条件区域-->
                <%-- <div class="funsearch">
                    <div class="search_list">
                    	<!-- <span>维修登记名称：</span>
                    	<input name="deptName" type="text" class="search_txt" value="${param.deptName }" /> -->
                    	开始时间：
                    	<input  name="createdatetimeStart" style="width: 120px;" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" value="${param.createdatetimeStart }" class="search_txt"  />-
                    		  
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
                            <th style="width:60px;">
                                <input type="checkbox" onclick="CheckAll(this, 'chkDeptIds')" /></th>
                            <th style="width:80px;">序号</th>
                        
                            
							<th style="width:100px;">服务器名称</th>
							<th style="width:100px;">分布服务器</th>
							 <th style="width:100px;">状态</th> 
							
							<th style="width:100px;">服务器承载状态</th>
							<th style="width:100px;">服务器状态</th>
							<th style="width:100px;">服务器特殊状态</th>
							<th style="width:100px;">服务器区</th>
							<th style="width:100px;">服务器默认状态</th> 
							<th style="width:100px;">开始时间</th> 
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel.dateList}" var="g" varStatus="statu">
                        <tr>
                            <td>
                                <input id="id0" type="checkbox" name="chkDeptIds" value="${g.sid }" /></td>
                            <td>${g.sid}</td>                           
                        
                        
                            <td>${g.name}</td>
                            <td>${g.url }</td>
                            <td><c:if test="${g.status==1 }">
                            	开启
                            	</c:if>
                            	<c:if test="${g.status!=1 }">
                            	关闭
                            </c:if>
                            </td> 
                            <td>
                            <c:if test="${g.loadStatus==1 }">
                            	维护
                            </c:if>
                            <c:if test="${g.loadStatus==2 }">
                            	流畅
                            </c:if>
                            <c:if test="${g.loadStatus==3 }">
                            	火爆
                            </c:if>
                            <c:if test="${g.loadStatus!=2 && g.loadStatus!=1 && g.loadStatus!=3}">
                            	未设置
                            </c:if>
                            </td>
                             <td>
                            <c:choose>
							    <c:when test="${g.serverStatus==1 }">
								  测试服
							    </c:when>  
							    <c:when test="${g.serverStatus==2  }">
								正式服
							    </c:when>
							     
							    <c:otherwise>
								暂未
								</c:otherwise>
							</c:choose>
                            
                            </td> 
                            <td>
                            <c:choose>
							    <c:when test="${g.specialStatus=='1' || g.specialStatus=='1-0'}">
								 推荐
							    </c:when>  
							    <c:when test="${g.specialStatus=='2' || g.specialStatus=='0-1' }">
								新服
							    </c:when>
							    <c:when test="${g.specialStatus=='1-1'  }">
								推荐、新服
							    </c:when>
							    <c:otherwise>
								暂未
								</c:otherwise>
							</c:choose>
                            
                            </td>
                            <td>${g.serverArea }区</td>
                          <td>
                           		<c:if test="${g.defaultStatus==1 }">
                            	默认服务器
                            	</c:if>
                           		<c:if test="${g.defaultStatus!=1 }">
                            	非默认服务器
                            	</c:if>
                           </td>
                            <td>
                           		<input type="hidden" value="${(g.beginTime)/(60*60*24) }" id="time"/>
                           		 ${(g.data)}
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
	