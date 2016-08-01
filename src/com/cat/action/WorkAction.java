package com.cat.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cat.bean.Album;
import com.cat.bean.Works;
import com.cat.service.AlbumService;
import com.cat.service.WorkService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class WorkAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3190817860600835920L;

	@Autowired
	private WorkService workService;
	@Autowired
	private AlbumService albumService;
	private List<Works> worksList;
	private Works works;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private List<Album> albumsList;
	private Album album;
	private int workId;
	private int albumId;
	// 分页三变量
	private int pageNow = 1;
	private int pageSize = 5;
	private long pageAll = 0;

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getPageAll() {
		return pageAll;
	}

	public void setPageAll(long pageAll) {
		this.pageAll = pageAll;
	}

	public int getAlbumId() {
		return albumId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public List<Album> getAlbumsList() {
		return albumsList;
	}

	public void setAlbumsList(List<Album> albumsList) {
		this.albumsList = albumsList;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * 1.查找所有的作品################################################################
	 * 
	 * @return
	 */
	public String findWorks() {
		worksList = workService.findWorks(pageSize, (pageNow - 1) * pageSize);
		return "success";
	}

	/**
	 * 2.通过id查找作品信息#############################################################
	 * 
	 * @return
	 */
	public String findWorksById() {
		works = workService.findWorksById(works.getWorkId());
		albumsList = albumService.findAlbumsForUpload();
		// 找出该作品属于的相册
		for (int i = 0; i < albumsList.size(); i++) {
			if (albumsList.get(i).getAlbumId() == works.getAlbum().getAlbumId()) {
				album = albumsList.get(i);
			}
		}
		return "success";
	}

	/**
	 * 2.通过id查找作品信息用于更新#########################################################
	 * 
	 * @return
	 */
	public String findWorksByIdForUpdate() {
		works = workService.findWorksById(workId);
		albumsList = albumService.findAlbumsForUpload();
		return "success";
	}

	/**
	 * 添加#######################################################################
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addWorks() throws IOException {
		// 定义一个文件的保存的路径
		String savePath = ServletActionContext.getServletContext().getRealPath(
				"back/thumbs/" + this.uploadFileName);
		// 保存文件
		// 创建文件的读取上传的文件
		FileInputStream fis = new FileInputStream(upload);
		FileOutputStream fos = new FileOutputStream(savePath);
		// 复制文件
		IOUtils.copy(fis, fos);
		TimeZone time = TimeZone.getTimeZone("GMT+8"); // 设置为东八区
		TimeZone.setDefault(time);// 设置时区
		Calendar calendar = Calendar.getInstance();// 获取实例
		// 保存图片信息
		works.setWorkUploadDate(calendar.getTime());
		works.setWorkSrc(uploadFileName);
		works.setWorkType(uploadContentType);
		// 插入
		workService.addWork(works);
		// 清空缓存
		fos.flush();
		// 关闭文件流
		fos.close();
		return "success";
	}

	/**
	 * 删除作品信息###################################################################
	 * 
	 * @return
	 */
	public String deleteWorks() {
		works = workService.findWorksById(workId);
		workService.deleteWorks(works);
		return "success";
	}

	/**
	 * 更新作品#####################################################################
	 * 
	 * @return
	 * @throws IOException
	 */
	public String updateWorks() throws IOException {
		// 如果照片没有更新
		if (this.uploadFileName == null) {
			workService.updateWorks(works);
		} else {
			// 定义一个文件的保存的路径
			String savePath = ServletActionContext.getServletContext()
					.getRealPath("back/thumbs/" + this.uploadFileName);
			// 保存文件
			// 创建文件的读取上传的文件
			FileInputStream fis = new FileInputStream(upload);
			FileOutputStream fos = new FileOutputStream(savePath);
			// 复制文件
			IOUtils.copy(fis, fos);
			TimeZone time = TimeZone.getTimeZone("GMT+8"); // 设置为东八区
			TimeZone.setDefault(time);// 设置时区
			Calendar calendar = Calendar.getInstance();// 获取实例
			// 保存图片信息
			works.setWorkUploadDate(calendar.getTime());
			// 保存图片信息
			works.setWorkSrc(uploadFileName);
			works.setWorkType(uploadContentType);
			// 更新
			workService.updateWorks(works);
			// 清空缓存
			fos.flush();
			// 关闭文件流
			fos.close();
		}
		return "success";
	}

	public List<Works> getWorksList() {
		return worksList;
	}

	public void setWorksList(List<Works> worksList) {
		this.worksList = worksList;
	}

	public void setWorks(Works works) {
		this.works = works;
	}

	public Works getWorks() {
		return works;
	}
}
