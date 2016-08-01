package com.cat.dao;

import java.util.List;

import com.cat.bean.House;

public interface HouseDao {

	/**
	 * 1.查找所有的小窝信息
	 * 
	 */
	public List<House> findHouses();

	/**
	 * 分页查询多有的小窝信息
	 * 
	 * @param pageSize
	 * @param pageNow
	 * @return
	 */
	public List<House> findHouses(int pageSize, int pageNow);

	/**
	 * 查询所有的小窝信息的个数
	 * 
	 * @return
	 */
	public Long queryAllCount();

	/**
	 * 2.添加小窝
	 * 
	 */
	public void addHouse(House house);

	/**
	 * 3.通过id查找小窝信息
	 */
	public House findHouseById(int houseId);

	/**
	 * 4.删除小窝信息
	 * 
	 * @param album
	 */
	public void deleteHouse(House house);

	/**
	 * 5.修改小窝
	 * 
	 * @param album
	 */
	public void updateHouse(House house);
}
