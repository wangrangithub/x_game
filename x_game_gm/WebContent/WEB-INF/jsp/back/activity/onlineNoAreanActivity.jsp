<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function emailindex(i){
		var html="";
		for(var j=i-1;j<i;j++){
			
		
		html+='<tr class="white-tr">'
		+'<td align="" width="20px" style="padding:10px;">'
		+'<a style="margin:10px;" onclick="rem(this);" href="javascript:void(0);" class="">删除活动项</a>'
		+'</td>'
		+'<td align="left">'
			+'<table class="email">'
				+'<tr>'
                   +'<td width=""><span class="">*</span><span class="chongzhi">每日充值</span>：'
                    	+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="rechargeDiamCount"  name="rechargeList['+j+'].rechargeDiamCount" value=""/>'
                    +'</td>'
					 +'</tr>'					
					  +'<tr>'
                    +'<td width=""><span class="">*</span>广播是否：'
                     	+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'                      	
                     	+'<select name="rewardList['+j+'].rewardIsRadio" class="rewardIsRadio" id="type" onChange="Change_Select()">'
						+'<option value="0">无</option>'
										+'<option value="1">本服</option>'
										+'<option value="2">全服</option>'
									+'</select>'                 
                    +'</td>'                    
					 +'</tr>'
					 +'<tr>'
							+'<td>'
                  		+'<table border="0" id="attachTable">'
							+'<tr id="tr-attachments">' 
								+'<td align="center"  stuts="'+j+'"><input type="button" value="添加奖励" onclick="addAttachLine(this);" class="add"></td>'
								+'<td align="center">物品ID</td>'
								+'<td align="center">物品数量</td>'
								+'<td align="center">是否广播</td>'
							+'</tr>'
						+'</table>'					
						+'</td>' 				
				+'</tr>'
			+'</table>'
		+'</td>'
		
	+'</tr>';
		}
		return html;
	}
	function attachindex(i,stus){
		var html="";
		for(var j=i-1;j<i;j++){
		
		html+='<tr id="attachTr{0}">'
		+'<td align="center"><a onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a></td>'
		+'<input id=""  name="" type="hidden" style="width: 120px;" value="" class="count"  />'  
		+'<td align="center"><input type="text" class="rewardGoodsId" id="items[{0}].itemId" name="rechargeList['+stus+'].rewardList['+(i-1)+'].itemId"/></td>'
		+'<td align="center"><input type="text" class="rewardGoodsCount" id="items[{0}].itemId" name="rechargeList['+stus+'].rewardList['+(i-1)+'].num"/></td>'
		+'<td align="center">'
			+'<select name="rechargeList['+stus+'].rewardList['+(i-1)+'].notice" class="rewardIsR" id="type" onChange="Change_Select()">'
				+'<option value="0">无</option>'
				+'<option value="1">本服</option>'
				+'<option value="2">全服</option>'
			+'</select>'
		+'</td>'
	+'</tr>';}
		return html;
	}
</script>
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
    <script type="text/javascript" src="<%=path%>/resources/js/calendar.js"></script>
	<script type="text/javascript">
    	function addAc(){
    		$("#formupdate").ajaxSubmit({
    			
    			url:"<%=path%>/activity/activityAdd",
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
    					alert("复制失败");
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("复制活动失败，请重试");
                } 
    		});
    	}
    	
    	 function push(){
 	 	    
    		<%--  var actName=$("#actNam").val();
    		 var orginName=$("#orginAct").val();
    		 
    		 if(actName==orginName){
    			 alert("请改变活动名称");
    			 return false;
    		 }
    		 $(":disabled").attr("disabled",false);
    		 
    		 
     		$("#formupdate").ajaxSubmit({
     			url:"<%= request.getContextPath()%>/activity/activityAdd",
     			type:"post",
     			data:  $('#formadd').serialize(),
  				dataType: "json",
     			resetForm:false,
     			success:function(data){
     				if(data=="ok"){
     					
     					alert("复制成功！");
     					 window.location="<%= request.getContextPath()%>/activity/activityList"
     				}
     			},  
                 error:function(xhr,textStatus,errorThrown){  
                     alert("复制失败，请重试");
                 } 
     		}); --%>
     		alert("已推送的活动无法保存");
 		}	
    	
    	 function goBack(){
    		 window.location="<%= request.getContextPath()%>/activity/activityList"		    		 
    	 }
    	 
    	 $(function(){
    		 $('.disableCss').removeAttr('href');//去掉a标签中的href属性
    		 $('.disableCss').removeAttr('onclick');//去掉a标签中的onclick事件
   		 });
    	 
    </script>
    
     
    
</head>
<body>
<form id="formupdate" >
	<div class="easyui-tabs" style="width: 100%;">
        <div title="活动基本信息">
            <div class="dialog-table">
            <input id="actNam" type="hidden" class=""  name="" value="${activityInfo.actInfoName}"/>
            <input type="hidden"  class=""  name="actInfoId" value="${activityInfo.actInfoId}"/>
                <table width="100%" border="0" cellspacing="0" id="da" cellpadding="0" class="tk_table">
                	
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>所属精彩活动类型：</td>
                        <td class="white-tr">
                        	<select name="actId" disabled="disabled">
		                       		<option <c:if test="${activityInfo.actInfoId==1001}">selected="selected"</c:if> value="1001">每日充值</option>
		                        		<option <c:if test="${activityInfo.actId==1002}">selected="selected"</c:if> value="1002">充值返利</option>
		                        		<option <c:if test="${activityInfo.actId==1003}">selected="selected"</c:if> value="1003">等级达标</option>
		                        		<option <c:if test="${activityInfo.actId==1004}">selected="selected"</c:if> value="1004">竞技场达标</option>
		                        		<option <c:if test="${activityInfo.actId==1005}">selected="selected"</c:if> value="1005">神秘商城达标</option>
		                        		<option <c:if test="${activityInfo.actId==1006}">selected="selected"</c:if> value="1006">招募达标</option>
		                        		<option <c:if test="${activityInfo.actId==1007}">selected="selected"</c:if> value="1007">充值循环达标</option>
		                        		<option <c:if test="${activityInfo.actId==1008}">selected="selected"</c:if> value="1008">钻石消费循环达标</option>
		                        		<option <c:if test="${activityInfo.actId==1009}">selected="selected"</c:if> value="1009">累计消费钻石达标</option>
		                        		<option <c:if test="${activityInfo.actId==1010}">selected="selected"</c:if> value="1010">登陆达标</option>
		                        		<option <c:if test="${activityInfo.actId==1011}">selected="selected"</c:if> value="1011">芯片装备达标</option>
		                        		<option <c:if test="${activityInfo.actId==1012}">selected="selected"</c:if> value="1012">幸存者星级达标</option>
		                        		<option <c:if test="${activityInfo.actId==1013}">selected="selected"</c:if> value="1013">活动获得指定幸存者</option>
		                        		<option <c:if test="${activityInfo.actId==1014}">selected="selected"</c:if> value="1014">关卡进度达标(普通关卡)</option>
		                        		<option <c:if test="${activityInfo.actId==1015}">selected="selected"</c:if> value="1015">关卡进度达标(工业区)</option>
		                      </select>
                        </td>
                    </tr> 
                     
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>模板类型：</td>
                        <td class="white-tr">
                        	
                            <input disabled="disabled" type="radio" <c:if test="${activityInfo.isOpenTmpl==0}">checked="checked"</c:if> class=""  name="isOpenTmpl" value="0"/>否
                            <input disabled="disabled" type="radio" <c:if test="${activityInfo.isOpenTmpl==1}">checked="checked"</c:if>  class=""  name="isOpenTmpl" value="1"/>开服模板
                            <br />
                            	开始第 <input disabled="disabled" type="text" value="${activityInfo.actInfoStartDay}" name="actInfoStartDay"/>天 结束第<input disabled="disabled" type="text" value="${activityInfo.actInfoEndDay}" name="actInfoEndDay"/>天
                        </td>
                    </tr>
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>精彩活动名称：</td>
                        <td class="white-tr">
                        	 <input type="text" disabled="disabled" id="orginAct" class=""  name="actInfoName" value="${activityInfo.actInfoName}"/>
                        </td>
                    </tr>
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动图片：</td>
                        <td class="white-tr">
                        	 <input type="text" disabled="disabled" class=""   name="actInfoPicture" value="${activityInfo.actInfoPicture}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>语言模板ID：</td>
                        <td class="white-tr">
                        	 <input type="text" disabled="disabled" class=""   name="actLangTmpId" value="${activityInfo.actLangTmpId}"/>
                        </td>
                    </tr>
                     <tr>
                   		 <td width="100px">开始时间：</td>
                    	 <td class="white-tr"><%-- <input  name="beginTimes" style="width: 120px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${param.beginTime }" class="search_txt"  />-
                    	  --%>
                    	 <input class="startDate Wdate" id="startDate" name="actInfoStartTimes" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}'})" value="${activityInfo.actInfoStartTime}"/>
                    	 
                    	 </td>
                    	
                   	</tr>
                   	 <tr>
                   		<td width="100px">结束时间：</td>	
                    	 <td class="white-tr"><%-- <input name="endTimes" style="width: 120px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${param.endTime}" class="search_txt"  />
                    	  --%>
                    	 <input class="endDate Wdate" name="actInfoEndTimes" id="endDate" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2120-10-01'})" value="${activityInfo.actInfoEndTime}"/>
                    	 
                    	 </td>
                        
                   	</tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动描述：</td>
                        <td class="white-tr">
                        	<textarea rows="10" disabled="disabled" cols="10" name="actInfoDes" value="">${activityInfo.actInfoDes}</textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="100px"><span class="font01 pr5"></td>
                        <td class="white-tr">
                        	<table border="0" id="emailTable">
								<tr>
									<td align="center"><input disabled="disabled" type="button" value="添加活动项" onclick="addEamilLine();"></td>
								</tr>
							<tr>	
							<td>
							<c:forEach items="${activityInfo.rechargeList }" var="reC" varStatus="status">
								<c:if test="${reC.cumulativePay == null}">
								<tr>
									<td align="" width="20px" style="padding:10px;">
										<a style="margin:10px;" onclick="rem(this);" href="javascript:void(0);" class="disableCss">删除活动项</a>
									</td>
								<td align="left">
									<table >
											 <tr>
						                        <td width=""><span class="">*</span><span class="chongzhi">${typeid}条件</span>：
						                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  disabled="disabled"   class="rechargeDiamCount"  name="rechargeList[${(status.count-1) }].rechargeDiamCount" value="${reC.rechargeDiamCount }"/>(竞技场级别 1：低 2：中 3：高)
						                        	<%--  <c:if test="${reC. }"></c:if> --%>
						                        </td>
	                  						 </tr>
	                  						 <tr>
							                        <td width=""><span class="">*</span><span class="">竞技场开始排名</span>：
							                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" disabled="disabled"  class="areanBegin"  name="rechargeList[${(status.count-1) }].areanBegin" value="${reC.areanBegin }"/>
							                        </td>
		                  						 </tr>
		                  						 <tr>
							                        <td width=""><span class="">*</span><span class="">竞技场结束排名</span>：
							                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" disabled="disabled"  class="areanEnd"  name="rechargeList[${(status.count-1) }].areanEnd" value="${reC.areanEnd }"/><!-- （填写如：1_20，级别竞技场多少，1代表低级2中级3高级  20代表竞技场排名） -->
							                        </td>
		                  						 </tr>
	                  						  <tr>
	                  						 
	                  						  <tr>
						                        <td width=""><span class="">*</span>广播是否：
						                         	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						                         	<select disabled="disabled" class="rechargeIsRadio" name="rechargeList[${(status.count-1) }].rechargeIsRadio" id="type"    onChange="Change_Select()">
																	<option <c:if test="${reC.rechargeIsRadio==0 }">selected="selected"</c:if> value="0">无</option>
																	<option <c:if test="${reC.rechargeIsRadio==1 }">selected="selected"</c:if> value="1">本服</option>
																	<option <c:if test="${reC.rechargeIsRadio==2}">selected="selected"</c:if> value="2">全服</option>
																</select>
						                         	
						                        </td>
						                        
	                  						 </tr>
	                  						 <tr>
	                       							<td>
	                       							
							                  		<table border="0" id="attachTable">
														<tr id="tr-attachments"> 
															<td align="center" stuts="${(status.count-1)}"><input disabled="disabled" type="button"    value="添加奖励" onclick="addAttachLine(this);" class="add"></td>
															<!-- <td align="center">物品类型</td> -->
															<td align="center">物品ID</td>
															<td align="center">物品数量</td>
															<td align="center">是否广播</td>
														</tr>
														<c:forEach items="${reC.rewardList }" var="reW" varStatus="stat">
														<tr id="attachTr{0}">
															<td align="center"><a  onclick="re(this);" href="javascript:void(0);" class="disableCss">删除</a></td>
															<input id=""  name="" type="hidden" style="width: 120px;" value="" class="count"  />  
															<td align="center"><input  disabled="disabled"  value="${reW.itemId}" type="text" class="rewardGoodsId" id="items[{0}].itemId" name="rechargeList[${(status.count-1) }].rewardList[${(stat.count-1) }].itemId"/></td>
															<td align="center"><input  disabled="disabled"  value="${reW.num}" type="text" class="rewardGoodsCount" id="items[{0}].itemId" name="rechargeList[${(status.count-1) }].rewardList[${(stat.count-1) }].num"/></td>
															
															<td align="center">
																<select disabled="disabled" name="rechargeList[${(status.count-1) }].rewardList[${(stat.count-1) }].notice" class="rewardIsR" id="type" onChange="Change_Select()">
																	<option <c:if test="${reW.notice==0}">selected="selected"</c:if> value="0">无</option>
																	<option <c:if test="${reW.notice==1}">selected="selected"</c:if> value="1">本服</option>
																	<option <c:if test="${reW.notice==2}">selected="selected"</c:if> value="2">全服</option>
																</select>
															</td>
														</tr>
														</c:forEach>
													</table>
													
													
													</td> 
												
	                    					</tr>
	                    					
										</table>
								</td>
							</tr>
							</c:if>
							</c:forEach>
							
						  </table>
                    <script type="text/javascript">
                    		
							var emaillength=0;
							function addEamilLine() 
							{
								emaillength=$(".rechargeDiamCount").length+1;
								//alert(emaillength);
	                    		var content=emailindex(emaillength);
								//var se="contentInfo[";
						//	var et="].language";
				               // alert($.format($("#emailTr").val()));
								//alert(emailTpl);
								
								$('#da').append(content);
								
								var indexs=0;
								$(".rechargeDiamCount").each(function(index){
									var sname="rechargeList["+(index+1)+"].rechargeDiamCount";
									var a =$(this).attr("sta");
									//alert(a);
									if(a==1){
										var sname="rechargeList["+0+"].cumulativePay";
									}
									$(this).attr("name",sname);
								});
								/* var ind=0;
								$(".rechargeCount").each(function(index){
									var sname="rechargeList["+index+"].rechargeCount";
									$(this).attr("name",sname);
								});
								
								$(".rechargeHref").each(function(index){
									var sname="rechargeList["+index+"].rechargeHref";
									$(this).attr("name",sname);
								}); */
								$(".rechargeIsRadio").each(function(index){
									var sname="rechargeList["+index+"].rechargeIsRadio";
									$(this).attr("name",sname);
								});
								
								$(".chongzhi").each(function(index){
									var sname="第"+(index+1)+"天充值";
									$(this).text(sname);
								});
								/* $(".rechargeIsR").each(function(index){
									var sname="rechargeList["+index+"].rechargeIsRadio";
									$(this).attr("name",sname);
								}); */
								
								
								
								/* $(".rewardGoodsId").each(function(index){
									
									var orgin =$(this).attr("name");
									var s = orgin.substring(15,orgin.length);
									alert(s);
									var sname="rechargeList["+index+"]."+s;
									$(this).attr("name",sname);
								}); */
								
							}
							
							function rem(tha){
								
								$(tha).parent().parent().remove();
								
							}
						</script>
					
                        </td>
                    </tr>
                    
                    
                                                      
                </table>
                <%--  <table id="dd" class="tk_table">
			  		<tr>
			  		 <td width="100px"><span class="font01 pr5"></td>
                        <td class="white-tr">
                        	<table border="0" id="emailTable">
							<!-- <tr>
								<td align="center"><input type="button" value="添加累计活动项" onclick="addLeiEamilLine();"></td>
							</tr> -->
							<tr>	
							<td>
								<table >
								<c:forEach items="${activityInfo.rechargeList }" var="reCH" varStatus="status">
										<c:if test="${reCH.cumulativePay != null}">
										 <tr>
					                        <td width=""><span class="">*</span><span class="">累计天数</span>：
					                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input disabled="disabled" type="text" sta="1" class="rechargeDiamCount"  name="rechargeList[0].cumulativePay" value="${reCH.cumulativePay}"/>
					                        </td>
                  						  <tr>
					                        <td width=""><span class="">*</span>广播是否：
					                         	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					                         	<select disabled="disabled" class="rechargeIsRadio" name="rechargeList[0].rechargeIsRadio" id="type" onChange="Change_Select()">
																<option value="0">无</option>
																<option value="1">本服</option>
																<option value="2">全服</option>
															</select>
					                         	
					                         	
					                        </td>
					                        
                  						 </tr>
                  						 <tr>
                       							<td>
						                  		<table border="0" id="attachTable">
													<tr id="tr-attachments"> 
														<td align="center" stuts="${(status.count-1)}"><input disabled="disabled" type="button" value="添加奖励" onclick="addAttachLine(this);" class="add"></td>
														<!-- <td align="center">物品类型</td> -->
														<td align="center">物品ID</td>
														<td align="center">物品数量</td>
														<td align="center">是否广播</td>
													</tr>
													<c:forEach items="${reCH.rewardList }" var="reWA" varStatus="stat">
														<tr id="attachTr{0}">
															<td align="center"><a onclick="re(this);" href="javascript:void(0);" class="disableCss">删除</a></td>
															<td align="center"><input disabled="disabled" type="text" value="${reWA.itemId}" class="itemId" id="items[{0}].itemId" name="rechargeList[0].rewardList[0].itemId"/></td>
															<td align="center"><input disabled="disabled" type="text" value="${reWA.num}" class="num" id="items[{0}].itemId" name="rechargeList[0].rewardList[0].num"/></td>
															
															<td align="center">
																<select disabled="disabled" name="rechargeList[0].rewardList[0].notice" class="notice" id="type" onChange="Change_Select()">
																	<option <c:if test="${reWA.notice==0}">selected="selected"</c:if> value="0">无</option>
																	<option <c:if test="${reWA.notice==1}">selected="selected"</c:if> value="1">本服</option>
																	<option <c:if test="${reWA.notice==2}">selected="selected"</c:if> value="2">全服</option>
																</select>
															</td>
														</tr>
													</c:forEach>
												</table>
												
												
												</td> 
											
                    					</tr>
                    					
									</table>
								</td>
							</tr>
							</c:if>
						  </c:forEach>
						  </table> --%>
                	<br/><br/><input type="button" onclick="push();" class="search_bt commbtn" value="保存" >
					<input type="reset" class="search_bt commbtn" value="重置" >
					<input type="button" onclick="goBack();" class="search_bt commbtn" value="返回" >
                
                 <script type="text/javascript">
					var attachIndex = 0;
					var attachTpl = $("#emailT").val();
					
					function addAttachLine(e) 
					
							{
						/* var attachlength=$(".rewardGoodsId").length; */	
						var attachlength=$(e).parent("td").parent("tr").parent("tbody").children("tr").length;
						var stus=$(e).parent().attr("stuts");
					//	alert(attachlength);
						var content=attachindex(attachlength,stus);
					//	alert(attachTpl);
						$(e).parent().parent().parent().append(content);
						
						var indexs=0;
						/* $(".rewardGoodsType").each(function(index){
							var sname="rewardList["+index+"].rewardGoodsType";
							$(this).attr("name",sname);
						}); */
						/* $(".rewardGoodsId").each(function(index){
						
							var orgin =$(this).attr("name");
							//alert(orgin);
							var s = orgin.substr(0,15);
							var sname=s+".rewardList["+index+"].rewardGoodsId";
							$(this).attr("name",sname);
						}); */
						/* $(".rewardGoodsCount").each(function(index){
							var sname="rewardList["+index+"].rewardGoodsCount";
							$(this).attr("name",sname);
						});
						$(".rewardIsR").each(function(index){
							var sname="rewardList["+index+"].rewardIsRadio";
							$(this).attr("name",sname);
						}); */
						
						
						}
						function re(tha){
						
						$(tha).parent().parent().remove();
						
					}
			</script>
                
			
            </div>
        </div>
    </div>
</form>	
</body>
</html>