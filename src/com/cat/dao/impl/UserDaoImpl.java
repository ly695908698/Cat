package com.cat.dao.impl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.bean.User;
import com.cat.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {
	// 注入sessionFactory
	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * 1.登录
	 */
	public User login(String userName, String passWord) {

		// 创建HQL语句
		Query query = sessionFactory
				.getCurrentSession()
				.createQuery(
						"from User u where u.userName=:userName and u.passWord=md5(:passWord)");
		// 设置HQL语句中的参数
		query.setString("userName", userName);
		query.setString("passWord", passWord);
		// 执行HQL语句
		return (User) query.uniqueResult();
	}

	/**
	 * 2. 注册用户
	 */
	@Override
	public void saveUser(User user) {
		// 保存用户
		sessionFactory.getCurrentSession().save(user);
	}
}
