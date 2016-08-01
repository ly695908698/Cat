package com.cat.interceptor;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.cat.bean.BasicConfiguration;
import com.cat.service.BasicConfigurationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 该拦截器用来判断网站是否关闭，如果关闭，action被拦截
 * 
 * @author xukaiqiangpc
 * 
 */
@SuppressWarnings("serial")
public class BasicConfigurationInterceptor extends ActionSupport implements
		Interceptor {
	@Autowired
	private BasicConfigurationService basicConfigurationService;
	private BasicConfiguration basicConfiguration;

	public BasicConfiguration getBasicConfiguration() {
		return basicConfiguration;
	}

	public void setBasicConfiguration(BasicConfiguration basicConfiguration) {
		this.basicConfiguration = basicConfiguration;
	}

	@Override
	public void destroy() {
	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		basicConfiguration = basicConfigurationService.findBasicConfiguration();
		// 如果网站打开
		if (basicConfiguration.getWebSiteClose() == 0) {
			Map<String, Object> map = ActionContext.getContext().getSession();
			map.put("basicConfiguration", basicConfiguration);
			return arg0.invoke();
		} else {
			// 如果网站关闭
			Map<String, Object> map = ActionContext.getContext().getSession();
			map.put("basicConfiguration", basicConfiguration);
			return "webisclosed";
		}
	}
}
