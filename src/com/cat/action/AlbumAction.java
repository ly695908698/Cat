package com.cat.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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
public class AlbumAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3190817860600835920L;

	@Autowired
	private AlbumService albumService;
	@Autowired
	private WorkService workService;
	private List<Album> albumsList;
	private List<Works> works;

	private Album album;
	private int albumId;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private List<Album> albums;

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

	/**
	 * 添加相册的信息##################################################################
	 */
	public String addAlbum() throws IOException {

		// 定义一个文件的保存的路径
		String savePath = ServletActionContext.getServletContext().getRealPath(
				"back/thumbs/" + this.uploadFileName);
		// 保存文件
		// 创建文件的读取上传的文件
		FileInputStream fis = new FileInputStream(upload);
		FileOutputStream fos = new FileOutputStream(savePath);
		// 复制文件
		IOUtils.copy(fis, fos);

		album.setAlbumCover(uploadFileName);
		TimeZone time = TimeZone.getTimeZone("GMT+8"); // 设置为东八区
		TimeZone.setDefault(time);// 设置时区
		Calendar calendar = Calendar.getInstance();// 获取实例
		album.setAlbumCreateTime(calendar.getTime());
		albumService.addAlbum(album);
		// 清空缓存
		fos.flush();
		// 关闭文件流
		fos.close();
		return "success";
	}

	/**
	 * 删除相册信息###################################################################
	 * 
	 * @return
	 */
	public String deleteAlbum() {
		album = albumService.findAlbumById(albumId);
		albumService.deleteAlbum(album);
		return "success";
	}

	/**
	 * 根据相册的编号查找相册的信息###########################################################
	 * 
	 * @return
	 */
	public String findAlbumById() {
		album = albumService.findAlbumById(albumId);
		return "success";
	}

	/**
	 * 查询所有的相册信息到后台#############################################################
	 * 
	 * @return
	 */
	public String findAlbums() {
		albumsList = albumService
				.findAlbums(pageSize, (pageNow - 1) * pageSize);
		long count = albumService.queryAllCount();
		pageAll = count % pageSize == 0 ? count / pageSize : count / pageSize
				+ 1;
		return "success";
	}

	/**
	 * 查找相册的信息为了上传##############################################################
	 * 
	 * @return
	 */
	public String findAlbumsForUpload() {
		albums = albumService.findAlbumsForUpload();
		return "success";
	}

	/**
	 * 更新相册的信息##################################################################
	 * 
	 * @return
	 * @throws IOException
	 */
	public String updateAlbum() throws IOException {
		// 如果照片没有更新
		if (this.uploadFileName == null) {
			albumService.updateAlbum(album);
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
			album.setAlbumCover(uploadFileName);
			TimeZone time = TimeZone.getTimeZone("GMT+8"); // 设置为东八区
			TimeZone.setDefault(time);// 设置时区
			Calendar calendar = Calendar.getInstance();// 获取实例
			album.setAlbumCreateTime(calendar.getTime());
			albumService.updateAlbum(album);
			// 清空缓存
			fos.flush();
			// 关闭文件流
			fos.close();
		}
		return "success";
	}

	/**
	 * 根据相册的编号查找作品的信息###########################################################
	 * 
	 * @return
	 */
	public String findWorksByAlbumId() {
		works = albumService.findWorksByAlbumId(albumId,pageSize, (pageNow - 1) * pageSize);
		long count = workService.queryAllCount();
		pageAll = count % pageSize == 0 ? count / pageSize : count / pageSize
				+ 1;
		return "success";
	}

	/*********************************************** 以上是后台 **********************************************************************/

	/**
	 * 查找相册信息到前台页面##############################################################
	 * 
	 * @return
	 */
	public String findAlbumsToFront() {
		albums = albumService.findAlbums();
		albumsList = new ArrayList<Album>();
		for (Album album : albums) {
			// 如果相册状态为显示
			if (album.getAlbumStatus() == 1) {
				albumsList.add(album);
			}
		}
		return "success";
	}

	/**
	 * 查询作品通过相册编号到前台############################################################
	 * 
	 * @return
	 */
	public String findWorksByAlbumIdToFront() {
		works = albumService.findWorksByAlbumId(albumId);
		return "success";
	}

	public List<Album> getAlbums() {
		return albums;
	}

	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}

	public Album getAlbum() {
		return album;
	}

	public int getAlbumId() {
		return albumId;
	}

	public AlbumService getAlbumService() {
		return albumService;
	}

	public List<Album> getAlbumsList() {
		return albumsList;
	}

	public File getUpload() {
		return upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public void setAlbumService(AlbumService albumService) {
		this.albumService = albumService;
	}

	public void setAlbumsList(List<Album> albumsList) {
		this.albumsList = albumsList;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<Works> getWorks() {
		return works;
	}

	public void setWorks(List<Works> works) {
		this.works = works;
	}
}
