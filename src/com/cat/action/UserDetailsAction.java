package com.cat.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cat.bean.User;
import com.cat.bean.UserDetails;
import com.cat.service.UserDetailsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class UserDetailsAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3190817860600835920L;

	// 注入userDetailsService
	@Autowired
	private UserDetailsService userDetailsService;
	private UserDetails userDetails;
	private User user;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	// /////////////////////////////////////////get/set/////////////////////////////////////////

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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	// ///////////////////////////////////////Action//////////////////////////////////////////////

	/**
	 * 1.保存用户详细信息
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String saveUserDetails() throws IOException {
		// 定义一个文件的保存的路径
		String savePath = ServletActionContext.getServletContext().getRealPath(
				"back/aboutuserimage/" + this.uploadFileName);
		// 保存文件
		// 创建文件的读取上传的文件
		FileInputStream fis = new FileInputStream(upload);
		FileOutputStream fos = new FileOutputStream(savePath);
		// 复制文件
		IOUtils.copy(fis, fos);
		// 保存图片信息
		userDetails.setHeadPhoto(uploadFileName);
		// 插入
		userDetailsService.saveUserDetails(userDetails);
		// 清空缓存
		fos.flush();
		// 关闭文件流
		fos.close();
		return "success";
	}

	/**
	 * 2.根据用户的编号查找用户的详细信息
	 * 
	 * @return
	 */
	public String findUserDetailsByUserId() {
		// 从session中获取已经登录的用户
		Map<String, Object> map = ActionContext.getContext().getSession();
		// 判断session中是否有值
		if (!map.isEmpty()) {
			// 获取用户
			user = (User) map.get("user");
			// 通过findUserDetailsByUserId查找用户的详细信息
			userDetails = userDetailsService.findUserDetailsByUserId(user
					.getUserId());
		}
		return "success";
	}
}
