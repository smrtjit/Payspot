package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dialnet.source.dao.AllCollectionDao;
import com.dialnet.source.model.AllCollections;


@Service
@Transactional
public class AllCollectionServiceImpl implements AllCollectionService {

	@Autowired
	AllCollectionDao dao;

	@Override
	public int saveDetail(AllCollections obj) {
		// TODO Auto-generated method stub
		return dao.saveDetail(obj);
	}

	@Override
	public List<AllCollections> getAll(String user) {
		// TODO Auto-generated method stub
		return dao.getAll(user);
	}

	@Override
	public List<AllCollections> getByAnyOne(String user, String sdate, String edate, String VC_no, String mobile,
			String status, String agent, Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return dao.getByAnyOne(user, sdate, edate, VC_no, mobile, status, agent, offset, maxResults);
	}

	@Override
	public Long countForSearch(String user, String sdate, String edate, String VC_no, String mobile, String status,
			String agent) {
		// TODO Auto-generated method stub
		return dao.countForSearch(user, sdate, edate, VC_no, mobile, status, agent);
	}

	@Override
	public List<AllCollections> list(String user, Integer offset, Integer maxResults) {
		// TODO Auto-generated method stub
		return dao.list(user, offset, maxResults);
	}

	@Override
	public Long count(String user) {
		// TODO Auto-generated method stub
		return dao.count(user);
	}

	@Override
	public Object getBulkInfo(String invoice) {
		// TODO Auto-generated method stub
		return dao.getBulkInfo(invoice);
	}

	@Override
	public AllCollections getByInvoice(String invoice) {
		// TODO Auto-generated method stub
		return dao.getByInvoice(invoice);
	}

	@Override
	public int updateCollection(String invoice, String rAmt, String lcoId, String RId, String status, String remark,
			String appDate) {
		// TODO Auto-generated method stub
		return dao.updateCollection(invoice, rAmt, lcoId, RId, status, remark, appDate);
	}

	

}
