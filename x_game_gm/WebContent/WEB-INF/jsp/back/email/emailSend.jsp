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
			/* $('#attachTr').each(function(index){
				$("attachTr["+index+"]").hide();
			}); */
			$('#tr-attachments').hide();
		}
	}

	function addConfine() {
	}
	
	 $(function(){
		$('#fstime').show();
		$('#fstimelevel').hide();
		$('#tr-attachments').hide();
	 })
	 
	
	
    	function addAllEmail(){
		 var array = new Array();
 	    $("[class='check']:checked").each(function () {
 	    	array.push($(this).val());
 	    })
 	    if (array.length == 0)
            {
                alert('请选择服!');
                return false;
            }
    		
    		$("#formadd").ajaxSubmit({
    			url:"<%= request.getContextPath()%>/email/emailSend?serverIds="+array,
    			type:"post",
    			data:  $('#formadd').serialize(),
 				dataType: "json",
    			resetForm:false,
    			success:function(data){
    				if(data=="ok"){
    					alert("发送成功！！");
    				}else{
    					alert(data);
    				}
    			},  
                error:function(xhr,textStatus,errorThrown){  
                    alert("发送邮件失败，请重试");
                } 
    		});
    	}
    	
    	
    	
    </script>

   
    
</head>
<body>

	
    

<form id="formadd">
	<div class="easyui-tabs" style="width: 100%;">
        <div title="邮件基本信息">
      
            <div class="dialog-table">
                <table id="ta" width="100%" border="0" cellspacing="0" cellpadding="0" class="tk_table">
                
                	 <tr>
                      <td width="100px" height="50px"><span class="font01 pr5">*</span>选择服：</td>
                        <td class="white-tr">
                        
                        <c:forEach items="${map}" var="m">.
                        	<input id="checkAll" style="display: inline-block;vertical-align: middle;margin-bottom: 2px;" type="checkbox" onclick="CheckAll(this, '${m.value}')" />全选
	                        			${m.value}区<br>
	                        	<c:forEach items="${serverList}" var="server">
	                        	
										<c:if test="${server.serverArea==m.value}">
										
								
										<input class="check" style="display: inline-block;vertical-align: middle;margin-bottom: 2px;" type="checkbox" value="${server.sid }" name="${server.serverArea }"/><label for="orgcode">  ${server.name }</label>  
								
										</c:if>
									
									</c:forEach>
									<br>
  							</c:forEach>
                  		</td>

                    </tr>
                
                
                
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>发布方式：</td>
                        <td class="white-tr">
                        <input type="radio" class="" id="txtdeptname" value="1" onclick="selectFangShi()" name="receivetype" />系统级别
                        <input type="radio" class="" id="txtdeptname" value="2" onclick="selectFangShi()" checked="checked" name="receivetype" />用户级别
                  		</td>
                    </tr>
                   <tr id="fstime">
                        <td width="100px"><span class="font01 pr5">*</span>用户uid列表：</td>
                        <td class="white-tr">
                          <textarea id="uids" name="uids" rows="5" cols="80"></textarea>
						 	<span class="">多个uid用英文标点逗号'，'隔开</span>
                        </td>
                    </tr>	
                    <tr id="fstimelevel">
                        <td width="100px"><span class="font01 pr5">*</span>等级:</td>
                        <td class="white-tr">
                         <textarea maxlength="10" id="level" name="level" rows="1" cols="5"></textarea>至
                         <textarea maxlength="10" id="levelmax" name="levelmax" rows="1" cols="5"></textarea>
                        </td>
                    </tr>	
                    
                    <tr>
                        <td width="100px"><span class="font01 pr5">*</span>默认邮件类型：</td>
                        <td class="white-tr">
                            <select name="language[0].language">
                            	<option value="1">英语</option>
                            </select>
                        </td>
                    </tr>
                    
					<tr>
                        <td width="100px"><span class="font01 pr5">*</span>默认邮件标题：</td>
                        <td class="white-tr">
                           <input  name="language[0].title" style="width: 120px;" class="search_txt"  />
                        </td>
                    </tr>
                    <tr>
                        <td width=""><span class="font01 pr5">*</span>默认邮件内容：</td>
                        <td class="">
                           <textarea rows="30" cols="70" name="language[0].content"> 
                           
                           </textarea>
                        </td>
                    </tr>
                   
					 <tr>
                        <td width="100px"><span class="font01 pr5">*</span>添加更多语言：</td>
                        <td class="white-tr">
                        <table border="0" id="emailTable">
							<tr>
								<td align="center"><input type="button" value="添加" onclick="addEamilLine();" class="add"></td>
								<td align="left">多语言模版</td>
							</tr>
						</table>
						
						<textarea style="display:none" id="emailTr">
							<tr id="emaiTr{0}">
								<td align="center">
									<a onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a>
								</td>
								<td align="left">
									邮件类型:
									<select class="select" id="language[{0}].language" name="">
										<option value="zh-CN" selected="selected">中文-简体</option>
										<option value="zh-TW">中文-繁体</option>
										<option value="vi-VN">越南</option>
										<option value="ko-KR">朝鲜语&amp;韩语</option>
									</select>
									<br/><br/>
									邮件标题:
									<input type="text" class="inputtitle" id="language[{0}].title" maxlength="40" name="language[{0}].title" class="required">
									<br/><br/>
									邮件内容:
									<textarea class="textarea" cols="80" rows="10" name="" maxlength="2500"/>
									<br/>
									-------------------------------------华丽的分割线------------------------------------------
								</td>
								
								
								
								
								
								
								
								
								
							</tr>
						</textarea>
						
						<script type="text/javascript">
							var emailIndex = 1;
							var emailTpl = $("#emailTr").val();
							function addEamilLine() 
							{
								$('#emailTable').append(emailTpl);
								var indexs=0;
								$(".select").each(function(index){
									indexs=indexs+1;
									var sname="language["+indexs+"].language";
									$(this).attr("name",sname);
								});
								var ind=0;
								$(".textarea").each(function(index){
									ind=ind+1;
									var sname="language["+ind+"].content";
									$(this).attr("name",sname);
								});
								var inds=0;
								$(".inputtitle").each(function(index){
									inds=inds+1;
									var sname="language["+inds+"].title";
									$(this).attr("name",sname);
								});
							}
							function re(tha){
								
								$(tha).parent().parent().remove();
								
							}
						</script>
                        </td>
                    </tr>
                     <tr>
                        <td width="100px"><span class="font01 pr5">*</span>添加物品：</td>
                        <td class="white-tr">
                        <input type="radio" class="" id="txtdeptname" onclick="selectFuJian()" value="1" name="attachment" />是
                        <input type="radio" class="" id="txtdeptname" onclick="selectFuJian()" value="0" name="attachment" checked="checked"/>否
                  		</td>
                  		<table border="0" id="attachTable">
                  		
                  
							<tr id="tr-attachments"> 
								<td align="center"><input type="button" value="添加" onclick="addAttachLine();" class="add"></td>
								<td align="center">道具id</td>
								<td align="center">道具数量</td>
							</tr>
						</table>
						<textarea style="display:none" id="attachTr">
							<tr id="attachTr{0}">
								<td align="center"><a onclick="re(this);" href="javascript:void(0);" class="pn-opt">删除</a></td>
								<td align="center"><input  type="text" class="inputs" id="items[0].itemId" name="" /></td>
								<td align="center">
									<span id="afc{0}" style="position:relative;display:block;">
										<input type='text' class="inputnum" name="items[0].num" id='letter.items[0].num'/>
									</span>
								</td>
							</tr>
						</textarea> 
                    </tr>
                    <script type="text/javascript">
							var attachIndex = 0;
							var attachTpl = $("#attachTr").val();
							function addAttachLine() 
									{
								$('#attachTable').append(attachTpl);
								var indexs=0;
								$(".inputs").each(function(index){
									//indexs=indexs+1;
									var sname="items["+index+"].itemId";
									$(this).attr("name",sname);
								});
								var ind=0;
								$(".inputnum").each(function(index){
									//ind=ind+1;
									var sname="items["+index+"].num";
									$(this).attr("name",sname);
								});
								}
							function re(tha){
								
								$(tha).parent().parent().remove();
								
							}
						</script>
						
						<!-- name="letter.levelmax" -->
            </table>
					
					<br/><br/><input type="submit" class="search_bt commbtn" value="提交" onclick="addAllEmail();return false;" >

            </div>
        </div>
    </div>
</form>	
</body>
</html>