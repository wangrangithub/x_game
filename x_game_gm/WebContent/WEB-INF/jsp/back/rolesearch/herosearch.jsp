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
			var idp=$("#inp").val();
			//alert(idp);
			if(isNaN(Number(idp)) ||idp==null || idp==""){
	            alert('请输入正确！');
	        }else{
				$("#"+formid).submit();
	        }
		}
		
		function refresh(){
			pageIndexChanging(1, "form1");
		}
		
	
		
		function Add(){
			art.dialog.open("<%= request.getContextPath()%>/jurisdiction/add.do", {
                width: '800px',
                height: '450px',
                title: "新增权限信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.Add();
                    return false;
                },
                cancel: true
            });
		}
		
		function updateHero(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要修改的武将");
			}else if(idArray.length>2){
				alert("每次只能修改1个武将");
			}else{
				var id = idArray[0];
				//alert(id);
				//var hid = idArray[1].attr("heroid");
				var hid = idArray[1];
				var serverId =$("#serverId").val();
				//alert(hid);
				art.dialog.open("<%= request.getContextPath()%>/rolesearch/updateHero?id="+id+"&hid="+hid+"&serverId="+serverId, {
	                width: '700px',
	                height: '450px',
	                title: "修改武将信息",
	                opacity: 0.3,
	                skin: 'green',
	                lock: true,
	                ok: function (iframeWin, topWin) {
	                    // iframeWin: 对话框iframe内容的window对象
	                    // topWin: 对话框所在位置的window对象
	                    iframeWin.updateH();
	                    return false;
	                },
	                cancel: true
	            });
			}
		}
		
		function deleteHero(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要删除的武将");
			}else if(idArray.length>2){
				alert("每次只能删除1个武将");
			}else{
				if(confirm('您确定要删除该武将信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					var hid = idArray[1];
					var serverId =$("#serverId").val();
					//alert(hid);
					var url = "<%= request.getContextPath()%>/rolesearch/deleteHero?id="+id+"&hid="+hid+"&serverId="+serverId;
					
					window.location.href=url;			
		}
			}
			
			//checkError();
			
		}
		
		
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
		})
		
	</script>

</head>
<body class="">
 <form id="form1" method="post" action="<%=request.getContextPath()%>/rolesearch/herosearch">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">角色管理</span><span class="pl5">></span><span class="pl5">武将查询</span></p>
                </div>
                <!--功能按钮区域-->
                <div class="function">
                    <input style="display:none;" id="btnAddDept" type="button" value="新增维修登记" class="btn_new commbtn" onclick="addDept()" />
                    <input style="display:none;" id="btnViewDept" type="button" value="维修回执" class="btn_find commbtn" onclick="viewDept()" />
                    <input style="display:none;" id="btnUpdateHero" type="button" value="修改武将信息" class="btn_edit commbtn" onclick="updateHero()" />
                    <input style="display:none;" id="btnDeleteHero" type="button" value="删除武将" class="btn_del commbtn" onclick="deleteHero();" />
                </div> 
                <div class="clear"></div>
                <!--查询条件区域-->
                <div class="funsearch">
                    <div class="search_list">
                    	  	请输入id：
                    	<input id="inp"  name="id" style="width: 120px;" value="${param.id }"  class="search_txt"  />                 	
                    
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
                    <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="武将查询" />
                	
                </div>
                
                
                 <!-- 服ID -->
                <input id="serverId"  name="" type="hidden" style="width: 120px;" value="${serverId}" class="search_txt"  />               	
                 
                
                
                
                <!--搜索结果-->
               <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <thead>
                        <tr>
                            <th style="width:60px;">
                                <input type="checkbox" onclick="CheckAll(this, 'chkDeptIds')" /></th>
                            <th style="width:80px;">序号</th>
                            <th style="width:80px;">序号</th>
                            <th style="width:100px;">uid</th>
                            <th style="width:100px;">英雄id</th>
							<th style="width:100px;">level</th>
							<th style="width:100px;">经验</th>
							<th style="width:100px;">压力</th>
							<th style="width:100px;">是否觉醒</th>
							<th style="width:100px;">品质</th>
							<th style="width:100px;">符文信息</th>
							<th style="width:100px;">装备信息</th>
							
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                   <c:forEach items="${pageModel.dateList}" var="all" varStatus="status">
                        <tr>
                         <input id="i" type="hidden" name="her" value="${all.heroId }" />
                            <td>
                                <input id="id0" type="checkbox" name="chkDeptIds" heroid="${all.heroId}" value="${all.uid }" /></td>
                              
                           <td>
                           <input id="id0" type="checkbox" name="chkDeptIds" heroid="${all.heroId}" value="${all.heroId }" /></td>
                          
                             </td>
                                
                            <td>${status.count}</td>
                            <td>${all.uid}</td>                           
                            <td>${all.heroId}</td>
                            <td>${all.level }</td>
                            <td>${all.exp }</td>
  
                            <td>${all.pressure}</td>
                            <td>${all.awaken }</td>
                            <td>${all.quality }</td>
                            <td>${all.runeInfoList }</td>
                            <td>${all.equipInfoList }</td>
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
	