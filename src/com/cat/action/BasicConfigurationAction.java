package com.cat.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cat.bean.BasicConfiguration;
import com.cat.service.BasicConfigurationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class BasicConfigurationAction extends ActionSupport {
	private static final long serialVersionUID = -3190817860600835920L;
	@Autowired
	private BasicConfigurationService basicConfigurationService;
	private BasicConfiguration basicConfiguration;

	public String findBasicConfiguration() {
		basicConfiguration = basicConfigurationService.findBasicConfiguration();
		return "success";
	}

	public String findBasicConfigurationToFront() {
		basicConfiguration = basicConfigurationService.findBasicConfiguration();
		Map<String, Object> map = ActionContext.getContext().getSession();
		map.put("basicConfiguration", basicConfiguration);
		return "success";
	}

	public String closeWebSite() {
		basicConfigurationService.closeWebSite(basicConfiguration);
		return "success";
	}

	public BasicConfiguration getBasicConfiguration() {
		return basicConfiguration;
	}

	public void setBasicConfiguration(BasicConfiguration basicConfiguration) {
		this.basicConfiguration = basicConfiguration;
	}
}
