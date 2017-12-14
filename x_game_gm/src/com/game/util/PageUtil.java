package com.game.util;

import java.util.List;

public class PageUtil<T> {

	private Integer pageIndex = 1;
	
	private Integer pageSize = 20;
	
	private Integer pageCount = 0;
	
	public PageUtil (){
		
		super();
	}

	public PageUtil(Integer pageIndex, Integer pageSize) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
	}
	
	private List<T> dateList;
	
	private Long totalCount = 0l;

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageCount() {
		pageCount =(int) Math.ceil(this.totalCount * 1.0/this.pageSize);
		
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getDateList() {
		return dateList;
	}

	public void setDateList(List<T> list) {
		this.dateList = list;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
