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
			if(isNaN(Number(idp))){
	            alert('请输入正确！');
	        }else{
				$("#"+formid).submit();
	        }
		}
		
		function refresh(){
			pageIndexChanging(1, "form1");
		}
		
	<%-- 	function AllotAuthority() {
	         art.dialog.open('<%= request.getContextPath()%>/jurisdiction/add.do', {
	             width: '800px',
	             height: '450px',
	             title: '新增权限',
	             skin: 'default',
	             lock: 'true',
	             ok: function (iframeWin, topWin) {
	                 alert("新增权限成功！");
	                 return true;
	             },
	             cancel: true
	         })
	     }

	     function CheckEdit(type) {
	         var delnumber = 0;
	         var itemID = null;
	         for (var i = 0; i < window.document.forms[0].length; i++) {
	             var e = form1.elements[i];
	             if (e.id != "CheckBoxAll") {
	                 if (e.checked == true) {
	                     delnumber = delnumber + 1;
	                     itemID = e.id;
	                     if (type == 'edit') {
	                         Edit();
	                     } else {
	                         AllotAuthority();
	                     }
	                     return;
	                 }
	             }
	         }
	         if (delnumber == 0) {
	             alert("请至少选择一项");
	             return false;
	         }

	     }
		
		
		 --%>
		
		
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
		
		function updateEmp(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要修改的权限");
			}else if(idArray.length>1){
				alert("每次只能修改1个权限");
			}else{
				var id = idArray[0];
				art.dialog.open("<%= request.getContextPath()%>/jurisdiction/update.do?id="+id, {
	                width: '700px',
	                height: '450px',
	                title: "修改权限信息",
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
				alert("请选择要删除的权限");
			}else if(idArray.length>1){
				alert("每次只能删除1个权限");
			}else{
				if(confirm('您确定要删除该权限信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/jurisdiction/delete.do?id="+id;
					
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
		})
		
	</script>

</head>
<body class="easyui-layout">
 <form id="form1" method="post" action="<%=request.getContextPath()%>/journal/commonJournal">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">角色管理</span><span class="pl5">></span><span class="pl5">封禁列表</span></p>
                </div>
                <!--功能按钮区域-->
                <!-- <div class="function">
                    <input style="display:none;" id="btnAddDept" type="button" value="新增维修登记" class="btn_new commbtn" onclick="addDept()" />
                    <input style="display:none;" id="btnViewDept" type="button" value="维修回执" class="btn_find commbtn" onclick="viewDept()" />
                    <input style="display:none;" id="btnUpdateDept" type="button" value="修改维修登记" class="btn_edit commbtn" onclick="updateDept()" />
                    <input style="display:none;" id="btnDeleteDept" type="button" value="删除维修登记" class="btn_del commbtn" onclick="deleteDept();" />
                </div> -->
                <div class="clear"></div>
                <!--查询条件区域-->
                <div class="funsearch">
                    <!-- <div class="search_list">
                    	<div class="search_list">
                         	请输入uid：
                    	<input  name="openID" style="width: 120px;"  class="search_txt"  />                 	
                
                         	请输入时长(最大43200分钟)：
                    	<input name="timelong" style="width: 120px;"  class="search_txt"  />
                      	  
                    </div> 	
                    <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="封禁用户" />
                  	<div class="search_list">
                         	请输入uid：
                    	<input  name="openID" style="width: 120px;"  class="search_txt"  />  
                    </div> 	
                    <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="解除封禁" />	
               -->  <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <!-- <thead>
                        <tr>
                            <th style="width:60px;">
                                <input type="checkbox" onclick="CheckAll(this, 'chkDeptIds')" /></th>
                            <th style="width:100px;">uid</th>
                            <th style="width:100px;">封禁截止时间</th>
                        </tr>
                    </thead> -->
                    <!--数据部分-->
                    <tbody>${banned}
                   <%-- <c:forEach items=" ${banned}" var="bann" varStatus="status">
                        <tr>
                            <td>${bann.uid}</td>                           
                            <td>${bann.blockEndTime}</td>
                        </tr>                        
                    </c:forEach>  --%>
                   </tbody>
                          </table>
		        <!--数据分页-->
		        <%--  <jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
		        	<jsp:param value="form1" name="formid"/>
		        </jsp:include>  --%>
               
            </div>
        </div>
    </form>

</body>
</html>
	