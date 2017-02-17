package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.STBStock;

public interface STBStockDao {

	public STBStock getBySTBNo(String stb);
	public List<STBStock> getByStatus(String user,String stutus);
	public List<STBStock> list(String user,Integer offset, Integer maxResults);
	public Long count(String user);
	public List<String> getAllAvlSTB(String user);
}
