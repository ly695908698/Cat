package com.cat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.bean.Album;
import com.cat.bean.Works;
import com.cat.dao.AlbumDao;
import com.cat.service.AlbumService;

@Service
public class AlbumServiceImpl implements AlbumService {
	@Autowired
	private AlbumDao albumDao;

	@Override
	public List<Album> findAlbums() {
		return albumDao.findAlbums();
	}

	@Override
	public void addAlbum(Album album) {
		albumDao.addAlbum(album);
	}

	@Override
	public Album findAlbumById(int albumId) {
		return albumDao.findAlbumById(albumId);
	}

	@Override
	public void deleteAlbum(Album album) {
		albumDao.deleteAlbum(album);
	}

	@Override
	public void updateAlbum(Album album) {
		albumDao.updateAlbum(album);
	}

	@Override
	public List<Works> findWorksByAlbumId(int albumId, int pageSize, int pageNow) {
		return albumDao.findWorksByAlbumId(albumId, pageSize, pageNow);
	}

	@Override
	public List<Works> findWorksByAlbumId(int albumId) {
		return albumDao.findWorksByAlbumId(albumId);
	}

	@Override
	public List<Album> findAlbumsForUpload() {
		return albumDao.findAlbumsForUpload();
	}

	@Override
	public List<Album> findAlbums(int pageSize, int pageNow) {
		return albumDao.findAlbums(pageSize, pageNow);
	}

	@Override
	public Long queryAllCount() {
		return albumDao.queryAllCount();
	}
}
