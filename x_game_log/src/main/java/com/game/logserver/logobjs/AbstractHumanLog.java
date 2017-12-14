package com.game.logserver.logobjs;

import javax.persistence.Column;
import javax.persistence.Entity;


/**
 * 抽象的日志对象
 * 
 * @author hjj2019
 * @since 2013/7/12
 * 
 */
@Entity
public abstract class AbstractHumanLog extends AbstractPlayerLog {
	/** 角色ID */
	protected long charId;
	/** 玩家的角色名 */
	protected String charName;
	/** 玩家等级 */
	protected int level;
	/** 玩家阵营 */
	protected int allianceId;
	/** 玩家 VIP 等级 */
	protected int  vipLevel;
	/** 原因 */
	protected String reason;
	/** 其他参数 */
	protected String param;
	/** 职业类型 */
	private int vocationTypeId;

	/**
	 * 类默认构造器
	 * 
	 */
	AbstractHumanLog() {
	}

	@Column
	public long getCharId() {
		return charId;
	}

	public void setCharId(long charId) {
		this.charId = charId;
	}

	@Column(length = 64)
	public String getCharName() {
		if (charName == null) {
			return "";
		} else {
			return charName.replaceAll(".*([';]+|(--)+).*", "");
		}
	}

	public void setCharName(String charName) {
		this.charName = charName;
	}

	@Column
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	@Column
	public int getAllianceId() {
		return allianceId;
	}

	public void setAllianceId(int allianceId) {
		this.allianceId = allianceId;
	}

	@Column
	public int getVipLevel() {
		return vipLevel;
	}

	public void setVipLevel(int vipLevel) {
		this.vipLevel = vipLevel;
	}

	@Column(columnDefinition = "text default null")
	public String getReason() {
		if (this.reason == null) {
			return "";
		} else {
			return reason;
		}
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Column(length = 4096)
	public String getParam() {
		if (this.param == null) {
			return "";
		} else {
			return param;
		}
	}

	public void setParam(String param) {
		this.param = param;
	}

	@Column(columnDefinition = "tinyint default 0")
	public int getVocationTypeId() {
		return vocationTypeId;
	}

	public void setVocationTypeId(int vocationTypeId) {
		this.vocationTypeId = vocationTypeId;
	}
	
}