package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.STBStock;
import com.dialnet.source.model.VCStock;

public interface STBStockDao {

	public void add(STBStock stock);

	
public List<STBStock> getAllVCStock();
	
	public STBStock getBySTBNo(String stb);
	
	public List<STBStock> getByStatus(String stutus);
	
	public int upSTB(String stb,String status);
	
	public List<STBStock> list(Integer offset, Integer maxResults);
	
	public Long count();
}
