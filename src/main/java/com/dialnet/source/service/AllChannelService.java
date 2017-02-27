package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.AllChannels;

public interface AllChannelService {

	public List<AllChannels> getListByLCO(String lco, Integer offset,Integer maxResults);
	public Long count(String user);
	public int add(AllChannels chn);
	public List<String> getAllName(String lco);
	public int delete(String channel_id);
	public int channelupdate(String channelid,String channelname,String msoprice,String lcoprice);
	
	public Long countFTA(String user);

}
