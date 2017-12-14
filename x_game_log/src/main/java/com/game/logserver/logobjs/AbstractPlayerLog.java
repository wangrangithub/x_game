package com.game.logserver.logobjs;

import javax.persistence.Column;


/**
 * 玩家日志
 * 
 * @author hjj2019 
 * @since 2013/7/12
 * 
 */
public class AbstractPlayerLog extends AbstractLog{
	/** 玩家账号 Id */
	protected long accountId;
	/** 玩家的账号名 */
	protected String accountName;
	/**腾讯传入id */
	protected String openid;//


	/**
	 * 类默认构造器
	 * 
	 */
	AbstractPlayerLog() {
	}

	@Column
	public long getAccountId() {
		return accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	@Column(length = 64)
	public String getAccountName() {
		if (this.accountName == null) {
			return "";
		} else {
			return accountName;
		}
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	@Column(length = 64)
	public String getOpenId() {
		if (this.openid == null) {
			return "";
		} else {
			return openid;
		}
	}

	public void setOpenId(String openid) {
		this.openid = openid;
	}

	
}