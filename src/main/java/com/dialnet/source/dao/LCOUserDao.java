package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.LCOUser;;

public interface LCOUserDao {

	
	public void add(LCOUser complaints);
	public void edit(LCOUser complaints);
	public void delete(int complaints_No);
	public LCOUser get(String username);
	public List<LCOUser> getAll();
	
}
