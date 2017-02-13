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

}
