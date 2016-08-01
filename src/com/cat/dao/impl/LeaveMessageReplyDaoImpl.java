package com.cat.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.bean.LeaveMessageReply;
import com.cat.dao.LeaveMessageReplyDao;

@Repository
public class LeaveMessageReplyDaoImpl implements LeaveMessageReplyDao {
	// 注入sessionFactory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveLeaveMessageReply(LeaveMessageReply leaveMessageReply) {
		sessionFactory.getCurrentSession().saveOrUpdate(leaveMessageReply);
	}
}
