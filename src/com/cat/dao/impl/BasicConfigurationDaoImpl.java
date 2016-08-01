package com.cat.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.bean.BasicConfiguration;
import com.cat.dao.BasicConfigurationDao;

@Repository
public class BasicConfigurationDaoImpl implements BasicConfigurationDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void closeWebSite(BasicConfiguration basicConfiguration) {
		Session session = sessionFactory.getCurrentSession();
		session.update(basicConfiguration);
	}

	@Override
	public BasicConfiguration findBasicConfiguration() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from BasicConfiguration");
		return (BasicConfiguration) query.uniqueResult();
	}
}
