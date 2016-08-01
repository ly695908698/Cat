package com.cat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.LeaveMessage;
import com.cat.bean.LeaveMessageReply;
import com.cat.dao.LeaveMessageDao;
import com.cat.service.LeaveMessageService;

@Service
public class LeaveMessageServiceImpl implements LeaveMessageService {
	// 注入leaveMessageDao
	@Autowired
	private LeaveMessageDao leaveMessageDao;

	@Override
	public void saveLeaveMessage(LeaveMessage leaveMessage) {
		leaveMessageDao.saveLeaveMessage(leaveMessage);
	}

	@Override
	public void deleteLeaveMessage(LeaveMessage leaveMessage) {
		leaveMessageDao.deleteLeaveMessage(leaveMessage);
	}

	@Override
	public List<LeaveMessage> findLeaveMessage(int pageSize, int pageNow) {
		return leaveMessageDao.findLeaveMessage(pageSize, pageNow);
	}

	@Override
	public LeaveMessage findLeaveMessageById(int leaveMessageId) {
		return leaveMessageDao.findLeaveMessageById(leaveMessageId);
	}

	@Override
	public Long queryAllCount() {
		return leaveMessageDao.queryAllCount();
	}

	@Override
	public LeaveMessageReply findLeaveMessageReplyByLeaveMessageId(
			int leaveMessageId) {
		return leaveMessageDao.findLeaveMessageReplyByLeaveMessageId(leaveMessageId);
	}

}
