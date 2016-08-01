package com.cat.dao;

import java.util.List;

import com.cat.bean.Album;
import com.cat.bean.Works;

public interface AlbumDao {

	/**
	 * 1.查找所有的相册
	 * 
	 */
	public List<Album> findAlbums();

	/**
	 * 分页查询所有的相册信息
	 * 
	 * @param pageSize
	 * @param pageNow
	 * @return
	 */
	public List<Album> findAlbums(int pageSize, int pageNow);

	/**
	 * 查询所有的相册信息的个数
	 * 
	 * @return
	 */
	public Long queryAllCount();

	/**
	 * 2.查找所有的相册名称
	 * 
	 */
	public List<Album> findAlbumsForUpload();

	/**
	 * 2.添加相册
	 * 
	 */
	public void addAlbum(Album album);

	/**
	 * 3.通过id查找相册信息
	 */
	public Album findAlbumById(int albumId);

	/**
	 * 4.删除相册
	 * 
	 * @param album
	 */
	public void deleteAlbum(Album album);

	/**
	 * 5.修改相册
	 * 
	 * @param album
	 */
	public void updateAlbum(Album album);

	/**
	 * 6.通过albumId查找作品
	 * 
	 * @param albumId
	 * @return
	 */
	public List<Works> findWorksByAlbumId(int albumId, int pageSize, int pageNow);

	/**
	 * 通过相册的编号查找作品信息
	 * 
	 * @param albumId
	 * @return
	 */
	public List<Works> findWorksByAlbumId(int albumId);
}
