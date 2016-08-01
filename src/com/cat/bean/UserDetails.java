package com.cat.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 用户详细信息类
 * 
 */
@Entity
@Table(name = "userdetails")
public class UserDetails implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2143146458653158871L;

	private int userDetailsId;// 用户详细信息编号

	private String sex;// 性别

	private String email;// 邮件
	private String phone;// 手机
	private String address;// 地址
	private int age;// 年龄
	private String qq;// 腾序QQ
	private String introduce;// 用户自我介绍
	private String headPhoto;// 用户头像

	@Column
	public String getHeadPhoto() {
		return headPhoto;
	}

	public void setHeadPhoto(String headPhoto) {
		this.headPhoto = headPhoto;
	}

	private User user;// 用户

	@OneToOne
	@JoinColumn(name = "User", unique = true)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column
	public String getAddress() {
		return address;
	}

	@Column
	public int getAge() {
		return age;
	}

	@Column
	public String getEmail() {
		return email;
	}

	@Column
	public String getIntroduce() {
		return introduce;
	}

	@Column
	public String getPhone() {
		return phone;
	}

	@Column
	public String getQq() {
		return qq;
	}

	@Column
	public String getSex() {
		return sex;
	}

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getUserDetailsId() {
		return userDetailsId;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setUserDetailsId(int userDetailsId) {
		this.userDetailsId = userDetailsId;
	}

	public UserDetails() {
		super();
	}

	public UserDetails(int userDetailsId, String sex, String email,
			String phone, String address, int age, String qq, String introduce) {
		super();
		this.userDetailsId = userDetailsId;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.age = age;
		this.qq = qq;
		this.introduce = introduce;
	}

}
