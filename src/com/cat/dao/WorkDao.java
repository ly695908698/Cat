package com.cat.dao;

import java.util.List;

import com.cat.bean.Works;

public interface WorkDao {

	/**
	 * 1.查找所有的作品
	 * 
	 */
	public List<Works> findWorks();

	/**
	 * 分页查询所有的作品信息
	 * 
	 * @return
	 */
	public List<Works> findWorks(int pageSize, int pageNow);

	/**
	 * 查询作品信息的个数
	 * 
	 * @return
	 */
	public Long queryAllCount();

	/**
	 * 2.添加作品
	 * 
	 */
	public void addWork(Works work);

	/**
	 * 3.通过id查找作品信息
	 */
	public Works findWorksById(int workId);

	/**
	 * 4.删除作品
	 * 
	 * @param works
	 */
	public void deleteWorks(Works works);

	/**
	 * 5.更新作品
	 * 
	 * @param works
	 */
	public void updateWorks(Works works);
}
