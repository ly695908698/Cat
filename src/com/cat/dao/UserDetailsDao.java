package com.cat.dao;

import com.cat.bean.UserDetails;

public interface UserDetailsDao {

	/**
	 * 1.保存用户详细信息
	 * 
	 * @param user
	 */
	public void saveUserDetails(UserDetails userDetails);

	/**
	 * 2.根据用户的编号查找用户的详细信息
	 * 
	 * @param userId
	 * @return
	 */
	public UserDetails findUserDetailsByUserId(int userId);

	/**
	 * 3.查找用户的详细信息到前台
	 * 
	 * @return
	 */
	public UserDetails findUserDetailsToFront();
}
