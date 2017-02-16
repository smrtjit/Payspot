package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.CitysDao;
import com.dialnet.source.model.Citys;

@Service
public class CityServiceImpl implements CityService {
	
	@Autowired
	 CitysDao citydao;

	@Override
	public List<String> getBycity_state(String city_state) {
		// TODO Auto-generated method stub
		return citydao.getBycity_state(city_state);
	}
	 
	
}
