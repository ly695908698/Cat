package com.cat.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author xukaiqiangpc
 * 
 */
@Entity
@Table(name = "house")
public class House implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2143146458653158871L;

	private int houseId;

	private Date houseCreateTime;

	private int houseStatus;
	private String houseImgsrc;
	private String houseDescription;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getHouseId() {
		return houseId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	@Column
	public Date getHouseCreateTime() {
		return houseCreateTime;
	}

	public void setHouseCreateTime(Date houseCreateTime) {
		this.houseCreateTime = houseCreateTime;
	}

	@Column
	public int getHouseStatus() {
		return houseStatus;
	}

	public void setHouseStatus(int houseStatus) {
		this.houseStatus = houseStatus;
	}

	@Column
	public String getHouseImgsrc() {
		return houseImgsrc;
	}

	public void setHouseImgsrc(String houseImgsrc) {
		this.houseImgsrc = houseImgsrc;
	}

	@Column
	public String getHouseDescription() {
		return houseDescription;
	}

	public void setHouseDescription(String houseDescription) {
		this.houseDescription = houseDescription;
	}

}
