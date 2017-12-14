package com.game.logserver.timer;

import java.util.TimerTask;

import com.game.logserver.CommonDAO;

public class CommitLogTask extends TimerTask{

	@Override
	public void run() {
		CommonDAO.OBJ.commitAllLogs();
	}

}
