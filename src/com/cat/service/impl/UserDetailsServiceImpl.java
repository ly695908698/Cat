package com.cat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.UserDetails;
import com.cat.dao.UserDetailsDao;
import com.cat.service.UserDetailsService;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	// 注入UserDao
	@Autowired
	private UserDetailsDao userDetailsDao;

	@Override
	public void saveUserDetails(UserDetails userDetails) {
		userDetailsDao.saveUserDetails(userDetails);
	}

	@Override
	public UserDetails findUserDetailsByUserId(int userId) {
		return userDetailsDao.findUserDetailsByUserId(userId);
	}

	@Override
	public UserDetails findUserDetailsToFront() {
		return userDetailsDao.findUserDetailsToFront();
	}

}
