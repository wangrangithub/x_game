package com.game.util;

import java.io.Serializable;
import java.util.Date;

/**
* @version : 2016年8月31日 下午4:25:44
* @author : xueln
*
*/
public class Emailmsg implements Serializable {

	private static final long serialVersionUID = 1L;

	//收件类型：0全服收取 1：指定收件人 2等级收取
	private Integer receivetype;

	//低等级
	private Integer level;

	//高等级
	private Integer levelmax;

	private long id;

	private String uids;
	
	//private List<LanguageBean> language;

	//创建时间
	private Date createTime;

	

	

	//0无附件，1有附件
	private Integer attachment;

	//0未删除，1已删除
	private Integer delete;

	//附件：key为itemId,value为数量
	//private List<ItemBean> items;

	private Date beginTime;

	private Date endTime;

	public Integer getReceivetype() {
		return receivetype;
	}

	public void setReceivetype(Integer receivetype) {
		this.receivetype = receivetype;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getLevelmax() {
		return levelmax;
	}

	public void setLevelmax(Integer levelmax) {
		this.levelmax = levelmax;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}


	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getAttachment() {
		return attachment;
	}

	public void setAttachment(Integer attachment) {
		this.attachment = attachment;
	}

	public Integer getDelete() {
		return delete;
	}

	public void setDelete(Integer delete) {
		this.delete = delete;
	}


	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	
}
