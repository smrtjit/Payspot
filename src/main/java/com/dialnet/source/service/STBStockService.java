package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.PackageInfo;
import com.dialnet.source.model.STBStock;

public interface STBStockService {

	public STBStock getBySTBNo(String stb);
	public List<STBStock> getByStatus(String user,String stutus);
	public List<STBStock> list(String user,Integer offset, Integer maxResults);
	public Long count(String user);
	public List<String> getAllAvlSTB(String user);
	public List<STBStock> getBySearch(String user,String id,String mso,String brand,
			String type,String status,Integer offset, Integer maxResults);
	public int delete(String id);
	public long countSearch(String user,String id,String mso,String brand,
			String type,String status);
	public int add(STBStock pckg); 
	public int updatesubscriber(String stbno,String sub_id,String trn_date,String status);

	public int update(String stbno,String warranty); 
}
