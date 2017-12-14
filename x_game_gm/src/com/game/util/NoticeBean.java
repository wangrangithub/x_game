package com.game.util;

import java.io.Serializable;

public class NoticeBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String language;
	
	private String content;

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
