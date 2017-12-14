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
    			
    			url:"<%=path%>/activity/activityBettingAdd",
    			type:"post",
    			resetForm:false,
    			success:function(data){
    				if(data=="ok"){
    					//获取父窗口的window对象
    					var win = art.dialog.open.origin;  
    					//调用父窗口的js方法refresh();
    					win.refresh();
    					//关闭对话框
    					alert("添加成功");
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
                <table width="100%" border="0" cellspacing="0" id="da" cellpadding="0" class="tk_table">
		            <input type="hidden" name="typeid" value="${typeid}"/>
					<tr>
						<td width="100px"><span class="font01 pr5">*</span>所属精彩活动类型：</td>
						<td class="white-tr"><select name="actId"
							disabled="disabled">
								<option <c:if test="${typeid==2001}">selected="selected"</c:if>
									value="2001">财神投注活动</option>
						</select></td>
					</tr>

					<!-- <tr>
                        <td width="100px"><span class="font01 pr5">*</span>模板类型：</td>
                        <td class="white-tr">
                        	
                            <input type="radio"  class=""  name="isOpenTmpl" value="0"/>否
                            <input type="radio"  class=""  name="isOpenTmpl" value="1"/>开服模板
                            <br />
                            	开始第 <input type="text" value="" name="actInfoStartDay"/>天 结束第<input type="text" value="" name="actInfoEndDay"/>天
                        </td>
                    </tr> -->
                    <tr>
                   		 <td width="100px">开始时间：</td>
                    	 <td class="white-tr">
                    	 	<input class="startDate Wdate" id="startDate" name="actInfoStartTimes" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}'})" value=""/>
                    	 </td>
                    	
                   	</tr>
                   	<tr>
                   		<td width="100px">结束时间：</td>	
                    	 <td class="white-tr">
                    	 	<input class="endDate Wdate" name="actInfoEndTimes" id="endDate" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2120-10-01'})" value=""/>
                    	 </td>
                   	</tr>
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>活动描述：</td>
                        <td class="white-tr">
                        	<textarea rows="10" cols="80" name="description"></textarea>
                        </td>
                    </tr>
                </table>
                 <script type="text/javascript">
					var attachIndex = 0;
					var attachTpl = $("#emailT").val();
					
					function addAttachLine(e) 
					
							{
						/* var attachlength=$(".rewardGoodsId").length; */	
						var attachlength=$(e).parent("td").parent("tr").parent("tbody").children("tr").length;
						var stus=$(e).parent().attr("stuts");
						var content=attachindex(attachlength,stus);
						$(e).parent().parent().parent().append(content);
						
						var indexs=0;
						
						}
						function re(tha){
						
						$(tha).parent().parent().remove();
						
					}
		</script>
			
		<script type="text/javascript">
			var emaillength=0;
			function addLeiEamilLine() 
			{
				emaillength=$(".cumulativePay").length+1;
				//alert(emaillength);
	                		var content=emailindexs(emaillength);
				
				$('#dd').append(content);
				
				var indexs=0;
				$(".rechargeDiamCount").each(function(index){
					var sname="rechargeList["+index+"].rechargeDiamCount";
					var a =$(this).attr("sta");
					//alert(a);
					if(a==1){
						var sname="rechargeList["+index+"].cumulativePay";
					}
					$(this).attr("name",sname);
				});
				$(".rechargeIsRadio").each(function(index){
					var sname="rechargeList["+index+"].rechargeIsRadio";
					$(this).attr("name",sname);
				});
				
			}
			
			function rem(tha){
				
				$(tha).parent().parent().remove();
				
			}
		</script>	
			
       <script type="text/javascript">
			var attachIndex = 0;
			var attachTpl = $("#emailT").val();
			
			function addAttachLines(e) {
				/* var attachlength=$(".rewardGoodsId").length; */	
				var attachlength=$(e).parent("td").parent("tr").parent("tbody").children("tr").length;
				var stus=$(e).parent().attr("stut");
				var content=attachindexs(attachlength,stus);
				$(e).parent().parent().parent().append(content);
				
				var indexs=0;
				
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