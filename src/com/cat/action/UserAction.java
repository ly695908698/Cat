package com.cat.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cat.bean.User;
import com.cat.service.UserService;
import com.cat.util.MD5Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3190817860600835920L;

	// /////////////////////////////////////////////��Ա����/////////////////////////////////////
	// 注入UserService
	@Autowired
	private UserService userService;
	private User user;
	// 表单中的rand
	private String rand;

	// /////////////////////////////////////////get/set/////////////////////////////////////////

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	// ///////////////////////////////////////Action//////////////////////////////////////////////

	/**
	 * 1.登录
	 * 
	 * @return
	 */
	public String login() {
		// 从session中取出RandomAction.java 中生成的验证码random
		String arandom = (String) (ActionContext.getContext().getSession()
				.get("random"));
		// 判断验证码是否输入正确,验证码正确，进行登录操作
		if (arandom.equals(this.getRand())) {
			// 获取session中的user
			Map<String, Object> map = ActionContext.getContext().getSession();
			// 如果用户没有登录
			// 获取前台用户提交的用户名和密码
			user = userService.login(user.getUserName(), user.getPassWord());
			if (user != null) {
				// 将用户名和密码保存到session中
				map.put("user", user);
				return "success";
			} else {
				//清空session中的信息
				map.remove("user");
				// 添加错误信息
				this.addFieldError("loginerror", "您登录时输入的用户名或密码错误了！");
				return "input";
			}
		} else {
			// 验证码错误
			this.addFieldError("loginerror", "您登录时输入的验证码错误了！");
			return "input";
		}

	}

	/**
	 * 2.退出登录
	 * 
	 * @return
	 */
	public String logOut() {
		Map<String, Object> map = ActionContext.getContext().getSession();
		map.remove("user");
		map.remove("basicConfiguration");
		return "success";
	}

	/**
	 * 3.用户注册
	 * 
	 * @return
	 */
	public String saveUser() {
		// 调用saveUser方法保存用户
		user.setPassWord(MD5Util.calc(user.getPassWord()));
		userService.saveUser(user);
		return "success";
	}

	/**
	 * 4.前台用户登录
	 * 
	 * @return
	 */
	public String frontLogin() {
		// 从session中取出RandomAction.java 中生成的验证码random
		String arandom = (String) (ActionContext.getContext().getSession()
				.get("random"));

		// 判断验证码是否输入正确,验证码正确，进行登录操作
		if (arandom.equals(this.getRand())) {
			// 调用登录方法获取用户
			user = userService.login(user.getUserName(), user.getPassWord());
			// 将用户信息放入到session中保存
			Map<String, Object> map = ActionContext.getContext().getSession();
			map.put("user", user);
			if (user != null) {
				return "success";
			} else {
				// 添加错误信息
				this.addFieldError("loginerror", "用户名或密码错误！");
				return "input";

			}
		} else {
			// 验证码错误
			this.addFieldError("loginerror", "验证码错误！");
			return "input";
		}
	}

	/**
	 * 4.前台用户退出登录
	 * 
	 * @return
	 */
	public String frontUserLogOut() {
		Map<String, Object> map = ActionContext.getContext().getSession();
		map.clear();
		return "success";
	}
}
