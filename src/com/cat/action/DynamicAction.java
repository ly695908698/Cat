package com.cat.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cat.bean.Dynamic;
import com.cat.service.DynamicService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class DynamicAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3190817860600835920L;

	@Autowired
	private DynamicService dynamicService;
	private List<Dynamic> dynamics;

	private Dynamic dynamic;
	private int dynamicId;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	
	
	private int pageNow = 1;
	private int pageSize = 12;
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

	public List<Dynamic> getDynamics() {
		return dynamics;
	}

	public void setDynamics(List<Dynamic> dynamics) {
		this.dynamics = dynamics;
	}

	public Dynamic getDynamic() {
		return dynamic;
	}

	public void setDynamic(Dynamic dynamic) {
		this.dynamic = dynamic;
	}

	public int getDynamicId() {
		return dynamicId;
	}

	public void setDynamicId(int dynamicId) {
		this.dynamicId = dynamicId;
	}

	/**
	 * 添加动态
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addDynamic() throws IOException {

		// 定义一个文件的保存的路径
		String savePath = ServletActionContext.getServletContext().getRealPath(
				"back/dynamicimg/" + this.uploadFileName);
		// 保存文件
		// 创建文件的读取上传的文件
		FileInputStream fis = new FileInputStream(upload);
		FileOutputStream fos = new FileOutputStream(savePath);
		// 复制文件
		IOUtils.copy(fis, fos);

		dynamic.setDynamicImg(uploadFileName);
		dynamic.setDynamicDate(new Date());
		dynamicService.addDynamic(dynamic);
		// 清空缓存
		fos.flush();
		// 关闭文件流
		fos.close();
		return "success";
	}

	/**
	 * 删除动态
	 * 
	 * @return
	 */
	public String deleteDynamic() {
		dynamic = dynamicService.findDynamicById(dynamicId);
		dynamicService.deleteDynamic(dynamic);
		return "success";
	}

	/**
	 * 根据编号查找
	 * 
	 * @return
	 */
	public String findDynamicById() {
		dynamic = dynamicService.findDynamicById(dynamicId);
		return "success";
	}

	/**
	 * 查找所有
	 * 
	 * @return
	 */
	public String findDynamics() {
		dynamics = dynamicService.findDynamics(pageSize,
				(pageNow - 1) * pageSize);
		long count = dynamicService.queryAllCount();
		pageAll = count % pageSize == 0 ? count / pageSize : count / pageSize
				+ 1;
		return "success";
	}

	/*********************************************** 以上是后台 **********************************************************************/
	/**
	 * 查找所有
	 * 
	 * @return
	 */
	public String findDynamicsToFront() {
		dynamics = dynamicService.findDynamics(pageSize, (pageNow - 1)* pageSize);
		long count = dynamicService.queryAllCount();
		pageAll = count % pageSize == 0 ? count / pageSize : count / pageSize
				+ 1;
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
