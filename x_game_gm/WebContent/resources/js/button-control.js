$(function(){
	
	//alert(window.location.href);
	
	var url = window.location.pathname;
	//alert(url);
	
	$.getJSON("<%=request.getContextPath()%>/jurisdiction/control.do", {url:url}, function(data){
		
		//data包含两个集合
		//1.所有需要进行控制的按钮列表
		//2.当前用户拥有的按钮列表                                                
		
		$(".function :button").each(function(i, item){
			
			var btnId = $(item).attr("id");
			
			//
			var allown=false;
			$.each(data.btn1, function(j, menu){
				
				if(menu.funUrl==btnId){
					allown=true;
				}
				
			});
			
			
			if(allown==true){
				
				//该用户是否拥有对该按钮的权限
				$.each(data.btn2, function(k, btn2){
					
					
				})
				
				
			}
			
		});
		
	});
	
});