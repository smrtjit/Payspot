package com.dialnet.source.service;

import com.dialnet.source.model.AgentBillDetails;

public interface AgentBillDetailsService {

	public int saveDetail(AgentBillDetails obj);
	
	public int updateAgentBill(String id,String RAmt,String RId,String remark,String status,String ApprovedBy,String ApprovedDate);
}
