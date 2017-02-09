package com.dialnet.source.dao;

import com.dialnet.source.model.AgentBillDetails;

public interface AgentBillDetailsDao {

	public int saveDetail(AgentBillDetails obj);
	
	public int updateAgentBill(String id,String RAmt,String RId,String remark,String status,String ApprovedBy,String ApprovedDate);
	
}
