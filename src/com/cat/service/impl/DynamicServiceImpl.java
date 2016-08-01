package com.cat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.Dynamic;
import com.cat.dao.DynamicDao;
import com.cat.service.DynamicService;

@Service
public class DynamicServiceImpl implements DynamicService {
	@Autowired
	private DynamicDao dynamicDao;

	@Override
	public List<Dynamic> findDynamics() {
		return dynamicDao.findDynamics();
	}

	@Override
	public void addDynamic(Dynamic dynamic) {
		dynamicDao.addDynamic(dynamic);
	}

	@Override
	public Dynamic findDynamicById(int dynamicId) {
		return dynamicDao.findDynamicById(dynamicId);
	}

	@Override
	public void deleteDynamic(Dynamic dynamic) {
		dynamicDao.deleteDynamic(dynamic);
	}

	@Override
	public void updateDynamic(Dynamic dynamic) {
		dynamicDao.updateDynamic(dynamic);
	}

	@Override
	public List<Dynamic> findDynamics(int pageSize, int pageNow) {
		return dynamicDao.findDynamics(pageSize, pageNow);
	}

	@Override
	public Long queryAllCount() {
		return dynamicDao.queryAllCount();
	}

}
