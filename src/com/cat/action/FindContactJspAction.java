package com.cat.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cat.bean.UserDetails;
import com.cat.service.UserDetailsService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class FindContactJspAction extends ActionSupport {
	private static final long serialVersionUID = -3190817860600835920L;

	@Autowired
	private UserDetailsService userDetailsService;
	private UserDetails userDetails;

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	
	/**
	 * 1.查找用户的详细信息到前台的contact.jsp
	 * @return
	 */
	public String findContactJsp() {
		userDetails = userDetailsService.findUserDetailsToFront();
		return "success";
	}
}