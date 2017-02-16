package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.AllChannelsDao;
import com.dialnet.source.model.AllChannels;


@Service
public class AllChannelServiceImpl implements AllChannelService {

	@Autowired
	AllChannelsDao dao;
	
	@Override
	public List<AllChannels> getListByLCO(String lco, Integer offset,Integer maxResults) {
		// TODO Auto-generated method stub
		return dao.getListByLCO(lco, offset, maxResults);
	}

	@Override
	public Long count(String user) {
		// TODO Auto-generated method stub
		return dao.count(user);
	}

	@Override
	public int add(AllChannels chn) {
		// TODO Auto-generated method stub
		return dao.add(chn);
	}

	@Override
	public List<String> getAllName(String lco) {
		// TODO Auto-generated method stub
		return dao.getAllName(lco);
	}
	public int delete(String channel_id){
		return dao.delete(channel_id);
	}

	@Override
	public int channelupdate(String channelid, String channelname, String msoprice, String lcoprice) {
		// TODO Auto-generated method stub
		return dao.channelupdate(channelid, channelname, msoprice, lcoprice);
	}

}
