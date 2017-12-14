<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/back/comm.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/time-text/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/demo/demo.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/back/My97DatePicker/WdatePicker.js"
	language="javascript"></script>
<script type="text/javascript">
	
	 
	
    	function Adds(){
    		/* var array = new Array();
     	    $("[class='check']:checked").each(function () {
     	    	array.push($(this).val());
     	    }) */
    		$("#formadd").ajaxSubmit({
    			url:"<%=request.getContextPath()%>/shop/addOff",
				type : "post",
				resetForm : false,
				success : function(data) {
					if (data == "ok") {
						//获取父窗口的window对象
						var win = art.dialog.open.origin;
						//调用父窗口的js方法refresh();
						win.refresh();
						//关闭对话框
						art.dialog.close();
					} else {

						alert(data);

					}
				},
				error : function(xhr, textStatus, errorThrown) {
					alert("新增活动失败，请重试");
				}
			});
	}

	function show(input) {
		if (input.value == 1) {
			$("#act_id").val("");
			$("#act_id").attr("disabled", "disabled");
		} else {
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
	function selectFuJian() {
		var way = $("input[name='bgActive']:checked")
				.val();
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
			$('#contentInfo[0].language').attr("name",
					"");
			$('#contentInfo[0].content').attr("name",
					"");
		}
	}
</script>



</head>
<body>
	<form id="formadd">
		<div class="easyui-tabs" style="width: 100%;">
			<div title="活动商品基本信息">

				<div class="dialog-table">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tk_table">
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>活动名称：</td>
							<td class="white-tr"><input type="text" class="easyui-validatebox" required="true" 
								id="txtdeptname" name="act_name" /></td>
						</tr>
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>商品ID：</td>
							<td class="white-tr"><input type="text" class="form-text"
								id="txtdeptname" name="tmplId" /></td>
						</tr>
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>可视条件：</td>
							<td class="white-tr"><input type="text" class="form-text"
								id="txtdeptname" name="visableCond" /></td>
						</tr>
						 <tr>
	                        <td width="100px"><span class="font01 pr5">*</span>购买限制：</td>
	                        <td class="white-tr">
	                            <input type="text" class="form-text" id="txtdeptname" name="purchaseLimit" />
	                        </td>
	                    </tr>
						<tr>
							<td class="white-tr"><input type="radio" class=""
								checked="checked" id="txtdeptname" onclick="selectFuJian()"
								value="1" name="bgActive" />出现活动曝光 <input type="radio" class=""
								id="txtdeptname" onclick="selectFuJian()" value="0"
								name="bgActive" />无活动曝光</td>
						</tr>

						<table id="tr-attachments" class="tk_table"  width="100%">
							<tr>
								<td width="100px"><span class="font01 pr5">*</span>推荐展示位：</td>
								<td class="white-tr"><input type="text" class="form-text"
									id="txtdeptname" name="position" /></td>
							</tr>
							<tr>
								<td width="100px"><span class="font01 pr5">*</span>类型及权重：</td>
								<td class="white-tr"><input type="text" class="form-text"
									id="txtdeptname" name="typeWeight" /></td>
							</tr>
							<tr>
								<td width="100px"><span class="font01 pr5">*</span>开启条件：</td>
								<td class="white-tr"><input type="text" class="form-text"
									id="txtdeptname" name="openCondition" /></td>
							</tr>
							<tr>
								<td width="100px"><span class="font01 pr5">*</span>图标路径：</td>
								<td class="white-tr"><input type="text" class="form-text"
									id="txtdeptname" name="iconDir" /></td>
							</tr>
							<tr>
								<td width="100px"><span class="font01 pr5">*</span>统计信息内容：</td>
								<td class="white-tr"><input type="text" class="form-text"
									id="txtdeptname" name="countInfo" /></td>
							</tr>
							<tr>
								<td width="100px"><span class="font01 pr5">*</span>模板样式：</td>
								<td class="white-tr"><input type="text" class="form-text"
									id="txtdeptname" name="tempId" /></td>
							</tr>

							<table border="0" id="attachTable"  class="tk_table"  width="100%">
								<tr>
									<td width="100px"><span class="font01 pr5">*</span>模板参数：</td>
									<td class="white-tr"><select class=""
										id="contentInfo[0].language" name="contentInfo[0].language">
											<option value="zh-CN" selected="selected">中文-简体</option>
											<option value="zh-TW">中文-繁体</option>
											<option value="vi-VN">越南</option>
											<option value="ko-KR">朝鲜语&amp;韩语</option>
									</select><input type="text" class="form-text" style="width: 500px;"
										id="contentInfo[0].content" name="contentInfo[0].content"
										value="0" /></td>
									<td align="center"><input type="button" value="添加语言模板"
										onclick="addAttachLine();" class="add"></td>
								</tr>
								


							<textarea style="display: none" id="attachTr">
							<tr id="attachTr{0}">
									<td width="100px"><span class="font01 pr5">*</span>模板参数：</td>
									<td align="white-tr"><select class=""
										id="language[{0}].language" name="">
											<option value="zh-CN" selected="selected">中文-简体</option>
											<option value="zh-TW">中文-繁体</option>
											<option value="vi-VN">越南</option>
											<option value="ko-KR">朝鲜语&amp;韩语</option>
									</select>
		                            <input type="text" class="form-text" style="width: 500px;"
										id="txtdeptname" name="" />
		                          </td>
								
								<td align="center"><a onclick="re(this);"
										href="javascript:void(0);" class="pn-opt">删除</a></td>
								
							</tr>
							
						</textarea>
							<script type="text/javascript">
								var attachIndex = 0;
								var attachTpl = $("#attachTr").val();
								function addAttachLine()

								{
									//alert(attachTpl);
									$('#attachTable').append(attachTpl);
									var indexs = 0;
									$(".select")
											.each(
													function(index) {
														indexs = indexs + 1;
														var sname = "contentInfo["
																+ indexs
																+ "].language";
														$(this).attr("name",
																sname);
													});
									var ind = 0;
									$(".inputnum").each(
											function(index) {
												ind = ind + 1;
												var sname = "contentInfo["
														+ ind + "].content";
												$(this).attr("name", sname);
											});
								}

								function re(tha) {

									$(tha).parent().parent().remove();

								}
							</script>
								<tr>
									<td width="100px"><span class="font01 pr5">*</span>弹窗ID：</td>
									<td class="white-tr"><input type="text" class="form-text"
										id="txtdeptname" name="ruleInfo[0].id" value="0"/></td>
								</tr>
								<tr>
									<td width="100px"><span class="font01 pr5">*</span>曝光节点1：</td>
									<td class="white-tr"><input type="text" class="form-text"
										id="txtdeptname" name="ruleInfo[0].node" value="0" /></td>
								</tr>
								<tr>
									<td width="100px"><span class="font01 pr5">*</span>出现概率：</td>
									<td class="white-tr"><input type="text" class="form-text"
										id="txtdeptname" name="ruleInfo[0].rate" value="0" /></td>
								</tr>
								<tr>
									<td width="100px"><span class="font01 pr5">*</span>每日曝光次数：</td>
									<td class="white-tr"><input type="text" class="form-text"
										id="txtdeptname" name="ruleInfo[0].node" value="0" /></td>
								</tr>
								<tr>
									<td width="100px"><span class="font01 pr5">*</span>曝光优先级：</td>
									<td class="white-tr"><input type="text" class="form-text"
										id="txtdeptname" name="ruleInfo[0].priority" value="0" /></td>
								</tr>
								<tr>
									<td width="100px"><span class="font01 pr5">*</span>等级限制：</td>
									<td class="white-tr"><input type="text" class="form-text"
										id="txtdeptname" name="ruleInfo[0].lvLimit" value="0" /></td>
								</tr>
							</table>
							<table border="0" id="bgTable"  class="tk_table"  width="100%">
								<tr>
									<td align="center"><input type="button" value="增加曝光点"
										onclick="addBgLine();"></td>
									<td class="white-tr"></td>
								</tr>
							</table>

							<textarea style="display: none" id="bgTr" class="">
	                 		<tr>
	                 			<td align="center">
	                 				<table class="tk_table"  width="100%">
	                 				<tr>
										<td width="100px"><span class="font01 pr5">*</span>弹窗ID：</td>
										<td class="white-tr"><input type="text" class="form-text"
											id="txtdeptname" name=""  /></td>
									</tr>
			                 		<tr>
			                 			<td width="100px" class="titl"></td>
				                        <td class="white-tr">
				                            <input type="text" class="form-text"
													id="txtdeptname" name="" />
				                        </td>
			                    	</tr>
			                    	<tr>
			                 			<td width="100px"><span class="font01 pr5">*</span>出现概率：</td>
				                        <td class="white-tr">
				                            <input type="text" class="form-text"
													id="txtdeptname" name="" />
				                        </td>
			                    	</tr>
			                    	<tr>
			                 			<td width="100px"><span class="font01 pr5">*</span>每日曝光次数：</td>
				                        <td class="white-tr">
				                            <input type="text" class="form-text"
													id="txtdeptname" name="" />
				                        </td>
			                    	</tr>
			                    	<tr>
			                 			<td width="100px"><span class="font01 pr5">*</span>曝光优先级：</td>
				                        <td class="white-tr">
				                            <input type="text" class="form-text"
													id="txtdeptname" name="" />
				                        </td>
			                    	</tr>
			                    	<tr>
			                 			<td width="100px"><span class="font01 pr5">*</span>等级限制：</td>
				                        <td class="white-tr">
				                            <input type="text" class="form-text"
													id="txtdeptname" name="" />
				                        </td>
				                    -------------------------------------------------华丽的分割线------------------------------------------------------
			                    	</tr>
			                    	</table>
	                 			</td>
	                 			<td align="center">
									<a id="tag" onclick="rem(this);" href="javascript:void(0);"
										class="pn-opt">删除</a>
								</td>
	                 			
	                    	</tr>
						</textarea>


							<script type="text/javascript">
								var bgIn = 1;
								//var emailTpl = $("#emailTr").val();
								var bgTpl = $("#bgTr").val();

								function addBgLine() {
									//alert(bgTpl);
									// alert($.format($("#emailTr").val()));
									//alert(emailTpl);
									$('#bgTable').append(bgTpl);

									var id = 0;
									$(".id").each(
											function(id) {
												id = id + 1;
												var sname = "ruleInfo[" + id + "].id";
												$(this).attr("name", sname);
											});
									var node = 0;
									$(".node").each(
											function(node) {
												node = node + 1;
												var sname = "ruleInfo[" + node + "].node";
												$(this).attr("name", sname);
											});
									var rate = 0;
									$(".rate").each(
											function(rate) {
												rate = rate + 1;
												var sname = "ruleInfo[" + rate + "].rate";
												$(this).attr("name", sname);
											});
									var priority = 0;
									$(".priority").each(
											function(priority) {
												priority = priority + 1;
												var sname = "ruleInfo["+ priority + "].priority";
												$(this).attr("name", sname);
											});
									var rate = 0;
									$(".lvLimit").each(
											function(lvLimit) {
												lvLimit = lvLimit + 1;
													var sname = "ruleInfo[" + lvLimit + "].lvLimit";
														$(this).attr("name",sname);
													});

									var titl = 2;
									$(".titl").each(function(titl) {
										titl = titl + 2;
										var sname = "曝光节点" + titl + ":";
										$(this).text(sname);
									});

								}

								function rem(tha) {
									$(tha).parent().parent().remove();
								}
							</script>

						</table>

						<tr>
							<td class="white-tr"><span class="font01 pr5">*</span>类型：</td>
							<td class="white-tr"><input type="radio" class=""
								id="txtdeptname" name="tim" onclick="show(this)" value="1" />普通活动<td><td class="white-tr">
								<input type="radio" class="" checked="checked" id="txtdeptname"
								name="tim" onclick="show(this)" value="2" />引导活动</td>
						</tr>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tk_table">
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>活动ID：</td>
							<td class="white-tr"><input type="text" class="form-text"
								id="act_id" name="act_id" value="1" /></td>
						</tr>
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>图片名称：</td>
							<td class="white-tr"><input type="text" class="form-text"
								id="txtdeptname" name="picture" /></td>
						</tr>
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>货币：</td>
							<td class="white-tr">
								<select onclick="hidePrice(this)"  class="form-text" name="type">
									<option value="12">钻石</option>
									<option value="11">金币</option>
									<option value="13">荣誉</option>
									<option value="-1">充值货币</option>
								</select>
							</td>
						</tr>
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>价格：</td>
							<td class="white-tr"><input type="text" class="form-text" value="0"
								id="hbjia" name="price"/></td>
						</tr>
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>商品标记：0:无 1:Hot 2:Limited 3:New</td>
							<td class="white-tr"><input type="text" class="form-text"
								id="txtdeptname" name="mark" /></td>
						</tr>
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>优先级：</td>
							<td class="white-tr"><input type="text" class="form-text"
								id="txtdeptname" name="priority" value="1" /></td>
						</tr>
						<!-- <tr>
							<td width="100px"><span class="font01 pr5">*</span>最大购买数：如果填-1不限购</td>
							<td class="white-tr"><input type="text" class="form-text"
								id="txtdeptname" name="maxBuy" /></td>
						</tr> -->
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>开始时间：</td>
							<td class="white-tr"><input class="startDate Wdate"
								id="startDate" name="startTime" type="text"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')}'})"
								value="${param.beginTime }" /></td>
						</tr>
						<tr>
							<td width="100px"><span class="font01 pr5">*</span>结束时间：</td>
							<td class="white-tr"><input class="endDate Wdate"
								name="endTime" id="endDate" type="text"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2120-10-01'})"
								value="${param.endTime}" /></td>
						</tr>
					</table>
					</table>

				</div>
			</div>
		</div>
	</form>
</body>
</html>