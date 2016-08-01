package com.cat.dao.impl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.bean.UserDetails;
import com.cat.dao.UserDetailsDao;

@Repository
public class UserDetailsDaoImpl implements UserDetailsDao {
	// 注入sessionFactory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveUserDetails(UserDetails userDetails) {
		// 保存用户
		sessionFactory.getCurrentSession().saveOrUpdate(userDetails);
	}

	@Override
	public UserDetails findUserDetailsByUserId(int userId) {
		String hql = "from UserDetails userDetails where userDetails.user.userId="
				+ userId;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return (UserDetails) query.uniqueResult();
	}

	@Override
	public UserDetails findUserDetailsToFront() {
		String hql = "from UserDetails";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return (UserDetails) query.uniqueResult();
	}
}
