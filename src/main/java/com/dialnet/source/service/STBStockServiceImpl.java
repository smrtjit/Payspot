package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.STBStockDao;
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
	
	
}
