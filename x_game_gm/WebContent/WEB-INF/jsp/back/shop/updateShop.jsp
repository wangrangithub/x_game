<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/demo/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/My97DatePicker/WdatePicker.js" language="javascript"></script>
	<script type="text/javascript">
    	function updates(){
    	/* 	var array = new Array();
	 	    $("[class='check']:checked").each(function () {
	 	    	array.push($(this).val());
	 	    })
	 	    if (array.length == 0)
	            {
	                alert('请选择服!');
	                return false;
	            } */
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/shop/updateOff",
    			type:"post",
    			resetForm:false,
    			success:function(data){
    				if(data=="ok"){
    					//获取父窗口的window对象
    					var win = art.dialog.open.origin;  
    					//调用父窗口的js方法refresh();
    					win.refresh();
    					//关闭对话框
    					art.dialog.close();
    				}else{
    					
    					alert(data);
    					
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("修改活动失败，请重试");
                } 
    		});
    	}
    	
    	function show(input){
    		if(input.value == 1){
    			$("#act_id").val("");
    			$("#act_id").attr("disabled","disabled");
    		}else{
    			$("#act_id").removeAttr("disabled");
    		}
    			
    	}
    	function hidePrice(select) {
    		if (select.value == -1) {
    			$("#hbjia").val("");
    			$("#hbjia").attr("disabled", "disabled");
    		} else {
    			$("#hbjia").removeAttr("disabled");
    		}

    	}
    	
    	function hidePrice(select) {
    		if (select.value == -1) {
    			$("#hbjia").val("");
    			$("#hbjia").attr("disabled", "disabled");
    		} else {
    			$("#hbjia").removeAttr("disabled");
    		}

    	}
	   	$(function(){
			//$("#formadd").validate();
			var id = $("#act_id").val();
			//alert(id);
			if(id>0){
				$("[name=tim]:odd").attr('checked',true);
			}else{
				$("[name=tim]:even").attr('checked',true);
				$("#act_id").attr("disabled","disabled");
				$("#act_id").val("");
			}
		})
   </script>
    
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="活动基本信息">
      <input type="hidden" class="form-text" id="txtdeptname" name="id" value="${shop.id}"/>
      <input type="hidden" class="form-text" id="txtdeptname" name="state" value="${shop.state}"/>
      <input type="hidden" class="form-text" id="txtdeptname" name="hasPush" value="${shop.hasPush}"/>
      <input type="hidden" class="form-text" id="txtdeptname" name="type1" value="${shop.type}"/>
            <div class="dialog-table"><table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tk_table">
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动名称：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="act_name" value="${shop.act_name}"/>
                        </td>
                    </tr>
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>商品ID：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="tmplId" value="${shop.tmplId}"/>
                        </td>
                    </tr>
                   
                   
                   <tr>
                        <td width="100px"><span class="font01 pr5">*</span>可视条件：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="visableCond" value="${shop.visableCond}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>购买限制：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="purchaseLimit" value="${shop.purchaseLimit}"/>
                        </td>
                    </tr> 
                    <tr>
                        <td class="white-tr">
                        <input type="radio"  <c:if test="${shop.bgActive==1 }">checked="checked"</c:if>   class="" id="txtdeptname" onclick="selectFuJian()" value="1" name="bgActive" />出现活动曝光
                        <input type="radio"  <c:if test="${shop.bgActive==0 }">checked="checked"</c:if>  class="" id="txtdeptname" onclick="selectFuJian()" value="0" name="bgActive" />无活动曝光
                  		</td>
                    </tr>
	<script type="text/javascript">
                    function selectFuJian() {
                		var way = $("input[name='bgActive']:checked").val();
                		if (way == 1) {
                			$('#tr-attachments').show();
                			$('#attachTable').show();
                			$('#tr-attach').show();
                			$('#bgTable').show();
                		} else {
                			$('#tr-attachments').hide();
                			$('#attachTable').hide();
                			$('#tr-attach').hide();
                			$('#bgTable').hide();
                		}
                	}
                    
                    $(function(){
                    	var way = $("input[name='bgActive']:checked").val();
                		if (way == 1) {
                			$('#tr-attachments').show();
                			$('#attachTable').show();
                			$('#tr-attach').show();
                			$('#bgTable').show();
                		} else {
                			$('#tr-attachments').hide();
                			$('#attachTable').hide();
                			$('#tr-attach').hide();
                			$('#bgTable').hide();
                		}
                    	
                    	
                    });
                    
                    $(function(){
                    	var type = $("input[name='type1']").val();
                    	
                    	$("#selTypeId").find("option[value='"+type+"']").attr("selected",true);
                    	
                    	if (type == -1) {
                			$("#hbjia").val("");
                			$("#hbjia").attr("disabled", "disabled");
                		} else {
                			$("#hbjia").removeAttr("disabled");
                		}
                    
                    })
                    
		</script>
	                 
                    	<table id="attachTable" width="100%" 
									class="tk_table">
							<tr >
		                        <td width="100px"><span class="font01 pr5">*</span>活动展示位：</td>
		                        <td class="white-tr">
		                            <input type="text" class="form-text" id="txtdeptname" name="position" value="${shop.position}"/>
		                        </td>
		                    </tr>
                 		<tr>
	                        <td width="100px"><span class="font01 pr5">*</span>类型及权重：</td>
		                        <td class="white-tr">
		                            <input type="text" class="form-text" id="txtdeptname" name="typeWeight" value="${shop.typeWeight}"/>
	                        </td>
                    	</tr>
                    	<tr>
                 		<td width="100px"><span class="font01 pr5">*</span>开启条件：</td>
	                        <td class="white-tr">
	                            <input type="text" class="form-text" id="txtdeptname" name="openCondition" value="${shop.openCondition}"/>
	                        </td>
                    	</tr>
                    	<tr>
                    	<td width="100px"><span class="font01 pr5">*</span>图标路径：</td>
	                        <td class="white-tr">
	                            <input type="text" class="form-text" id="txtdeptname" name="iconDir" value="${shop.iconDir}"/>
	                        </td>
                    	</tr>
                    	
                    	<tr>
								<td width="100px"><span class="font01 pr5">*</span>统计信息内容：</td>
								<td class="white-tr"><input type="text" class="form-text"
									id="txtdeptname" name="countInfo" value="${shop.countInfo}" /></td>
							</tr>
                    	<tr>
                    		<td width="100px"><span class="font01 pr5">*</span>弹窗模板样式：</td>
	                        <td class="white-tr">
	                            <input type="text" class="form-text" id="txtdeptname" name="tempId" value="${shop.tempId}"/>
	                        </td>
                    	 	<td align="center"><input type="button" value="添加语言模板" onclick="addAttachLine();"></td>
                  		</tr>
	                    	<c:forEach items="${shop.contentInfo }" var="content" varStatus="status"> 
			                    	<tr>
			                    		<td width="100px"><span class="font01 pr5">*</span>模板参数：</td>
				                        <td class="white-tr">
				                        	<select class="" id="language[{0}].language" name="contentInfo[${status.count }].language">
													<option <c:if test="${content.language=='zh-CN'}">selected="selected"</c:if> value="zh-CN" selected="selected">中文-简体</option>
													<option <c:if test="${content.language=='zh-TW'}">selected="selected"</c:if> value="zh-TW">中文-繁体</option>
													<option <c:if test="${content.language=='vi-VN'}">selected="selected"</c:if> value="vi-VN">越南</option>
													<option <c:if test="${content.language=='ko-KR'}">selected="selected"</c:if> value="ko-KR">朝鲜语&amp;韩语</option>
											</select>
				                            <input  class="form-text" style="width: 500px;"  id="txtdeptname" name="contentInfo[${status.count }].content" value="${content.content}"/>
				                      </td>
				                            <td align="center"><a onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a></td>
				                        
			                    	</tr>
			                    	
			                    	 <input type="hidden" class="" id="length"  value="${(fn:length(shop.contentInfo)+1) }"/>
			                    	
	                    	</c:forEach>
		                   </table>
	                    	
                    	<textarea style="display:none" id="attachTr">
							<tr id="attachTr{0}">
									<td width="100px"><span class="font01 pr5">*</span>模板参数：</td>
									<td class="white-tr">
										<select id="language[{0}].language" name="">
												<option value="zh-CN" selected="selected">中文-简体</option>
												<option value="zh-TW">中文-繁体</option>
												<option value="vi-VN">越南</option>
												<option value="ko-KR">朝鲜语&amp;韩语</option>
										</select>
		                            	<input  class="form-text" style="width: 500px;" id="txtdeptname" name="" />
		                           </td>
								
								<td align="center"><a onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a></td>
								
							</tr>
						</textarea> 
                    	<script type="text/javascript">
							
                    	var attachIndex = 0;
						var attachTpl = $("#attachTr").val();
						function addAttachLine() 
						
								{
							//alert(attachTpl);
							$('#attachTable').append(attachTpl);
							var indexs=$("#length").val();
							$(".select").each(function(index){
								index=indexs;
								var sname="contentInfo["+index+"].language";
								$(this).attr("name",sname);
							});
							var ind=0;
							$(".inputnum").each(function(index){
								index=indexs;
								var sname="contentInfo["+index+"].content";
								$(this).attr("name",sname);
							});
							}
						
						function re(tha){
							
							$(tha).parent().parent().remove();
							
						}
						
						</script>
						
						<c:forEach items="${shop.ruleInfo }" var="rule" varStatus="status"> 
	                 		<table id="tr-attach"  width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tk_table">
							<tr>
								<td width="100px"><span class="font01 pr5">*</span>弹窗ID：</td>
								<td class="white-tr"><input type="text" class="form-text"
									id="txtdeptname" value="${rule.id}" name="ruleInfo[${(status.count-1) }].id" /></td>
							</tr>
	                 		<tr>
	                 			<td width="100px"><span class="font01 pr5">*</span>曝光节点${(status.count-1) }：</td>
		                        <td class="white-tr">
		                            <input type="text" class="form-text" id="txtdeptname" name="ruleInfo[${(status.count-1) }].node" value="${rule.node}"/>
		                        </td>
	                    	</tr>
	                    	<tr>
	                 			<td width="100px"><span class="font01 pr5">*</span>出现概率：</td>
		                        <td class="white-tr">
		                            <input type="text" class="form-text" id="txtdeptname" name="ruleInfo[${(status.count-1) }].rate" value="${rule.rate}"/>
		                        </td>
	                    	</tr>
	                    	<tr>
	                 			<td width="100px"><span class="font01 pr5">*</span>每日曝光次数：</td>
		                        <td class="white-tr">
		                            <input type="text" class="form-text" id="txtdeptname" name="ruleInfo[${(status.count-1) }].times" value="${rule.times}"/>
		                        </td>
	                    	</tr>
	                    	<tr>
	                 			<td width="100px"><span class="font01 pr5">*</span>曝光优先级：</td>
		                        <td class="white-tr">
		                            <input type="text" class="form-text" id="txtdeptname" name="ruleInfo[${(status.count-1) }].priority" value="${rule.priority}"/>
		                        </td>
	                    	</tr>
	                    	<tr>
	                 			<td width="100px"><span class="font01 pr5">*</span>等级限制：</td>
		                        <td class="white-tr">
		                            <input type="text" class="form-text" id="txtdeptname" name="ruleInfo[${(status.count-1) }].lvLimit" value="${rule.lvLimit}"/>
		                        </td>
	                    	</tr>
							</table>
							<input type="hidden" class="" id="ruLength"  value="${(fn:length(shop.ruleInfo)) }"/>
		                   
							</c:forEach>
							<table id="bgTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
		                 		<tr>
		                 			<td align="center"><input type="button" value="增加曝光点" onclick="addBgLine();"></td>
		                 			<td class="white-tr">
			                        </td>
		                 		</tr>
	                 		</table>
							
	                 <textarea style="display:none" id="bgTr" class="">
	                 		<tr>
	                 			<td align="center">
	                 				<table  width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tk_table">
										<tr>
											<td width="100px"><span class="font01 pr5">*</span>弹窗ID：</td>
											<td class="white-tr"><input type="text" class="form-text"
												id="txtdeptname" name="purchaseLimit"  class="id"/></td>
										</tr>
				                 		<tr>
				                 			<td width="100px" class="titl"></td>
					                        <td class="white-tr">
					                            <input type="text" class="node" id="txtdeptname" name="purchaseLimit" />
					                        </td>
				                    	</tr>
				                    	<tr>
				                 			<td width="100px"><span class="font01 pr5">*</span>出现概率：</td>
					                        <td class="white-tr">
					                            <input type="text" class="rate" id="txtdeptname" name="purchaseLimit" />
					                        </td>
				                    	</tr>
				                    	<tr>
				                 			<td width="100px"><span class="font01 pr5">*</span>每日曝光次数：</td>
					                        <td class="white-tr">
					                            <input type="text" class="times" id="txtdeptname" name="purchaseLimit" />
					                        </td>
				                    	</tr>
				                    	<tr>
				                 			<td width="100px"><span class="font01 pr5">*</span>曝光优先级：</td>
					                        <td class="white-tr">
					                            <input type="text" class="priority" id="txtdeptname" name="purchaseLimit" />
					                        </td>
				                    	</tr>
				                    	<tr>
				                 			<td width="100px"><span class="font01 pr5">*</span>等级限制：</td>
					                        <td class="white-tr">
					                            <input type="text" class="lvLimit" id="txtdeptname" name="purchaseLimit" />
					                        </td>
					                        -------------------------------------华丽的分割线------------------------------------------
				                    	</tr>
			                    	</table>
	                 			</td>
	                 			<td align="center">
									<a id="tag" onclick="rem(this);" href="javascript:void(0);" class="pn-opt">删除</a>
								</td>
	                 			
	                    	</tr>
						</textarea>
                    
                    
                    <script type="text/javascript">
							var bgIn = 1;
							var bgTpl = $("#bgTr").val();
							
							function addBgLine() 
							{
								$('#bgTable').append(bgTpl);
								
								var indexs=$("#ruLength").val();
								
								var id = 0;
								$(".id").each(function(id) {
									id=indexs;
									var sname="ruleInfo["+id+"].id";
									$(this).attr("name",sname);
								});
								var node=0;
								$(".node").each(function(node){
									node=indexs;
									var sname="ruleInfo["+node+"].node";
									$(this).attr("name",sname);
								});
								var rate=0;
								$(".rate").each(function(rate){
									rate=indexs;
									var sname="ruleInfo["+rate+"].rate";
									$(this).attr("name",sname);
								});
								var priority=0;
								$(".priority").each(function(priority){
									priority=indexs;
									var sname="ruleInfo["+priority+"].priority";
									$(this).attr("name",sname);
								});
								var times=0;
								$(".times").each(function(times){
									times=indexs;
									var sname="ruleInfo["+times+"].times";
									$(this).attr("name",sname);
								});
								var lvLimit=0;
								$(".lvLimit").each(function(lvLimit){
									lvLimit=indexs;
									var sname="ruleInfo["+lvLimit+"].lvLimit";
									$(this).attr("name",sname);
								});
								
								var titl=2;
								$(".titl").each(function(titl){
									titl=indexs;
									var sname="曝光节点"+titl+"：";
									$(this).text(sname);
								});
								
								
							}
							
							function rem(tha){
								//alert(tha);
								$(tha).parent().parent().remove();
								
							}
							
							
							</script>
                 <table  width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tk_table">
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>类型：</td>
                        <td class="white-tr">
                            <input type="radio" class="" id="txtdeptname" name="tim" onclick="show(this)"  value="1"/>普通活动
                       		 <input type="radio" class="" id="txtdeptname" name="tim" onclick="show(this)"  value="2"/>引导活动
                        </td>
                    </tr>
                    <br/>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动ID：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="act_id" name="act_id" value="${shop.act_id}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>图片名称：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="picture" value="${shop.picture}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>货币：</td>
                        <td class="white-tr">
								<select id="selTypeId" onclick="hidePrice(this)"  class="form-text" name="type">
									<option value="12">钻石</option>
									<option value="11">金币</option>
									<option value="13">荣誉</option>
									<option value="-1">充值货币</option>
								</select>
						</td>
                    </tr>
                    
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>价格：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="hbjia" name="price" value="${shop.price}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>商品标记：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="mark" value="${shop.mark}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>优先级：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="priority" value="${shop.priority}"/>
                        </td>
                    </tr>
                 <%--    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>最大购买数：</td>
                        <td class="white-tr">
                            <input type="text" class="form-text" id="txtdeptname" name="maxBuy" value="${shop.maxBuy}"/>
                        </td>
                    </tr> --%>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>开始时间：</td>
                        <td class="white-tr">
                            <input type="text" class="" id="txtdeptname" name="startTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${shop.startTime}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>结束时间：</td>
                        <td class="white-tr">
                            <input type="text" class="" id="txtdeptname" name="endTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${shop.endTime}"/>
                        </td>
                    </tr>
                    </table>
				</table>
            </div>
        </div>
    </div>
</form>	
</body>
</html>