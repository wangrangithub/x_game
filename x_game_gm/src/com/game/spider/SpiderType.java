package com.game.spider;

public enum SpiderType {
	type_demo("1","测试类型"),
	;
	
	
	private String index;
	private String moduleName;
	
	private SpiderType(String index, String moduleName) {
	    this.index = index;
	    this.moduleName = moduleName;
    }

	public String getIndex() {
		return index;
	}

	public String getModuleName() {
		return moduleName;
	}
	
	public String strVal(){
		return index;
	}
	
	public static SpiderType parse(String index){
		for (SpiderType e : SpiderType.values()) {
			if (e == null) {
				continue;
			}
			if (e.getIndex() == index) {
				return e;
			}
		}
		return null;
	}
}
