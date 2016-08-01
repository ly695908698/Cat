package com.cat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.User;
import com.cat.dao.UserDao;
import com.cat.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;


	@Override
	public User login(String userName, String passWord) {
		return userDao.login(userName, passWord);
	}


	@Override
	public void saveUser(User user) {
		userDao.saveUser(user);
	}
}
