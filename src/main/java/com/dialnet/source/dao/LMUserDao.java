package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.LMUser;

public interface LMUserDao {

	public void add(LMUser obj);
	public int edit(LMUser obj);
	public void delete(String obj);
	public LMUser get(String username);
	public List<LMUser> getAll();
	public List<LMUser> list(Integer offset, Integer maxResults);
	public Long count();
	public List userListForSearch(String empid, String username, String desig,String mobile,
			Integer offset, Integer maxResults);
	public Long countForSearch(String empid, String username, String desig,String mobile);
	
	public List<String> getAllAgentNames(String lco);
	public String getLCOID(String username);
}
