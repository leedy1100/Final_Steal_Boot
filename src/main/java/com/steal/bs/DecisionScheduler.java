package com.steal.bs;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.steal.bs.Document.DocumentBiz;

@Component
public class DecisionScheduler {

	@Autowired
	private DocumentBiz biz;
	@Autowired
	private Job job;
	@Autowired
	private JobLauncher jobLauncher;
	
	@Scheduled(cron = "0 45 20 * * *")
	public void scheduleTest() throws Exception {
		biz.initAlert();
		jobLauncher.run(job, new JobParameters());
	}
}
