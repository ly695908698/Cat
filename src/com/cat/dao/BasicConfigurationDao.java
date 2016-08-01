package com.cat.dao;

import com.cat.bean.BasicConfiguration;

public interface BasicConfigurationDao {

	public void closeWebSite(BasicConfiguration basicConfiguration);

	public BasicConfiguration findBasicConfiguration();
}
