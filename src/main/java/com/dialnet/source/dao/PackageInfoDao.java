package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.PackageInfo;

public interface PackageInfoDao {

	
	public PackageInfo getByID(String code);
	public List<PackageInfo> getAll(String user,Integer offset,Integer maxResults);
	public Long count(String user);
	public List<String> getAllPckgNames();
	public PackageInfo getByName(String name);
	public int add(PackageInfo pckg); 
	public int delete(String id);
	
	public int editPckg(PackageInfo pckg);
	
	public List<String> getPckgByType(String user,String type);
	public long getCostByName(String name);
}
