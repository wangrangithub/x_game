<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/echarts.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/back/comm.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/time-text/WdatePicker.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/themes/icon.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/artDialog.js?skin=blue"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/thirdparts/dialog4/plugins/iframeTools.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/back/table-ghhs.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.form.js"></script>
	
	
	<script type="text/javascript">
		/**
		 * 查询 - 分页
		 * @param newPageIndex
		 * @param formid
		 */
		function pageIndexChanging(newPageIndex, formid){
			$("#pageIndex").val(newPageIndex);
			var start = $("input[name='createdatetimeStart']").val();
			if(start!=""){
					$("#"+formid).submit();
			}else{
				alert("请输入日期");
			}
		}
		
		function refresh(){
			pageIndexChanging(1, "form1");
		}
		
		
		function Add(){
			art.dialog.open("<%= request.getContextPath()%>/jurisdiction/add.do", {
                width: '800px',
                height: '450px',
                title: "新增权限信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    iframeWin.Add();
                    return false;
                },
                cancel: true
            });
		}
		
		function updateEmp(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要修改的权限");
			}else if(idArray.length>1){
				alert("每次只能修改1个权限");
			}else{
				var id = idArray[0];
				art.dialog.open("<%= request.getContextPath()%>/jurisdiction/update.do?id="+id, {
	                width: '700px',
	                height: '450px',
	                title: "修改权限信息",
	                opacity: 0.3,
	                skin: 'green',
	                lock: true,
	                ok: function (iframeWin, topWin) {
	                    // iframeWin: 对话框iframe内容的window对象
	                    // topWin: 对话框所在位置的window对象
	                    iframeWin.updateEmp();
	                    return false;
	                },
	                cancel: true
	            });
			}
		}
		
		function deleteEmp(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要删除的权限");
			}else if(idArray.length>1){
				alert("每次只能删除1个权限");
			}else{
				if(confirm('您确定要删除该权限信息吗 - 删除后无法恢复？')){
					var id = idArray[0];
					var url = "<%= request.getContextPath()%>/jurisdiction/delete.do?id="+id;
					
					window.location.href=url;			
				}
			}
			
			//checkError();
			
		}
		/* function checkError(){
			
			if($("#er").val()==null&&$("#er").val()==""){
				
				alert("删除成功！");
			}else{
				alert($("#er").val());
			}
		} */
		
		
		function viewDept(){
			var idArray = getSelectionIds("tabledept");
			if(idArray.length==0){
				alert("请选择要查看的权限");
			}else if(idArray.length>1){
				alert("每次只能查看1个权限");
			}else{
				var id = idArray[0];
				viewDeptById(id);
			}
		}
		
		function viewDeptById(deptId){
			var url = "details.html";
			art.dialog.open(url, {
                width: '500px',
                height: '250px',
                title: "查看权限信息",
                opacity: 0.3,
                skin: 'green',
                lock: true,
                ok: function (iframeWin, topWin) {
                    // iframeWin: 对话框iframe内容的window对象
                    // topWin: 对话框所在位置的window对象
                    return true;
                },
                cancel: true
            });
		}
		
		$(function(){
			//按钮权限
			var url = "<%=request.getContextPath()%>/jurisdiction/control.do";
			var href = window.location.pathname;
			//alert($(".function input")[0]);
			$.getJSON(url, {href:href}, function(data){
				//alert(data);
				$(".function input").each(function(i, item){
					var btnId = $(item).attr("id");
					//alert(btnId);
					var flag = false;
					$.each(data, function(j, menu){
						if(menu.funurl == btnId){
							flag = true;
						}
					});
					if(flag==true){
						$(item).show();
					}
				});
			});
			var er =$("#error").text();
			if(er!=null&&er!=""){
				
				alert(er);
			}
		})
		
	</script>

</head>
<body>
 <form id="form1" method="post" action="<%=request.getContextPath()%>/SortCount/online_num">
        <div class="container">
            <div class="content">
                <div class="loaction">
                    <p><span class="pl30">当前位置：</span>后台管理平台<span class="pl5">></span><span class="pl5">实时统计</span><span class="pl5">></span><span class="pl5">实时在线人数</span></p>
                </div>
                <!--功能按钮区域-->
                <!-- <div class="function">
                    <input style="display:none;" id="btnAddDept" type="button" value="新增维修登记" class="btn_new commbtn" onclick="addDept()" />
                    <input style="display:none;" id="btnViewDept" type="button" value="维修回执" class="btn_find commbtn" onclick="viewDept()" />
                    <input style="display:none;" id="btnUpdateDept" type="button" value="修改维修登记" class="btn_edit commbtn" onclick="updateDept()" />
                    <input style="display:none;" id="btnDeleteDept" type="button" value="删除维修登记" class="btn_del commbtn" onclick="deleteDept();" />
                </div> -->
                <div class="clear"></div>
                <!--查询条件区域-->
                <div class="funsearch">
                    <div class="search_list">
                    	<!-- <span>维修登记名称：</span>
                    	<input name="deptName" type="text" class="search_txt" value="${param.deptName }" /> -->
                    	日期：
                    	<input  name="createdatetimeStart" style="width: 120px;" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" value="${param.createdatetimeStart }" class="search_txt"  />
                    
                    	<%--   选择服：
                        <select class="select_gallery" name="serverId" style="width: 150px;">  
							<optgroup label="服信息">  
								<option value="-1" >请选择</option>
								<c:forEach items="${serverList}" var="server">
									<option value="${server.sid }"  
										<c:if test="${param.serverId==server.sid }">selected="selected"</c:if>>
											${server.name }
										</option>
								</c:forEach>
							</optgroup>
				        </select>  --%>
                    
                    </div>
                    	
                    <input type="button" onclick="pageIndexChanging(1, 'form1');" class="search_bt commbtn" value="搜索" />
                	
                </div>
                <!--数据分页-->
		         <jsp:include page="/WEB-INF/jsp/back/common/pagesection.jsp">
		        	<jsp:param value="form1" name="formid"/>
		        </jsp:include>  
                
                <!--搜索结果-->
               <table id="tabledept" width="100%" border="0" cellspacing="1" cellpadding="0" class="table_list">
                    <!--表头部分-->
                    <thead>
                        <tr>
                            
                            <th style="width:100px;">时间</th>
                            <th style="width:100px;">在线人数</th>
                        </tr>
                    </thead>
                    <!--数据部分-->
                    <tbody>
                    <c:forEach items="${pageModel.dateList}" var="r" varStatus="status">
                        <tr>
                                                     
                            <td>${r.date }</td>
                            <td>${r.reCount }</td>
                        </tr>                        
                    </c:forEach>
                    
                    </tbody>
                </table>
		        
            </div>
        </div>
    </form>


<div id="main" style="width: 100%;height:400px;"></div>

<%-- <script type="text/javascript">
var myChart;  
var eCharts;  

require.config({  
    paths : {  
        'echarts' : '${pageContext.request.contextPath}/js/echarts2.0/echarts' ,  
        'echarts/chart/line' : '${pageContext.request.contextPath}/js/echarts2.0/echarts' //需要的组件  
    }  
});  

require(  
    [ 'echarts',   
      'echarts/chart/line'  
    ], DrawEChart //异步加载的回调函数绘制图表  
);  

//创建ECharts图表方法  
function DrawEChart(ec) {  
    eCharts = ec;  
    myChart = eCharts.init(document.getElementById('main'));  
    myChart.showLoading({  
        text : "图表数据正在努力加载..."  
    });  
    //定义图表options  
    var options = {  
        title : {  
            text : "未来一周气温变化",  
            subtext : "纯属虚构",  
            sublink : "http://www.baidu.com"  
        },  
        tooltip : {  
            trigger : 'axis'  
        },  
        legend : {  
            data : [ "最高气温" ]  
        },  
        toolbox : {  
            show : true,  
            feature : {  
                mark : {  
                    show : true  
                },  
                dataView : {  
                    show : true,  
                    readOnly : false  
                },  
                magicType : {  
                    show : true,  
                    type : [ 'line', 'bar' ]  
                },  
                restore : {  
                    show : true  
                },  
                saveAsImage : {  
                    show : true  
                }  
            }  
        },  
        calculable : true,  
        xAxis : [ {  
            type : 'category',  
            boundaryGap : false,  
            data : [ '1', '2', '3', '4', '5', '6', '7' ]  
        } ],  
        yAxis : [ {  
            type : 'value',  
            axisLabel : {  
                formatter : '{value} °C'  
            },  
            splitArea : {  
                show : true  
            }  
        } ],  
        grid : {  
            width : '90%'  
        },  
        series : [ {  
            name : '最高气温',  
            type : 'line',  
            data : [ 11, 22, 33, 44, 55, 33, 44 ],//必须是Integer类型的,String计算平均值会出错  
            markPoint : {  
                data : [ {  
                    type : 'max',  
                    name : '最大值'  
                }, {  
                    type : 'min',  
                    name : '最小值'  
                } ]  
            },  
            markLine : {  
                data : [ {  
                    type : 'average',  
                    name : '平均值'  
                } ]  
            }  
        } ]  
    };  
    myChart.setOption(options); //先把可选项注入myChart中  
    myChart.hideLoading();  
    getChartData();//aja后台交互   
}  


</script>
<script type="text/javascript">  
        function getChartData() {  
        	var sta =$("input[name=createdatetimeStart]").val();
            //获得图表的options对象  
            var options = myChart.getOption();  
            //通过Ajax获取数据  
            $.ajax({  
                type : "post",  
                async : false, //同步执行  
                url : "<%=request.getContextPath()%>/SortCount/echartdata.json",  
                data : {createdatetimeStart:createdatetimeStart},  
                dataType : "json", //返回数据形式为json  
                success : function(result) {  
                    if (result) {  
                        options.legend.data = result.legend;  
                        options.xAxis[0].data = result.category;  
                        options.series[0].data = result.series[0].data;  
  
                        myChart.hideLoading();  
                        myChart.setOption(options);  
                    }  
                },  
                error : function(errorMsg) {  
                    alert("不好意思，大爷，图表请求数据失败啦!");  
                    myChart.hideLoading();  
                }  
            });  
        }  
    </script>  
     --%>
      <script type="text/javascript">
    
    	<%-- $(function(){
    		var sta =$("input[name=createdatetimeStart]").val();
    		
    		alert(sta);
    		//通过Ajax获取数据
            $.ajax({
                type : "get",
                async : false, //同步执行
                url : "<%=request.getContextPath()%>/SortCount/echartdata",
                data : {createdatetimeStart:createdatetimeStart},
                dataType : "json", //返回数据形式为json
                success : function(result) {
                    if (result) {
                    	
                    	// 基于准备好的dom，初始化echarts实例
                        var myChart = echarts.init(document.getElementById('main'));

                        // 指定图表的配置项和数据

                        var option = {
                            tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'bar'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        data:result.legend
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : result.category
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : result.series};

                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);
                    	
                    	
                    }
                },
                error : function(errorMsg) {
                    alert("不好意思，大爷，图表请求数据失败啦!");
                    myChart.hideLoading();
                }
            });
    		
    	}); --%>
    	
<%-- 
    	$(function(){
    		var createdatetimeStart =$("input[name=createdatetimeStart]").val();
    		
    		
    		//通过Ajax获取数据
    		$.ajax({type:"get",
    		url:"<%=request.getContextPath()%>/SortCount/echartdata",
    		data : {createdatetimeStart:createdatetimeStart},
    		success:function(result){
    			if (result) {
    				//alert(result.series);
                	// 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('main'));
                    var datas =  new Array();
                    $.each(result.series, function(i, item) {
                    	
                    	datas[i]=item.data;
                    	
                    });
                	/* for(var i=0;i<result.series.length;i++){
                		
                		datas[i]=result.series[i];
                		
                	}  */
                	//alert(datas);
                    // 指定图表的配置项和数据
					
                    /* var option = {
                        tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'axis'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    data:result.legend
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis : [
                    {
                        type : 'category',
                        data : result.category
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : result.series}; */

                
                option = {

                        title: {      //标题组件

                            text: '实时在线用户'

                        },

                        tooltip: {    //提示框组件

                            trigger: 'axis',
                            	axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                    type : 'line'        // 默认为直线，可选为：'line' | 'shadow'
                                }

                        },

                        legend: {     //图例组件

                            data: result.legend

                        },

                        grid: {       //直角坐标系内绘图网格

                            left: '3%',

                            right: '4%',

                            bottom: '3%',

                            containLabel: true

                        },

                        toolbox: {     //工具栏

                            feature: {

                                saveAsImage: {}

                            }

                        },

                        xAxis: {       //直角坐标系 grid 中的 x 轴

                            type: 'category',

                            boundaryGap: false,

                            data:  result.category

                        },

                        yAxis: {       //直角坐标系 grid 中的 y 轴

                            type: 'value'

                        },

                        series :result.series};
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                	
                	
                }
    		},datatype:"json"});
    		
          
    	});
    
     --%>
       
    </script>
</body>
</html>
	