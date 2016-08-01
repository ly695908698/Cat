package com.cat.service;

import java.util.List;

import com.cat.bean.LeaveMessage;
import com.cat.bean.LeaveMessageReply;

public interface LeaveMessageService {

	/**
	 * 1.留言
	 * 
	 * @param user
	 */
	public void saveLeaveMessage(LeaveMessage leaveMessage);

	/**
	 * 2.删除留言
	 */
	public void deleteLeaveMessage(LeaveMessage leaveMessage);

	/**
	 * 3.查找所有留言
	 * 
	 * @return
	 */
	public List<LeaveMessage> findLeaveMessage(int pageSize, int pageNow);

	public LeaveMessageReply findLeaveMessageReplyByLeaveMessageId(
			int leaveMessageId);

	/**
	 * 4.通过ID查找留言
	 * 
	 * @param leaveMessageId
	 * @return
	 */
	public LeaveMessage findLeaveMessageById(int leaveMessageId);

	/**
	 * 5.查询所有留言条数
	 * 
	 * @return
	 */
	public Long queryAllCount();

}
