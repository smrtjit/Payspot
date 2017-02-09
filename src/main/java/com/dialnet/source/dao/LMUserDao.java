package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.LMUser;

public interface LMUserDao {

	public void add(LMUser username);
	public void edit(LMUser username);
	public void delete(String username);
	public LMUser get(String username);
	public List<LMUser> getAll();
	public List<LMUser> list(Integer offset, Integer maxResults);
	public Long count();
	public List userListForSearch(String empid, String username, String desig,String mobile,
			Integer offset, Integer maxResults);
	public Long countForSearch(String empid, String username, String desig,String mobile);
	
	public List<String> getAllAgentNames(String lco);
}
