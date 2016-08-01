package com.cat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.House;
import com.cat.dao.HouseDao;
import com.cat.service.HouseService;

@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	private HouseDao houseDao;

	@Override
	public List<House> findHouses() {
		return houseDao.findHouses();
	}

	@Override
	public void addHouse(House house) {
		houseDao.addHouse(house);
	}

	@Override
	public House findHouseById(int houseId) {
		return houseDao.findHouseById(houseId);
	}

	@Override
	public void deleteHouse(House house) {
		houseDao.deleteHouse(house);
	}

	@Override
	public void updateHouse(House house) {
		houseDao.updateHouse(house);
	}

	@Override
	public List<House> findHouses(int pageSize, int pageNow) {
		return houseDao.findHouses(pageSize, pageNow);
	}

	@Override
	public Long queryAllCount() {
		return houseDao.queryAllCount();
	}

}
