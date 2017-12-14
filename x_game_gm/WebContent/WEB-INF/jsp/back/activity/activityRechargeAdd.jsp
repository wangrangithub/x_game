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
    					alert("添加失败");
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("新增活动失败，请重试");
                } 
    		});
    	}
    </script>
    
     
    
</head>
<body>
<form id="formupdate" >
	<div class="easyui-tabs" style="width: 100%;">
        <div title="活动基本信息">
            <div class="dialog-table">
            <input type="hidden"  class=""  name="actId" value="${typeid}"/>
                <table width="100%" border="0" cellspacing="0" id="da" cellpadding="0" class="tk_table">
                	
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>所属精彩活动类型：</td>
                        <td class="white-tr">
                        	<select name="actId" disabled="disabled">
		                        		<option <c:if test="${typeid==1001}">selected="selected"</c:if> value="1001">每日充值</option>
		                        		<option <c:if test="${typeid==1002}">selected="selected"</c:if> value="1002">充值返利</option>
		                        		<option  <c:if test="${typeid==1003}">selected="selected"</c:if> value="1003">等级达标</option>
		                        		<option <c:if test="${typeid==1004}">selected="selected"</c:if> value="1004">竞技场达标</option>
		                        		<option <c:if test="${typeid==1005}">selected="selected"</c:if> value="1005">神秘商城达标</option>
		                        		<option <c:if test="${typeid==1006}">selected="selected"</c:if> value="1006">招募达标</option>
		                      </select>
                        </td>
                    </tr> 
                     
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>模板类型：</td>
                        <td class="white-tr">
                        	
                            <input type="radio"  class=""  name="isOpenTmpl" value="0"/>否
                            <input type="radio"  class=""  name="isOpenTmpl" value="1"/>开服模板
                            <br />
                            	开始第 <input type="text" value="" name="actInfoStartDay"/>天 结束第<input type="text" value="" name="actInfoEndDay"/>天
                        </td>
                    </tr>
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>精彩活动名称：</td>
                        <td class="white-tr">
                        	 <input type="text" class=""  name="actInfoName" value=""/>
                        </td>
                    </tr>
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动图片：</td>
                        <td class="white-tr">
                        	 <input type="text" class=""  name="actInfoPicture" value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>语言模板：</td>
                        <td class="white-tr">
                        	 <input type="text" class=""  name="actLangTmpId" value=""/>
                        </td>
                    </tr>
                     <tr>
                   		 <td width="100px">开始时间：</td>
                    	 <td class="white-tr"><%-- <input  name="beginTimes" style="width: 120px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${param.beginTime }" class="search_txt"  />-
                    	  --%>
                    	 <input class="startDate Wdate" id="startDate" name="actInfoStartTimes" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}'})" value=""/>
                    	 
                    	 </td>
                    	
                   	</tr>
                   	 <tr>
                   		<td width="100px">结束时间：</td>	
                    	 <td class="white-tr"><%-- <input name="endTimes" style="width: 120px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${param.endTime}" class="search_txt"  />
                    	  --%>
                    	 <input class="endDate Wdate" name="actInfoEndTimes" id="endDate" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2120-10-01'})" value=""/>
                    	 
                    	 </td>
                        
                   	</tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动描述：</td>
                        <td class="white-tr">
                        	<textarea rows="10" cols="10" name="actInfoDes"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td width="100px"><span class="font01 pr5"></td>
                        <td class="white-tr">
                        	<table border="0" id="emailTable">
							<tr>
								<td align="center"><input type="button" value="添加活动项" onclick="addEamilLine();"></td>
							</tr>
							<tr>	
							<td>
								<table>
										 <tr>
					                        <td width=""><span class="">*</span>充值所达到条件：
					                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="rechargeDiamCount"  name="rechargeList[0].rechargeDiamCount" value=""/>
					                        </td>
                  						 </tr>
                  						<!--  <tr>
					                        <td width=""><span class="">*</span>充值次数：
					                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="rechargeCount"  name="rechargeList[0].rechargeCount" value=""/>
					                        </td>
                  						 </tr>
                  						 <tr>
					                        <td width=""><span class="">*</span>跳转：
					                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="rechargeHref"  name="rechargeList[0].rechargeHref" value=""/>
					                        </td>
					                        
                  						 </tr> -->
                  						  <tr>
					                        <td width=""><span class="">*</span>广播是否：
					                         	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					                         	<select class="rechargeIsRadio" name="rewardGoodsType" id="type" onChange="Change_Select()">
																<option value="0">无</option>
																<option value="1">本服</option>
																<option value="2">全服</option>
															</select>
					                         	
					                         	
					                         	<!-- <input type="radio" class="rechargeIsRadio"  name="rechargeList[0].rechargeIsRadio" value=""/>是
                          					     <input type="radio" class="rechargeIsR"  name="rechargeList[0].rechargeIsRadio" value=""/>否
					                       -->
					                        </td>
					                        
                  						 </tr>
                  						 <tr>
                       							<td>
						                  		<table border="0" id="attachTable">
													<tr id="tr-attachments"> 
														<td align="center"><input type="button" value="添加奖励" onclick="addAttachLine(this);" class="add"></td>
														<!-- <td align="center">物品类型</td> -->
														<td align="center">物品ID</td>
														<td align="center">物品数量</td>
														<td align="center">是否广播</td>
													</tr>
													<tr id="attachTr{0}">
														<td align="center"><a onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a></td>
														<!-- <td align="center">
															<select name="rewardList[0].rewardGoodsType" class="rewardGoodsType" id="type" onChange="Change_Select()">
																<option selected="selected" value="0" >----</option>
																<option value="6">玩家属性</option>
																<option value="1">道具</option>
																<option value="4">武将</option>
																<option value="7">武将等级</option>
																<option value="9">武将技能</option>
																<option value="26">武将经验</option>
																<option value="27">武将压力</option>	
															</select>
														</td> -->
														<td align="center"><input type="text" class="rewardGoodsId" id="items[{0}].itemId" name="rewardList[0].rewardGoodsId"/></td>
														<td align="center"><input type="text" class="rewardGoodsCount" id="items[{0}].itemId" name="rewardList[0].rewardGoodsCount"/></td>
														
														<td align="center">
															<select name="rewardList[0].rewardIsRadio" class="rewardIsR" id="type" onChange="Change_Select()">
																<option value="0">无</option>
																<option value="1">本服</option>
																<option value="2">全服</option>
															</select>
														</td>
													</tr>
												</table>
												
												
												</td> 
											
                    					</tr>
                    					
									</table>
								</td>
							</tr>
						  </table>
						  
                    	<textarea style="display:none" id="emailTr">
							<tr class="white-tr">
								<td align="" width="20px" style="padding:10px;">
									<a style="margin:10px;" onclick="rem(this);" href="javascript:void(0);" class="">删除活动项</a>
								</td>
								<td align="left">
									<table>
										  <tr>
					                        <td width=""><span class="">*</span>充值所达到条件：
					                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="rechargeDiamCount"  name="rechargeDiamCount" value=""/>
					                        </td>
                  						 </tr>
                  						<!--  <tr>
					                        <td width=""><span class="">*</span>充值次数：
					                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="rechargeCount"  name="rechargeCount" value=""/>
					                        </td>
                  						 </tr>
                  						 <tr>
					                        <td width=""><span class="">*</span>跳转：
					                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="rechargeHref"  name="rechargeHref" value=""/>
					                        </td>
					                        
                  						 </tr> -->
                  						  <tr>
					                        <td width=""><span class="">*</span>广播是否：
					                         	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					                         	
					                         	<select name="rewardList[0].rewardIsRadio" class="rewardIsRadio" id="type" onChange="Change_Select()">
																<option value="0">无</option>
																<option value="1">本服</option>
																<option value="2">全服</option>
															</select>
					                         	
					                         	
					                         	<!-- <input type="radio" class="rechargeIsRadio"  name="rechargeIsRadio" value="1"/>是
                          					     <input type="radio" class="rechargeIsR"  name="rechargeIsR" value="0"/>否 -->
					                      
					                        </td>
					                        
                  						 </tr>
                  						 <tr>
                       							<td>
						                  		<table border="0" id="attachTable">
													<tr id="tr-attachments"> 
														<td align="center"><input type="button" value="添加奖励" onclick="addAttachLine(this);" class="add"></td>
														<td align="center">物品ID</td>
														<td align="center">物品数量</td>
														<td align="center">是否广播</td>
													</tr>
													<tr id="attachTr{0}">
														<td align="center"><a onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a></td>
														<!-- <td align="center">
															<select class="rewardGoodsType" name="rewardGoodsType" id="type" onChange="Change_Select()">
																<option selected="selected" value="0" >----</option>
																<option value="6">玩家属性</option>
																<option value="1">道具</option>
																<option value="4">武将</option>
																<option value="7">武将等级</option>
																<option value="9">武将技能</option>
																<option value="26">武将经验</option>
																<option value="27">武将压力</option>	
															</select>
														</td> -->
														<td align="center"><input class="rewardGoodsId" type="text" id="rewardGoodsId" name="items[{0}].itemId"/></td>
														<td align="center"><input class="rewardGoodsCount" type="text" id="rewardGoodsCount" name="items[{0}].itemId"/></td>
														
														<td align="center">
															<select name="rewardIsRadio" class="rewardIsRadio" id="type" onChange="Change_Select()">
																<option value="0">无</option>
																<option value="1">本服</option>
																<option value="2">全服</option>
															</select>
														</td>
													</tr>
												</table>
												
												
												</td> 
											
                    					</tr>
									</table>
								</td>
								
							</tr>
						</textarea>
												<textarea style="display:none" id="emailT">
													<tr id="attachTr{0}">
														<td align="center"><a onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a></td>
														<!-- <td align="center">
															<select class="rewardGoodsType" name="type" id="type" onChange="Change_Select()">
																<option selected="selected" value="0" >----</option>
																<option value="6">玩家属性</option>
																<option value="1">道具</option>
																<option value="4">武将</option>
																<option value="7">武将等级</option>
																<option value="9">武将技能</option>
																<option value="26">武将经验</option>
																<option value="27">武将压力</option>	
															</select>
														</td> -->
														<td align="center"><input type="text" class="rewardGoodsId" id="items[{0}].itemId" name="items[{0}].itemId"/></td>
														<td align="center"><input type="text" class="rewardGoodsCount" id="items[{0}].itemId" name="items[{0}].itemId"/></td>
														
														<td align="center">
															<select name="rewardIsRadio" class="rewardIsR" id="type" onChange="Change_Select()">
																<option value="0">无</option>
																<option value="1">本服</option>
																<option value="2">全服</option>
															</select>
														</td>
													</tr>
												</textarea>
                    <script type="text/javascript">
							var emailIndex = 1;
							//var emailTpl = $("#emailTr").val();
							var emailTpl = $("#emailTr").val();
							var email = 1;
							function addEamilLine() 
							{
								//var se="contentInfo[";
						//	var et="].language";
				               // alert($.format($("#emailTr").val()));
								//alert(emailTpl);
								
								$('#da').append(emailTpl);
								
								var indexs=0;
								$(".rechargeDiamCount").each(function(index){
									var sname="rechargeList["+index+"].rechargeDiamCount";
									$(this).attr("name",sname);
								});
								var ind=0;
								$(".rechargeCount").each(function(index){
									var sname="rechargeList["+index+"].rechargeCount";
									$(this).attr("name",sname);
								});
								
								$(".rechargeHref").each(function(index){
									var sname="rechargeList["+index+"].rechargeHref";
									$(this).attr("name",sname);
								});
								$(".rechargeIsRadio").each(function(index){
									var sname="rechargeList["+index+"].rechargeIsRadio";
									$(this).attr("name",sname);
								});
								/* $(".rechargeIsR").each(function(index){
									var sname="rechargeList["+index+"].rechargeIsRadio";
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
                 <script type="text/javascript">
					var attachIndex = 0;
					var attachTpl = $("#emailT").val();
					function addAttachLine(e) 
						
							{
					//	alert(attachTpl);
						$(e).parent().parent().parent().append(attachTpl);
						
						var indexs=0;
						$(".rewardGoodsType").each(function(index){
							var sname="rewardList["+index+"].rewardGoodsType";
							$(this).attr("name",sname);
						});
						$(".rewardGoodsId").each(function(index){
							var sname="rewardList["+index+"].rewardGoodsId";
							$(this).attr("name",sname);
						});
						$(".rewardGoodsCount").each(function(index){
							var sname="rewardList["+index+"].rewardGoodsCount";
							$(this).attr("name",sname);
						});
						$(".rewardIsR").each(function(index){
							var sname="rewardList["+index+"].rewardIsRadio";
							$(this).attr("name",sname);
						});
						
						
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