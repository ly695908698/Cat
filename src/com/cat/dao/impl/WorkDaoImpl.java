package com.cat.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.bean.Works;
import com.cat.dao.WorkDao;

@Repository
public class WorkDaoImpl implements WorkDao {
	// 注入sessionFactory
	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * 1.查找所有作品
	 */
	@SuppressWarnings("unchecked")
	public List<Works> findWorks() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Works");
		return query.list();
	}

	@Override
	public void addWork(Works work) {
		Session session = (Session) sessionFactory.getCurrentSession();
		session.save(work);
	}

	@Override
	public Works findWorksById(int workId) {
		String sql = "from Works where workId=:workId";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setInteger("workId", workId);
		return (Works) query.uniqueResult();
	}

	@Override
	public void deleteWorks(Works works) {
		sessionFactory.getCurrentSession().delete(works);

	}

	@Override
	public void updateWorks(Works works) {
		sessionFactory.getCurrentSession().update(works);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Works> findWorks(int pageSize, int pageNow) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Works order by workUploadDate desc");
		query.setFirstResult(pageNow);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public Long queryAllCount() {
		String hql = "select count(*) from Works";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) query.uniqueResult();
	}
}
