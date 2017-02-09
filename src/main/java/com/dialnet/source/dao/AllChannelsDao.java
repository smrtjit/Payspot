package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.AllChannels;

public interface AllChannelsDao {

	public List<AllChannels> getListByLCO(String lco, Integer offset,Integer maxResults);
	public Long count(String user);
	
}
