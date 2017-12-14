package com.game.bean;

import java.io.Serializable;
import java.util.List;
import org.springframework.validation.FieldError;

public class SimpleResult implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -510324938973962832L;

	/**
	 * 处理异常信息
	 * @param errors
	 */
	public void handlerError(List<FieldError> errors){
		
		for(FieldError error : errors){
			message+=error.getDefaultMessage()+"\n";
		}
		
		result = false;
		
	}

	//设置操作的结果：true|false
	private boolean result = true;
	//错误信息
	private String message = "";

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
