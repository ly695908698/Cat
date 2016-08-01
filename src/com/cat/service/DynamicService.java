package com.cat.service;

import java.util.List;

import com.cat.bean.Dynamic;

public interface DynamicService {
	/**
	 * 1.查找所有的动态信息
	 * 
	 */
	public List<Dynamic> findDynamics();

	/**
	 * 分页查询动态信息
	 * 
	 * @param pageSize
	 * @param pageNow
	 * @return
	 */
	public List<Dynamic> findDynamics(int pageSize, int pageNow);

	/**
	 * 查询所有的动态个数
	 * 
	 * @return
	 */
	public Long queryAllCount();

	/**
	 * 2.添加动态
	 * 
	 */
	public void addDynamic(Dynamic dynamic);

	/**
	 * 3.通过id查找动态信息
	 */
	public Dynamic findDynamicById(int dynamicId);

	/**
	 * 4.删除动态信息
	 * 
	 * @param album
	 */
	public void deleteDynamic(Dynamic dynamic);

	/**
	 * 5.修改动态
	 * 
	 * @param album
	 */
	public void updateDynamic(Dynamic dynamic);

}
