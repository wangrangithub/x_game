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
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.format-1.3.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/demo/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/My97DatePicker/WdatePicker.js" language="javascript"></script>
	
	<script type="text/javascript">
	var attachIndex = 1;
	
	function selectFangShi() {
		var way = $("input[name='receivetype']:checked").val();
		//alert(way);
		if (way == 2) {
			$('#fstime').show();
			$('#tr-attachments').hide();
			$('#fstimelevel').hide();
		} else if(way == 3){
			/* $('#fstimelevel').show();
			$('#tr-attachments').hide();
			$('#fstime').hide(); */
		}
		else if(way == 1){
			$('#tr-attachments').hide();
			$('#fstimelevel').hide();
			$('#fstime').hide();
		}
	}
	
	function selectFuJian() {
		var way = $("input[name='attachment']:checked").val();
		if (way == 1) {
			$('#tr-attachments').show();
		} else {
			$('#tr-attachments').hide();
		}
	}

	 function push(){
		 	var array = new Array();
	 	    $("[class='check']:checked").each(function () {
	 	    	array.push($(this).val());
	 	    })
	 	    if (array.length == 0)
	            {
	                alert('请选择服!');
	                return false;
	            }
	 	   var id = $("#id").val();
	 	   var state = $("#state").val();
	 	   var result = "推送失败，游戏服活动时间冲突！";
	 	    
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/activity/pushBetGodActivityById?serverIds="+array+"&actInfoId="+id+"&state="+state,
    			type:"post",
    			data:  $('#formadd').serialize(),
 				dataType: "json",
    			resetForm:false,
    			success:function(data){
    				if(data=="ok"){
    					alert("推送成功，可前往已推送列表查看！");
    					window.location="<%= request.getContextPath()%>/activity/theGodOfWealthBettingActivityList";
    				}else{
    					alert(result);
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("推送失败,请联系后台人员");
                    return false;
                } 
    		});
		}	
	 
	 
	 
	 
    </script>

   
    
</head>
<body>

	
    

<form id="formadd" method="post" >
	<div class="easyui-tabs" style="width: 100%;">
        <div title="推送基本信息">
       <input type="hidden" class="" id="id" value="${activityInfo.actId }"  name="id" />
       <input type="hidden" class="" id="state" value="${activityInfo.state }"  name="state" />
                  	
            <div class="dialog-table">
                <table id="ta" width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动名称：</td>
                        <td class="white-tr">
                        <input type="text" class="" disabled="disabled" id="txtdeptname" value='<c:if test="${activityInfo.actType==2001 }">财神投注活动</c:if>' onclick="" name="act_name" />
                  		</td>
                    </tr>
                    
                    <tr>
                   		 <td width="100px">活动开始时间：</td>
                    	 <td class="white-tr"><input  name="beginTime" disabled="disabled" style="width: 120px;" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${activityInfo.beginTime }" class="search_txt"  /></td>
                    	
                   	</tr>
                   	 <tr>
                   		<td width="100px">活动结束时间：</td>	
                    	 <td class="white-tr"><input name="endTime" style="width: 120px;" disabled="disabled" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${activityInfo.endTime}" class="search_txt"  /></td>
                        
                   	</tr>
                  
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>状态：</td>
                        <td class="white-tr">
                           <c:choose>
							    <c:when test="${activityInfo.state==-1 }">
								   暂停
							    </c:when>  
							    <c:when test="${activityInfo.state==0 }">
								   预约中
							    </c:when>
							     <c:when test="${activityInfo.state==1&&activityInfo.hashPush==1 }">
								   进行中
							    </c:when>
							     <c:when test="${activityInfo.state==1&&activityInfo.hashPush==0 }">
								   准备中
							    </c:when>
							    <c:otherwise>
								过期
								</c:otherwise>
							</c:choose>
                        </td>
                    </tr>
					 <tr>
                        <td width="100px" height="50px"><span class="font01 pr5">*</span>选择服务器列表：</td>
                        <td class="white-tr">
                        
                        	<c:forEach items="${map}" var="map">.
                        	<input id="checkAll" style="display: inline-block;vertical-align: middle;margin-bottom: 2px;" type="checkbox" onclick="CheckAll(this, '${map.value}')" />全选
	                        			${map.value}区<br>
	                        	<c:forEach items="${serverList}" var="server">
										<c:if test="${server.serverArea==map.value}">
										
										<input id="checkBox"  class="check" style="display: inline-block;vertical-align: middle;margin-bottom: 2px;" type="checkbox" value="${server.sid }" name="${server.serverArea }"/><label for="orgcode">${server.name }</label>  
								
										</c:if>
										
								</c:forEach>
									<br>
  							</c:forEach>
                  		</td>

		
                    </tr>
            </table>
					
					<br/><br/><input type="button" onclick="push();" class="search_bt commbtn" value="推送" >
					<!-- <input type="reset" class="search_bt commbtn" value="重置" > -->
					<input type="button" onclick="goBack();" class="search_bt commbtn" value="返回" >

            </div>
        </div>
    </div>
</form>	
	<script type="text/javascript">
					
			$(function() {//页面加载的时候触发
			    var boxObj = $("input:checkbox");  //获取所有的复选框
			    var expresslist = ${serverIds}; //用el表达式获取在控制层存放的复选框的值为字符串类型
			    //alert(expresslist);
			    //var express = expresslist.split(',');  
			    $.each(expresslist, function(index, expressId){  
			      	//alert(expressId);
			    	boxObj.each(function () {  
			            if($(this).val() == expressId) {  
			               $(this).attr("checked",true);  
			            }  
			            
			        });  
				});
			});function goBack(){
		   		 window.location="<%= request.getContextPath()%>/activity/theGodOfWealthBettingActivityList"		    		 
	   		 }
				$("#checkAll").click(function(){
					$("input:checked").html();
					$("#area").text($("input:checked").html());});
					
					
	</script>
</body>
</html>