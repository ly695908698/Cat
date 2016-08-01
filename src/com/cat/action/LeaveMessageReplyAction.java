package com.cat.action;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cat.bean.LeaveMessageReply;
import com.cat.service.LeaveMessageReplyService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class LeaveMessageReplyAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3190817860600835920L;

	@Autowired
	private LeaveMessageReplyService leaveMessageReplyService;
	private LeaveMessageReply leaveMessageReply;
	private int leaveMessageId;

	public int getLeaveMessageId() {
		return leaveMessageId;
	}

	public void setLeaveMessageId(int leaveMessageId) {
		this.leaveMessageId = leaveMessageId;
	}

	public LeaveMessageReply getLeaveMessageReply() {
		return leaveMessageReply;
	}

	public void setLeaveMessageReply(LeaveMessageReply leaveMessageReply) {
		this.leaveMessageReply = leaveMessageReply;
	}

	/**
	 * 添加
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addLeaveMessageReply() {
		if (leaveMessageReply.getLeaveMessageReplyName().equals("")) {
			leaveMessageReply.setLeaveMessageReplyName("主人");
		}
		leaveMessageReply.setLeaveMessageReplyDate(new Date());
		leaveMessageReplyService.saveLeaveMessageReply(leaveMessageReply);
		return "success";
	}

}
