package com.game.controller.jobs;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import com.game.spider.StartSpider;
import com.game.util.LogUtils;

public class DemoJob implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		LogUtils.job.info("----------------------------------");
		LogUtils.job.info("定时器"+this.getClass()+"开始执行");
		
		//TODO 定时爬虫
		//StartSpider.OBJ.excute();
		
		
		LogUtils.job.info("定时器"+this.getClass()+"执行完成");
		LogUtils.job.info("----------------------------------");
		
	}

}
