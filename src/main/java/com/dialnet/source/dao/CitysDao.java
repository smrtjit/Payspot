package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.Citys;

public interface CitysDao {
	
	public List<String> getBycity_state(String city_state);

}
