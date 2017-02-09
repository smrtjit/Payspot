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
	public List<STBStock> getAllVCStock() {
		return dao.getAllVCStock();
	}

	@Override
	public STBStock getBySTBNo(String stb) {
		return dao.getBySTBNo(stb);
	}

	@Override
	public List<STBStock> getByStatus(String stutus) {
		return dao.getByStatus(stutus);
	}

	@Override
	public int upSTB(String stb, String status) {
		return dao.upSTB(stb, status);
	}

	@Override
	public List<STBStock> list(Integer offset, Integer maxResults) {
		return dao.list(offset, maxResults);
	}

	@Override
	public Long count() {
		return dao.count();
	}

	@Override
	public void add(STBStock stock) {
		dao.add(stock);
		
	}

}
