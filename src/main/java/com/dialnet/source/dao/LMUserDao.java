package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.LMUser;

public interface LMUserDao {

	public void add(LMUser obj);
	public int edit(LMUser obj);
	public void delete(String obj);
	public LMUser get(String username);
	public List<LMUser> getAll();
	public List<LMUser> list(String user,Integer offset, Integer maxResults);
	public Long count(String user);
	public List userListForSearch(String user,String empid, String desig,String mobile,
			Integer offset, Integer maxResults);
	public Long countForSearch(String user,String empid, String desig,String mobile);
	
	public List<String> getAllAgentNames(String lco);
	public String getLCOID(String username);
}
