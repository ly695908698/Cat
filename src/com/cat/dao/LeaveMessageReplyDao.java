package com.cat.dao;

import com.cat.bean.LeaveMessageReply;

public interface LeaveMessageReplyDao {

	/**
	 * 1.回复
	 * 
	 * @param user
	 */
	public void saveLeaveMessageReply(LeaveMessageReply leaveMessageReply);

}
