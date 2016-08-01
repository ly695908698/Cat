package com.cat.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 用户类
 * 
 */
@Entity
@Table(name = "user")
public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2143146458653158871L;

	private int userId;// 用户编号

	private String userName;// 用户名

	private String passWord;// 用户密码
	private int power;// 用户的权限 1为管理员0为普通用户
	private int isClosed;// 帐号是否被封 1为被封 0为没有被封
	private int noComments;// 1为禁止评论 0为不禁止评论
	private int noPraise;// 1为禁止点赞 0为不禁止
	private UserDetails userDetails;// 用户的详细信息

	// 双向一对一关联以A类的b属性配置来进行关联
	@OneToOne(mappedBy = "user")
	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	@Column
	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	@Column
	public int getIsClosed() {
		return isClosed;
	}

	public void setIsClosed(int isClosed) {
		this.isClosed = isClosed;
	}

	@Column
	public int getNoComments() {
		return noComments;
	}

	public void setNoComments(int noComments) {
		this.noComments = noComments;
	}

	@Column
	public int getNoPraise() {
		return noPraise;
	}

	public void setNoPraise(int noPraise) {
		this.noPraise = noPraise;
	}


	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(unique = true)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column
	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

}
