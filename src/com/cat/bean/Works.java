package com.cat.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 作品类
 * 
 * @author xukaiqiangpc
 * 
 */
@Entity
@Table(name = "works")
public class Works {

	// 作品id
	private int workId;
	// 作品名称
	private String workName;
	// 作品上传日期
	private Date workUploadDate;
	private long workPraiseCount;
	private String workDescription;
	private String workSrc;
	private String workType;
	private Album album;

	@ManyToOne(targetEntity = Album.class)
	@JoinColumn(name = "album_Id", updatable = false)
	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	@Column
	public String getWorkSrc() {
		return workSrc;
	}

	@Column
	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public void setWorkSrc(String workSrc) {
		this.workSrc = workSrc;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	@Column
	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public Works() {
		super();
	}

	@Column
	public Date getWorkUploadDate() {
		return workUploadDate;
	}

	public void setWorkUploadDate(Date workUploadDate) {
		this.workUploadDate = workUploadDate;
	}

	@Column
	public long getWorkPraiseCount() {
		return workPraiseCount;
	}

	public void setWorkPraiseCount(long workPraiseCount) {
		this.workPraiseCount = workPraiseCount;
	}

	@Column
	public String getWorkDescription() {
		return workDescription;
	}

	public void setWorkDescription(String workDescription) {
		this.workDescription = workDescription;
	}

	public Works(String workName, Date workUploadDate, String workDescription,
			String workSrc, String workType) {
		super();
		this.workName = workName;
		this.workUploadDate = workUploadDate;
		this.workDescription = workDescription;
		this.workSrc = workSrc;
		this.workType = workType;
	}

}
