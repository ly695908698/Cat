package com.cat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.BasicConfiguration;
import com.cat.dao.BasicConfigurationDao;
import com.cat.service.BasicConfigurationService;

@Service
public class BasicConfigurationServiceImpl implements BasicConfigurationService {
	@Autowired
	private BasicConfigurationDao basicConfigurationDao;

	@Override
	public void closeWebSite(BasicConfiguration basicConfiguration) {
		basicConfigurationDao.closeWebSite(basicConfiguration);
	}

	@Override
	public BasicConfiguration findBasicConfiguration() {
		return basicConfigurationDao.findBasicConfiguration();
	}
}
