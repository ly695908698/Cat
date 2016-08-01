package com.cat.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

/**
 * 动态类
 * 
 */
@Entity
@Table(name = "dynamic")
public class Dynamic implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2143146458653158871L;

	private int dynamicId;// 动态编号
	private String dynamicImg;// 动态图片
	private Date dynamicDate;// 动态的日期
	private String dynamicContent;// 动态内容
	private String dynamicTitle;// 动态标题

	@Column
	@Type(type="text")
	public String getDynamicContent() {
		return dynamicContent;
	}

	@Column
	public Date getDynamicDate() {
		return dynamicDate;
	}

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getDynamicId() {
		return dynamicId;
	}

	@Column
	public String getDynamicImg() {
		return dynamicImg;
	}

	@Column
	public String getDynamicTitle() {
		return dynamicTitle;
	}

	public void setDynamicContent(String dynamicContent) {
		this.dynamicContent = dynamicContent;
	}

	public void setDynamicDate(Date dynamicDate) {
		this.dynamicDate = dynamicDate;
	}

	public void setDynamicId(int dynamicId) {
		this.dynamicId = dynamicId;
	}

	public void setDynamicImg(String dynamicImg) {
		this.dynamicImg = dynamicImg;
	}

	public void setDynamicTitle(String dynamicTitle) {
		this.dynamicTitle = dynamicTitle;
	}

}
