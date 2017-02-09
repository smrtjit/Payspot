package com.dialnet.source.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.AgentBillDetailsDao;
import com.dialnet.source.model.AgentBillDetails;

@Service
public class AgentBillDetailsServiceImpl implements AgentBillDetailsService {

	@Autowired
	AgentBillDetailsDao dao;
	
	@Override
	public int saveDetail(AgentBillDetails obj) {
		// TODO Auto-generated method stub
		return dao.saveDetail(obj);
	}

	@Override
	public int updateAgentBill(String id, String RAmt, String RId, String remark, String status, String ApprovedBy,
			String ApprovedDate) {
		// TODO Auto-generated method stub
		return dao.updateAgentBill(id, RAmt, RId, remark, status, ApprovedBy, ApprovedDate);
	}

}
