package com.cat.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.bean.Dynamic;
import com.cat.dao.DynamicDao;

@Repository
public class DynamicDaoImpl implements DynamicDao {
	// 注入sessionFactory
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Dynamic> findDynamics() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Dynamic order by dynamicDate desc");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Dynamic> findDynamics(int pageSize, int pageNow) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Dynamic order by dynamicDate desc");
		// limit起始和行数设置
		query.setFirstResult(pageNow);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public void addDynamic(Dynamic dynamic) {
		Session session = (Session) sessionFactory.getCurrentSession();
		session.save(dynamic);
	}

	@Override
	public Dynamic findDynamicById(int dynamicId) {
		String hql = "from Dynamic where dynamicId=:dynamicId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("dynamicId", dynamicId);
		return (Dynamic) query.uniqueResult();
	}

	@Override
	public void deleteDynamic(Dynamic dynamic) {
		sessionFactory.getCurrentSession().delete(dynamic);
	}

	@Override
	public void updateDynamic(Dynamic dynamic) {
		sessionFactory.getCurrentSession().update(dynamic);
	}

	@Override
	public Long queryAllCount() {
		String hql = "select count(*) from Dynamic";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) query.uniqueResult();
	}

}
