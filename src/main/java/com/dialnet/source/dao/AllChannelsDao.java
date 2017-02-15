package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.AllChannels;

public interface AllChannelsDao {

	public List<AllChannels> getListByLCO(String lco, Integer offset,Integer maxResults);
	public Long count(String user);
	public int add(AllChannels chn);
	public int channelupdate(String channelid,String channelname,String msoprice,String lcoprice);
	public List<String> getAllName(String lco);
	public int delete(String channel_id);
}
