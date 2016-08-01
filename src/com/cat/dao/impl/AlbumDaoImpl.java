package com.cat.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.bean.Album;
import com.cat.bean.Works;
import com.cat.dao.AlbumDao;

@Repository
public class AlbumDaoImpl implements AlbumDao {
	// 注入sessionFactory
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Album> findAlbums() {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Album");
		return query.list();
	}

	@Override
	public void addAlbum(Album album) {
		sessionFactory.getCurrentSession().save(album);
	}

	@Override
	public Album findAlbumById(int albumId) {
		String hql = "from Album where albumId=:albumId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("albumId", albumId);
		return (Album) query.uniqueResult();
	}

	@Override
	public void deleteAlbum(Album album) {
		sessionFactory.getCurrentSession().delete(album);
	}

	@Override
	public void updateAlbum(Album album) {
		sessionFactory.getCurrentSession().update(album);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Works> findWorksByAlbumId(int albumId,int pageSize, int pageNow) {
		String hql = "from  Works works where works.album.albumId=" + albumId;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(pageNow);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Works> findWorksByAlbumId(int albumId) {
		String hql = "from  Works works where works.album.albumId=" + albumId;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Album> findAlbumsForUpload() {
		String hql = "from Album";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Album> findAlbums(int pageSize, int pageNow) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Album order by albumCreateTime desc");
		query.setFirstResult(pageNow);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public Long queryAllCount() {
		String hql = "select count(*) from Album";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return (Long) query.uniqueResult();
	}
}
