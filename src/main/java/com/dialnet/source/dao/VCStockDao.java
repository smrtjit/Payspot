package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.VCStock;

public interface VCStockDao {

	public void add(VCStock stock);
	
	public List<VCStock> getAllVCStock();
	
	
	public VCStock getByVCNo(String stb);
	
	public List<VCStock> getByStatus(String stutus);
	
	public int upStatus(String vcn,String status);
	
	public List<VCStock> list(Integer offset, Integer maxResults);

	public Long count();
}
