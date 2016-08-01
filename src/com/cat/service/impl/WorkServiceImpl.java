package com.cat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.Works;
import com.cat.dao.WorkDao;
import com.cat.service.WorkService;

@Service
public class WorkServiceImpl implements WorkService {
	// ע注入UserDao
	@Autowired
	private WorkDao workDao;

	/*
	 * 1.查找所有的作品
	 */
	public List<Works> findWorks() {
		return workDao.findWorks();
	}

	@Override
	public void addWork(Works work) {
		workDao.addWork(work);
	}

	@Override
	public Works findWorksById(int workId) {
		return workDao.findWorksById(workId);
	}

	@Override
	public void deleteWorks(Works works) {
		workDao.deleteWorks(works);
	}

	@Override
	public void updateWorks(Works works) {
		workDao.updateWorks(works);
	}

	@Override
	public List<Works> findWorks(int pageSize, int pageNow) {
		return workDao.findWorks(pageSize, pageNow);
	}

	@Override
	public Long queryAllCount() {
		return workDao.queryAllCount();
	}
}
