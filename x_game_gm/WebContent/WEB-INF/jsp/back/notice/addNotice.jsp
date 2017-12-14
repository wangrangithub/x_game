<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
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
    
   <%--  <script src="<%=request.getContextPath()%>/resources/js/j/jquery.ext.js?20150605" type="text/javascript"></script>
    --%>
<%-- 	<script src="<%=request.getContextPath()%>/resources/js/j/jquery-ui-1.10.4.min.js?20150605" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/js/j/jquery.ext.js?20150605" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/js/j/tinyeditor.js?20150605" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/js/j/pony.js?20150605" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/js/j/admin.js?20151015" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/js/j/base.js?20150605" type="text/javascript"></script>
     --%>
   
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.format.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/demo/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/My97DatePicker/WdatePicker.js" language="javascript"></script>
	<script type="text/javascript">
	
	 
	
    	function addNotice(){
    		if ($('select[name="serverId"]').val() == '-1')
            {
                alert('请选择服!');
                return false;
            }
    		
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/notice/addNotice",
    			type:"post",
    			data:  $('#formadd').serialize(),
 				dataType: "json",
    			resetForm:false,
    			success:function(data){
    				if(data=="ok"){
    					//获取父窗口的window对象
    					var win = art.dialog.open.origin;  
    					//调用父窗口的js方法refresh();
    					win.refresh();
    					//关闭对话框
    					art.dialog.close();
    					alert("ok");
    				}else{
    					
    					alert(data);
    					
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("新增公告失败，请重试");
                } 
    		});
    	}
    	
    	
    	
    </script>

   
    
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="公告基本信息">
      
            <div class="dialog-table">
                <table id="ta" width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                    
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>选择服：</td>
                        <td class="white-tr">
                         <select class="select_gallery" name="serverId" style="width: 150px;">  
				            <optgroup label="服信息">  
								<option value="-1" >请选择</option>
							<c:forEach items="${serverList}" var="server">
								
								<option value="${server.sid }">${server.name }</option>
							
							</c:forEach>
  
				            </optgroup>  
				              
				        </select>  
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>生效时间：</td>
                        <td class="white-tr">
                         <input class="startDate Wdate" id="startDate" name="beginTimes" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}'})" value="${param.beginTime }"/>
                    	 
                        </td>
                    </tr>
                   
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>结束时间：</td>
                        <td class="white-tr">
                           <input class="endDate Wdate" name="endTimes" id="endDate" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2120-10-01'})" value="${param.endTime}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>默认语言：</td>
                        <td class="white-tr">
                            <select name="contentInfo[0].language">
                            	<option value="1">英语</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>公告内容：</td>
                        <td class="white-tr">
                           <textarea rows="15" cols="10" name="contentInfo[0].content"> 
                           
                           </textarea>
                        </td>
                    </tr> 
					 <tr id="pt">
                        <td width="100px"><span class="font01 pr5">*</span>添加更多语言：</td>
                        <td class="white-tr">
                          <!--   <input type="button" id="txtdeptname" value="添加" onclick="addEamilLine();" /> -->
                          <table border="0" id="emailTable">
							<tr>
								<td align="center"><input type="button" value="添加" onclick="addEamilLine();"></td>
								<td align="left">多语言模版</td>
							</tr>
						  </table>
						
                    	<textarea style="display:none" id="emailTr" class="email">
							<tr class="emaiTr{0}">
								<td align="center">
									<a id="tag" onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a>
								</td>
								<td align="left">
									公告类型:
									<select class="select" id="contentInfo[{0}].language" name="">
										<option value="zh-CN" selected="selected">中文-简体</option>
										<option value="zh-TW">中文-繁体</option>
										<option value="vi-VN">越南</option>
										<option value="ko-KR">朝鲜语&amp;韩语</option>
									</select>
									<br/><br/>
									公告内容:
									<textarea class="textarea" cols="80" rows="10" name="contentInfo[{0}].content" maxlength="2500"/>
									<br/>
									-------------------------------------华丽的分割线------------------------------------------
								</td>
							</tr>
						</textarea>
                    <script type="text/javascript">
							var emailIndex = 1;
							var emailIn = 1;
							//var emailTpl = $("#emailTr").val();
							var emailTpl = $("#emailTr").val();
							
							function addEamilLine() 
							{
							
				               // alert($.format($("#emailTr").val()));
								//alert(emailTpl);
								$('#emailTable').append(emailTpl);
								
								var indexs=0;
								$(".select").each(function(index){
									indexs=indexs+1;
									var sname="contentInfo["+indexs+"].language";
									$(this).attr("name",sname);
								});
								var ind=0;
								$(".textarea").each(function(index){
									ind=ind+1;
									var sname="contentInfo["+ind+"].content";
									$(this).attr("name",sname);
								});
								
								/* $("#emailTr>select").attr("name",t+(emailIndex++)+w);
								$("#emailTr>textarea").attr("name",t+(emailIn++)+c);
								alert(t+(emailIndex++)+w);
								alert($("#emailTr>select").attr("name",t+(emailIndex++)+w));
								 */
								//alert();
								
							}
							function re(tha){
								
								$(tha).parent().parent().remove();
								
							}
						</script>
                        </td>
                    </tr>
                    	
            </table>
            </div>
        </div>
    </div>
</form>	
</body>
</html>