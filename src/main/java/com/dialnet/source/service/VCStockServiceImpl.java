package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.VCStockDao;
import com.dialnet.source.model.LCOUser;
import com.dialnet.source.model.VCStock;

@Service
public class VCStockServiceImpl implements VCStockService {

	
	@Autowired
	VCStockDao dao;
	
	@Override
	public void add(VCStock stock) {
		dao.add(stock);;
		
	}
	
	@Override
	public List<VCStock> getAllVCStock() {
		return dao.getAllVCStock();
	}

	@Override
	public VCStock getByVCNo(String stb) {
		return dao.getByVCNo(stb);
	}

	@Override
	public List<VCStock> getByStatus(String stutus) {
		return dao.getByStatus(stutus);
	}

	@Override
	public int upStatus(String vcn, String status) {
		return dao.upStatus(vcn, status);
	}

	@Override
	public List<VCStock> list(Integer offset, Integer maxResults) {
		return dao.list(offset, maxResults);
	}

	@Override
	public Long count() {
		return dao.count();
	}

	
}
