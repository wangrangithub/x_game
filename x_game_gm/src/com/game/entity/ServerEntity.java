package com.game.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 服务器列表
 * @author User
 *
 */
@Entity
@Table(name = "t_server")
public class ServerEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	/**
	 * 服务器ID
	 */
	@Column
	private int serverId;
	/**
	 * 服务器地址
	 */
	@Column
	private String serverDbUrl;
	/**
	 * 端口
	 */
	@Column
	private String serverDbPort;
	/**
	 * 实例名
	 */
	@Column
	private String serverDbName;
	/**
	 * 用户名，密码
	 */
	@Column
	private String serverDbUser;
	@Column
	private String serverDbPwd;
	
	/**
	 * 服务器地址
	 */
	@Column
	private String logDbUrl;
	/**
	 * 端口
	 */
	@Column
	private String logPort;
	/**
	 * 实例名
	 */
	@Column
	private String logDbName;
	/**
	 * 用户名，密码
	 */
	@Column
	private String logDbUser;
	@Column
	private String logDbPwd;
	/**
	 * 其他说明
	 */
	@Column(name = "details", columnDefinition = "text")
	private String details;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getServerId() {
		return serverId;
	}
	public void setServerId(int serverId) {
		this.serverId = serverId;
	}
	public String getServerDbUrl() {
		return serverDbUrl;
	}
	public void setServerDbUrl(String serverDbUrl) {
		this.serverDbUrl = serverDbUrl;
	}
	public String getServerDbPort() {
		return serverDbPort;
	}
	public void setServerDbPort(String serverDbPort) {
		this.serverDbPort = serverDbPort;
	}
	public String getServerDbName() {
		return serverDbName;
	}
	public void setServerDbName(String serverDbName) {
		this.serverDbName = serverDbName;
	}
	public String getServerDbUser() {
		return serverDbUser;
	}
	public void setServerDbUser(String serverDbUser) {
		this.serverDbUser = serverDbUser;
	}
	public String getServerDbPwd() {
		return serverDbPwd;
	}
	public void setServerDbPwd(String serverDbPwd) {
		this.serverDbPwd = serverDbPwd;
	}
	public String getLogDbUrl() {
		return logDbUrl;
	}
	public void setLogDbUrl(String logDbUrl) {
		this.logDbUrl = logDbUrl;
	}
	public String getLogPort() {
		return logPort;
	}
	public void setLogPort(String logPort) {
		this.logPort = logPort;
	}
	public String getLogDbName() {
		return logDbName;
	}
	public void setLogDbName(String logDbName) {
		this.logDbName = logDbName;
	}
	public String getLogDbUser() {
		return logDbUser;
	}
	public void setLogDbUser(String logDbUser) {
		this.logDbUser = logDbUser;
	}
	public String getLogDbPwd() {
		return logDbPwd;
	}
	public void setLogDbPwd(String logDbPwd) {
		this.logDbPwd = logDbPwd;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	
	
}
