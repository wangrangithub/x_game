<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/back/comm.css" />
	
	<!-- select2的插件 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/select2.min.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/select/select2.min.js"></script>
	
	
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
			var sta=$("#sta").val();
			var end=$("#end").val();
			//alert(idp);
			if(sta==null || end ==null ||sta=="" || end ==""){
	            alert('日期不能为空！');
	        }else{
				$("#"+formid).submit();
	        }
		}
		
		function refresh(){
			pageIndexChanging(1, "form1");
		}
		
	
		
		function addEmail(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要重发的邮件");
			}else if(idArray.length>1){
				alert("每次只能重发1个邮件");
			}else{
				if(confirm('您确定要重发该邮件信息吗 ？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/email/retySend?id="+id;
					
					window.location.href=url;			
				}
			}
			
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
		
		function deleteEmail(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要删除的邮件");
			}else if(idArray.length>1){
				alert("每次只能删除1个邮件");
			}else{
				if(confirm('您确定要删除该邮件信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					var sta = $("#sta").val();
					var end = $("#end").val();
					var serverId = $("#serverId").val();
					var url = "<%= request.getContextPath()%>/email/deleteEmail?id="+id+"&sta="+sta+"&end="+end+"&serverId="+serverId;
					
					window.location.href=url;	
					
				}
			}
			
			//checkError();
			
		}
		$(function(){
			
			var succ =$("#succ").val();
			if(succ="成功"&&succ!=null&&succ!=""){
				//alert(succ);
				var start = $("#start").val();
				var ends = $("#ends").val();
				var sta = $("#sta").val(start);
				var end = $("#end").val(ends);
				//$("#pageIndex").val(newPageIndex);
				
				pageIndexChanging(1, 'form1');
				
			}
		})
		
		
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
		
		function viewDetails(emailLangList){
			$.ajax({  
			    type: "get",  
			    url: "<%= request.getContextPath()%>/email/viewEmail",  
			    data: {emailLangList :JSON.stringify(emailLangList)},//将对象序列化成JSON字符串  
			    dataType:"json",  
			    contentType : 'application/json;charset=utf-8', //设置请求头信息  
			    success: function(data){  
			       alert(success);
			    },  
			    error: function(res){  
			    	alert(fail);
			    }  
			});  
			
			
		}
		
		
		function viewDetail(emailLangList) {
			var langs = new Array();
			/* for(var i =0;i<emailLangList.length;i++){
				langs[i]=
				
			} */
			
			$(".textarea").each(function(index){
				ind=ind+1;
				var sname="contentInfo["+ind+"].content";
				$(this).attr("name",sname);
			});
			var s = JSON.stringify(emailLangList);
			//var ss =JSON.toArray(emailLangList);
			//JSONArray jsonArray=JSONArray.fromObject(emailLangList);
			alert(s);
			var url = "<%= request.getContextPath()%>/email/viewEmail?emailLangList="+s;
			art.dialog.open(url, {
                width: '600px',
                height: '450px',
                title: "查看邮件信息",
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
		/* function hide(){  
		    var winNode = $("#win");  
		    winNode.hide();
		}  
		 */
		function viewEmail(){
			var idArray = getSelectionIds("tabledept");
			var id = idArray[0];
			var url = "<%= request.getContextPath()%>/email/viewEmail?id="+id;
			art.dialog.open(url, {
                width: '500px',
                height: '250px',
                title: "查看邮件信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.viewE();
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
			var succ =$("#succ").val();
			if(succ!=null&&succ!=""){
				
				alert(succ);
			}
			
			var winNode = $("#win");  
		    winNode.hide();
		})
		
	</script>

</head>
<body class="">
 <form id="form1" method="post" action="<%=request.getContextPath()%>/email/email">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">邮件相关</span><span class="pl5">></span><span class="pl5">邮件列表</span></p>
                </div>
                <!--功能按钮区域-->
                 <div class="function">
                    <input style="display:none;" id="btnAddEmail" type="button" value="重发" class="btn_new commbtn" onclick="addEmail()" />
                  <%--   <input style="display:none;" id="btnViewEmail" type="button" value="详情" class="btn_find commbtn" onclick='viewDetail("${email.emailLangHtml}");return false;' />
   --%>          <!--         <input style="display:none;" id="btnUpdateDept" type="button" value="修改维修登记" class="btn_edit commbtn" onclick="updateDept()" /> -->
                    <input style="display:none;" id="btnDeleteEmail" type="button" value="删除" class="btn_new commbtn" onclick="deleteEmail();" />
                </div> 
                <div class="clear"></div>
                
                <!--查询条件区域-->
                <div class="funsearch">
                    <div class="search_list">
                    	<!-- <span>维修登记名称：</span>
                    	<input name="deptName" type="text" class="search_txt" value="${param.deptName }" /> -->
                    	开始时间：
                    	<input id="sta"  name="createdatetimeStart" style="width: 120px;" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" value="${param.createdatetimeStart }" class="search_txt"  />-
                    	结束时间：
                    	<input id="end" name="createdatetimeEnd" style="width: 120px;" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" value="${param.createdatetimeEnd}" class="search_txt"  />
                       
                       	选择服：
                        <select class="select_gallery" name="serverId" style="width: 150px;">  
				            <optgroup label="服信息">  
								<option value="-1" >请选择</option>
							<c:forEach items="${serverList}" var="server">
								
								<option value="${server.sid }"  <c:if test="${param.serverId==server.sid }">selected="selected"</c:if>>${server.name }</option>
							
							</c:forEach>
  
				            </optgroup>  
				              
				        </select>   
                       <script type="text/javascript">  
					        $(".select_gallery-multiple").select2();  
					        $(".select_gallery").select2();  
					    </script>  
                    </div>
                    <%-- <input type="hidden" id="suc" value="${suc}"/>	 --%>
                    <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="搜索" />
                
                </div>
                <!--数据分页-->
		         <jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
		        	<jsp:param value="form1" name="formid"/>
		        </jsp:include>
		        <!-- 隐藏数据 -->
                  <input id="succ" type="hidden" value="${succ}" style="width: 120px;"  class="search_txt"  />
		          <input id="start" type="hidden" name="createdatetimeStart" value="${sta}" style="width: 120px;"  class="search_txt"  />
		          <input id="ends" type="hidden" name="createdatetimeEnd" value="${end}" style="width: 120px;"  class="search_txt"  />
		         
		         <!-- 服ID -->
		         <input id="serverId" type="hidden" name="serverId" value="${serverId}" style="width: 120px;"  class="search_txt"  />
		         
		         
		         
                <!--搜索结果-->
               <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <thead>
                        <tr>
                            <th style="width:60px;">
                                <input type="checkbox" onclick="CheckAll(this, 'chkDeptIds')" /></th>
                            <th style="width:80px;" >序号</th>
                            <th style="width:100px;">id</th>
                            <th style="width:100px;">创建时间</th>
							<th style="width:100px;">标题</th>
							<th style="width:100px;">0未删1已删</th>
							<th style="width:100px;">发布方式</th>
							<th style="width:100px;">0无附件1有</th>
							
							<th style="width:100px;">生效时间</th>
							<th style="width:100px;">结束时间</th>
							<th style="width:100px;">低等级</th>
							<th style="width:100px;">高等级</th>
							<th style="width:100px;">详情</th>
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel.dateList}" var="email" varStatus="status">
                        <tr>
                            <td>
                                <input id="id0" type="checkbox" name="chkDeptIds" value="${email.id }" /></td>
                            <td>${status.count}</td>                           
                           
                            <td>${email.id }</td>
                            <td>${email.createTimed }</td>
                            <td>${email.emailLangList[0].title }</td>
                            <td>${email.isDeleted }</td>
                            <td>${email.receivetype }</td>
                            
                             <td>${email.attachment }</td>
                             <td>${email.beginTime }</td>
                              <td>${email.endTime }</td>
                            <td>${email.level }</td>
                             <td>${email.levelmax }</td>
                             
                             
                            <td>
	                          <table class="table_list">
	                            	<c:forEach items="${email.emailLangList }" var="a">
		                            		<tr>
			                            		<td style="width:100px;">标题</td>
			                            		<td style="width:100px;">语言</td>
			                            		<td style="width:100px;">内容</td>
		                            		</tr>
		                            		<tr>
			                            		<td>${a.title}</td>
			                            		<td>${a.language}</td>
			                            		<td>${a.content}</td>
		                            		</tr>
	                           		 </c:forEach>
	                            </table>
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
	