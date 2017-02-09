package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.AllCollections;

public interface AllCollectionService {

	public int saveDetail(AllCollections obj);

	public List<AllCollections> getAll(String user);

	public List<AllCollections> getByAnyOne(String user,String sdate, String edate, String VC_no, String mobile, String status,String agent,Integer offset, Integer maxResults);
	public Long countForSearch(String user,String sdate, String edate, String VC_no, String mobile, String status,String agent);

	public List<AllCollections> list(String user,Integer offset, Integer maxResults);

	public Long count(String user);
	
	public Object getBulkInfo(String invoice);
	
	public AllCollections getByInvoice(String invoice);
	
	public int updateCollection(String invoice,String rAmt,String lcoId,String RId,String status,String remark,String appDate );
}
