package com.game.util;

import java.util.ArrayList;
import java.util.List;

public class NodelTree {

	
	private Integer id;
	private String text;
	private List<NodelTree> children=new ArrayList<NodelTree>();
	private boolean checked;
	
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<NodelTree> getChildren() {
		return children;
	}
	public void setChildren(List<NodelTree> children) {
		this.children = children;
	}
	
	
}
