package com.game.logserver.logobjs;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Mytestlog extends AbstractHumanLog{

	/** 当前几阶 */
	private int addEvo = 0;

	@Column
	public int getAddEvo() {
		return addEvo;
	}

	public void setAddEvo(int addEvo) {
		this.addEvo = addEvo;
	}
	
	
}
