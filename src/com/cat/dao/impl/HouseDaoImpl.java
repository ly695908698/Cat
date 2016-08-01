package com.cat.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.bean.House;
import com.cat.dao.HouseDao;

@Repository
public class HouseDaoImpl implements HouseDao {
	// 注入sessionFactory
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<House> findHouses() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from House order by houseCreateTime desc");
		return query.list();
	}

	@Override
	public void addHouse(House house) {
		Session session = (Session) sessionFactory.getCurrentSession();
		session.save(house);
	}

	@Override
	public House findHouseById(int houseId) {
		String hql = "from House where houseId=:houseId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("houseId", houseId);
		return (House) query.uniqueResult();
	}

	@Override
	public void deleteHouse(House house) {
		sessionFactory.getCurrentSession().delete(house);
	}

	@Override
	public void updateHouse(House house) {
		sessionFactory.getCurrentSession().update(house);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<House> findHouses(int pageSize, int pageNow) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from House order by houseCreateTime desc");
		query.setFirstResult(pageNow);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public Long queryAllCount() {
		String hql = "select count(*) from House";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) query.uniqueResult();
	}
}
