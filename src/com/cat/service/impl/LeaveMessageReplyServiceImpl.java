package com.cat.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.LeaveMessageReply;
import com.cat.dao.LeaveMessageReplyDao;
import com.cat.service.LeaveMessageReplyService;

@Service
public class LeaveMessageReplyServiceImpl implements LeaveMessageReplyService {
	// 注入leaveMessageReplyDao
	@Autowired
	private LeaveMessageReplyDao leaveMessageReplyDao;

	@Override
	public void saveLeaveMessageReply(LeaveMessageReply leaveMessageReply) {
		leaveMessageReplyDao.saveLeaveMessageReply(leaveMessageReply);
	}

}
