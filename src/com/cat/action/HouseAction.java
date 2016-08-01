package com.cat.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cat.bean.House;
import com.cat.service.HouseService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class HouseAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3190817860600835920L;

	@Autowired
	private HouseService houseService;
	private List<House> houses;

	private House house;
	private int houseId;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private List<House> houseList;
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

	public List<House> getHouseList() {
		return houseList;
	}

	public void setHouseList(List<House> houseList) {
		this.houseList = houseList;
	}

	public List<House> getHouses() {
		return houses;
	}

	public void setHouses(List<House> houses) {
		this.houses = houses;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	public int getHouseId() {
		return houseId;
	}

	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}

	/**
	 * 添加小窝信息###################################################################
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addHouse() throws IOException {

		// 定义一个文件的保存的路径
		String savePath = ServletActionContext.getServletContext().getRealPath(
				"back/housesimg/" + this.uploadFileName);
		// 保存文件
		// 创建文件的读取上传的文件
		FileInputStream fis = new FileInputStream(upload);
		FileOutputStream fos = new FileOutputStream(savePath);
		// 复制文件
		IOUtils.copy(fis, fos);

		house.setHouseImgsrc(uploadFileName);
		house.setHouseCreateTime(new Date());
		houseService.addHouse(house);
		// 清空缓存
		fos.flush();
		// 关闭文件流
		fos.close();
		return "success";
	}

	/**
	 * 删除小窝信息###################################################################
	 * 
	 * @return
	 */
	public String deleteHouse() {
		house = houseService.findHouseById(houseId);
		houseService.deleteHouse(house);
		return "success";
	}

	/**
	 * 查找小窝信息到后台################################################################
	 * 
	 * @return
	 */
	public String findHouses() {
		houses = houseService.findHouses(pageSize, (pageNow - 1) * pageSize);
		long count = houseService.queryAllCount();
		pageAll = count % pageSize == 0 ? count / pageSize : count / pageSize
				+ 1;
		return "success";
	}

	/*********************************************** 以上是后台 **********************************************************************/

	/**
	 * 查找小窝信息到前台
	 * 
	 * @return
	 */
	public String findHousesToFront() {
		houses = houseService.findHouses();
		houseList = new ArrayList<House>();
		for (House house : houses) {
			// 如果相册状态为显示
			if (house.getHouseStatus() == 1) {
				houseList.add(house);
			}
		}
		return "success";
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

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

}
