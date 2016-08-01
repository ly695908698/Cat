package com.cat.bean;

import java.io.Serializable;

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
@Table(name = "basicconfiguration")
public class BasicConfiguration implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2143146458653158871L;

	private Integer basicConfigurationId;

	public void setBasicConfigurationId(Integer basicConfigurationId) {
		this.basicConfigurationId = basicConfigurationId;
	}

	private int webSiteClose;
	private String closeWebSiteReason;
	private String webSiteName;
	private String webSiteUrl;
	private String indexFileName;

	@Column
	public String getWebSiteUrl() {
		return webSiteUrl;
	}

	public void setWebSiteUrl(String webSiteUrl) {
		this.webSiteUrl = webSiteUrl;
	}

	@Column
	public String getIndexFileName() {
		return indexFileName;
	}

	public void setIndexFileName(String indexFileName) {
		this.indexFileName = indexFileName;
	}

	@Column
	public String getWebSiteName() {
		return webSiteName;
	}

	public void setWebSiteName(String webSiteName) {
		this.webSiteName = webSiteName;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column
	public Integer getBasicConfigurationId() {
		return basicConfigurationId;
	}

	@Column
	public String getCloseWebSiteReason() {
		return closeWebSiteReason;
	}

	@Column
	public int getWebSiteClose() {
		return webSiteClose;
	}

	public void setWebSiteClose(int webSiteClose) {
		this.webSiteClose = webSiteClose;
	}

	public void setCloseWebSiteReason(String closeWebSiteReason) {
		this.closeWebSiteReason = closeWebSiteReason;
	}
}
