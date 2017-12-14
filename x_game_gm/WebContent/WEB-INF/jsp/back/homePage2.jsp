<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/back/comm.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/font/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/demo/demo.css">


<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script>
	$(function() {
		$("#top").show();
		$("#leftmenu").show();
		$("#main").show();
		$("#bottom").show();
		$("#mm").show();
		$("#tabs").show();
		$(".cs-west .cs-navi-tab").click(function() {
			$(".cs-west .cs-navi-tab").removeClass("actived");
			$(this).addClass("actived");
		});
	});
</script>
<script>
	function addTab(title, url) {
		if ($('#tabs').tabs('exists', title)) {
			$('#tabs').tabs('select', title);//选中并刷新
			var currTab = $('#tabs').tabs('getSelected');
			var url = $(currTab.panel('options').content).attr('src');
			if (url != undefined && currTab.panel('options').title != '首页') {
				$('#tabs').tabs('update', {
					tab : currTab,
					options : {
						content : createFrame(url)
					}
				})
			}
		} else {
			var content = createFrame(url);
			$('#tabs').tabs('add', {
				title : title,
				content : content,
				closable : true
			});
		}
		tabClose();
	}
	function createFrame(url) {
		var s = '<iframe scrolling="auto" frameborder="0"  src="' + url
				+ '" style="width:100%;height:100%;"></iframe>';
		return s;
	}

	function tabClose() {
		/*双击关闭TAB选项卡*/
		$(".tabs-inner").dblclick(function() {
			var subtitle = $(this).children(".tabs-closable").text();
			$('#tabs').tabs('close', subtitle);
		})
		/*为选项卡绑定右键*/
		$(".tabs-inner").bind('contextmenu', function(e) {
			$('#mm').menu('show', {
				left : e.pageX,
				top : e.pageY
			});

			var subtitle = $(this).children(".tabs-closable").text();

			$('#mm').data("currtab", subtitle);
			$('#tabs').tabs('select', subtitle);
			return false;
		});
	}
	//绑定右键菜单事件
	function tabCloseEven() {
		//刷新
		$('#mm-tabupdate').click(function() {
			var currTab = $('#tabs').tabs('getSelected');
			var url = $(currTab.panel('options').content).attr('src');
			if (url != undefined && currTab.panel('options').title != '首页') {
				$('#tabs').tabs('update', {
					tab : currTab,
					options : {
						content : createFrame(url)
					}
				})
			}
		})
		//关闭当前
		$('#mm-tabclose').click(function() {
			var currtab_title = $('#mm').data("currtab");
			$('#tabs').tabs('close', currtab_title);
		})
		//全部关闭
		$('#mm-tabcloseall').click(function() {
			$('.tabs-inner span').each(function(i, n) {
				var t = $(n).text();
				if (t != '首页') {
					$('#tabs').tabs('close', t);
				}
			});
		});
		//关闭除当前之外的TAB
		$('#mm-tabcloseother').click(function() {
			var prevall = $('.tabs-selected').prevAll();
			var nextall = $('.tabs-selected').nextAll();
			if (prevall.length > 0) {
				prevall.each(function(i, n) {
					var t = $('a:eq(0) span', $(n)).text();
					if (t != '首页') {
						$('#tabs').tabs('close', t);
					}
				});
			}
			if (nextall.length > 0) {
				nextall.each(function(i, n) {
					var t = $('a:eq(0) span', $(n)).text();
					if (t != '首页') {
						$('#tabs').tabs('close', t);
					}
				});
			}
			return false;
		});
		//关闭当前右侧的TAB
		$('#mm-tabcloseright').click(function() {
			var nextall = $('.tabs-selected').nextAll();
			if (nextall.length == 0) {
				//msgShow('系统提示','后边没有啦~~','error');
				alert('后边没有啦~~');
				return false;
			}
			nextall.each(function(i, n) {
				var t = $('a:eq(0) span', $(n)).text();
				$('#tabs').tabs('close', t);
			});
			return false;
		});
		//关闭当前左侧的TAB
		$('#mm-tabcloseleft').click(function() {
			var prevall = $('.tabs-selected').prevAll();
			if (prevall.length == 0) {
				alert('到头了，前边没有啦~~');
				return false;
			}
			prevall.each(function(i, n) {
				var t = $('a:eq(0) span', $(n)).text();
				$('#tabs').tabs('close', t);
			});
			return false;
		});

		//退出
		$("#mm-exit").click(function() {
			$('#mm').menu('hide');
		})
	}

	$(function() {
		tabCloseEven();

		$('.cs-navi-tab').click(function() {
			var $this = $(this);
			var href = $this.attr('src');
			var title = $this.text();
			addTab(title, href);
		});
		$('.cs-navi-Index').click(function() {
			var $this = $(this);
			var href = $this.attr('src');
			if (href != null) {
				var title = $this.attr('tabText').toString();
				addTab(title, href);
			} else {
				Look();
			}
		});
	});
	function setCookie(name, value) {//两个参数，一个是cookie的名子，一个是值
		var Days = 30; //此 cookie 将被保存 30 天
		var exp = new Date(); //new Date("December 31, 9998");
		exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
		document.cookie = name + "=" + escape(value) + ";expires="
				+ exp.toGMTString();
	}

	function getCookie(name) {//取cookies函数        
		var arr = document.cookie.match(new RegExp("(^| )" + name
				+ "=([^;]*)(;|$)"));
		if (arr != null)
			return unescape(arr[2]);
		return null;
	}
</script>
<script type="text/javascript">  
 function startTime(){ 
 	var today = new Date();
	var week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");    
	var year=today.getUTCFullYear(); 
	var month=today.getUTCMonth()+1;    
	var date=today.getUTCDate();   
	var day=today.getUTCDay();    
	var h=today.getUTCHours();    
	var m=today.getUTCMinutes();    
	var s=today.getUTCSeconds();    
	// add a zero in front of numbers<10    
	h=checkTime(h);    
	m=checkTime(m);    
	s=checkTime(s);    
	document.getElementById('time').innerHTML=" "+year+"年"+month+"月"+date+"日  "+week[day]+"  "+h+":"+m+":"+s+" ";    
	t=setTimeout('startTime()',500);    
 }    
    
 function checkTime(i){    
 	if (i<10){
 		i="0" + i
 	}    
   	return i    
 }    
</script>    
    
</head>
<body class="easyui-layout master_wrap"  onload="startTime();">
	<form runat="server">
		<div id="top" data-options="region:'north'" style="display: block;">
			<div class="header">
				<div class="logo fl">
					<!--  欢迎来到管理系统 -->
					<img style="margin: 0px; padding: 0px; height: 45px;"
						src="<%=request.getContextPath()%>/resources/images/companytwo.jpg" />
				</div>
				<div class="header_right fr" >
					<span  class="personinfor" id="time"></span>
					<span  class="personinfor" >(UTC时间)</span>
					<span class="personinfor">
						<span class="icon_user"></span>${USER.adminname},您好，欢迎登陆此系统！</span>
					<a href="#" title="修改密码"><span class="icon_pwd"></span></a> <a
						href="javascript:if(confirm('您确定要退出系统吗？')){location.href='<%=request.getContextPath()%>/logout.do';}"
						title="退出系统"><span class="icon_exit"></span></a>
				</div>
			</div>
			<!--header-->
		</div>
		<!--north-->




		<div id="leftmenu" data-options="region:'west'"
			title="菜单导航" style="width: 220px;" class="cs-west">

			<div class="easyui-accordion" border="false">
				<c:forEach items="${funs}" var="fun">
					<c:if test="${fun.parentfunid==null}">

						<div title="${fun.funname}">
							<c:forEach items="${funs}" var="subfun">
								<c:if test="${subfun.parentfunid==fun.funid}">

									<a href="javascript:void(0);"
										src="<%=request.getContextPath() %>${subfun.funurl}" 
										class="cs-navi-tab"><em>${subfun.funname}</em></a>

								</c:if>
							</c:forEach>
						</div>

					</c:if>
				</c:forEach>
			</div>
			<!--cs-west-->
		</div>
		<!--west-->
		<div id="main"
			data-options="region:'center',iconCls:'icon-ok',border:'false'"
			style="border: 0; display: none;">
			<div id="tabs" class="easyui-tabs" fit="true" border="false"
				style="width: 100%; display: none;">
				<div title="首页">
					<div class="cs-home-remark">
						<div class="home-wrap" style="font-size: 20px;">
							<!--wrap-list-->
							欢迎来到后台管理系统
							<!--wrap-list-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="bottom" data-options="region:'south',split:true"
			style="overflow: hidden; border: 0; display: none;">
			<div class="footer"></div>
		</div>
		<!--south-->
		<div id="mm" class="easyui-menu cs-tab-menu" style="display: none;">
			<div id="mm-tabupdate">刷新</div>
			<div class="menu-sep"></div>
			<div id="mm-tabclose">关闭</div>
			<div id="mm-tabcloseother">关闭其他</div>
			<div id="mm-tabcloseall">关闭全部</div>
		</div>
	</form>

</body>
</html>