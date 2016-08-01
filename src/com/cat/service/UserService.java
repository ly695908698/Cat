package com.cat.service;

import com.cat.bean.User;

public interface UserService {
	/**
	 * 1.登录
	 * 
	 * @param userName
	 * @param passWord
	 * @return
	 */
	public User login(String userName, String passWord);
	/**
	 * 2.注册用户
	 * 
	 * @param user
	 */
	public void saveUser(User user);
}
