package com.cat.service;

import com.cat.bean.BasicConfiguration;

public interface BasicConfigurationService {
	public void closeWebSite(BasicConfiguration basicConfiguration);

	public BasicConfiguration findBasicConfiguration();
}
