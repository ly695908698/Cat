package com.cat.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author xukaiqiangpc
 * 
 */
@Entity
@Table(name = "album")
public class Album implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2143146458653158871L;

	private int albumId;

	private String albumName;
	private Date albumCreateTime;

	private int albumStatus;
	private String albumCover;
	private String albumDescription;
	// 外键
	private Set<Works> works;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,targetEntity=Works.class)
	@JoinColumn(name = "album_Id", updatable = false)
	public Set<Works> getWorks() {
		return works;
	}

	public void setWorks(Set<Works> works) {
		this.works = works;
	}

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getAlbumId() {
		return albumId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	@Column
	public String getAlbumName() {
		return albumName;
	}

	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}

	@Column
	public Date getAlbumCreateTime() {
		return albumCreateTime;
	}

	public void setAlbumCreateTime(Date albumCreateTime) {
		this.albumCreateTime = albumCreateTime;
	}

	@Column
	public int getAlbumStatus() {
		return albumStatus;
	}

	public void setAlbumStatus(int albumStatus) {
		this.albumStatus = albumStatus;
	}

	@Column
	public String getAlbumCover() {
		return albumCover;
	}

	public void setAlbumCover(String albumCover) {
		this.albumCover = albumCover;
	}

	@Column
	public String getAlbumDescription() {
		return albumDescription;
	}

	public void setAlbumDescription(String albumDescription) {
		this.albumDescription = albumDescription;
	}
}
