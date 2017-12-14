<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/static/css/back/comm.css" />
	<script type="text/javascript" src="<%= request.getContextPath() %>/thirdparts/time-text/WdatePicker.js"></script>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/thirdparts/jquery-easyui-1.5/themes/icon.css">
	<script type="text/javascript" src="<%= request.getContextPath() %>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/jav1ascript" src="<%= request.getContextPath() %>/thirdparts/dialog4/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/static/js/back/table-ghhs.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/static/js/jquery.form.js"></script>
	<script type="text/javascript">
	
		 <%-- $(function(){
			
			var msg = '<%= request.getAttribute(ResourceKeys.ALERT_MESSAGE)==null ? "":request.getAttribute(ResourceKeys.ALERT_MESSAGE).toString()%>';
			if(msg!=""){
				alert(msg);
			}
		}); --%>
		
	</script>
	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/button-control.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-1.10.2.js"></script>
	
	