package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.STBStockDao;
import com.dialnet.source.model.PackageInfo;
import com.dialnet.source.model.STBStock;

@Service
public class STBStockServiceImpl implements STBStockService {

	@Autowired
	STBStockDao dao;

	@Override
	public STBStock getBySTBNo(String stb) {
		return dao.getBySTBNo(stb);
	}

	@Override
	public List<STBStock> getByStatus(String user,String stutus) {
		return dao.getByStatus(user, stutus);
	}

	@Override
	public List<STBStock> list(String user, Integer offset, Integer maxResults) {
		return dao.list(user, offset, maxResults);
	}

	@Override
	public Long count(String user) {
		return dao.count(user);
	}

	@Override
	public List<String> getAllAvlSTB(String user) {
		
		return dao.getAllAvlSTB(user);
	}

	@Override
	public List<STBStock> getBySearch(String user, String id, String mso, String brand, String type, String status,
			Integer offset, Integer maxResults) {
		return dao.getBySearch(user, id, mso, brand, type, status, offset, maxResults);
	}

	@Override
	public long countSearch(String user, String id, String mso, String brand, String type, String status) {
		return dao.countSearch(user, id, mso, brand, type, status);
	}

	@Override
	public int add(STBStock pckg) {
		return dao.add(pckg);
	}

	@Override
	public int delete(String id) {
		
		return dao.delete(id);
	}

	@Override
	public int update(String stbno, String warranty) {
		// TODO Auto-generated method stub
		return dao.update(stbno, warranty);
	}

		
	
}
