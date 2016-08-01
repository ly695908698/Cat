package com.cat.interceptor;

import java.util.Map;

import com.cat.bean.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 该拦截器用来判断后台用户是否登录，如果没有登录，action被拦截
 * 
 * @author xukaiqiangpc
 * 
 */
@SuppressWarnings("serial")
public class UserLoginInterceptor extends ActionSupport implements Interceptor {

	@Override
	public void destroy() {
	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		System.out.println("进入拦截器了。。。");
		// 获取session中的用户
		Map<String, Object> map = ActionContext.getContext().getSession();
		User user = (User) map.get("user");
		// 如果登录，继续执行
		if (user != null) {
			return arg0.invoke();
		} else {
			// 如果用户没有登录，跳转到登录界面
			return "usernotlogin";
		}
	}
}
