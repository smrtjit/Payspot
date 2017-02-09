package com.dialnet.source.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.CustSettingDao;
import com.dialnet.source.model.LCO_Setting;


@Service("lcosettingservice")
public class CustSettingServiceImpl implements CustSettingService {

	
	@Autowired
	CustSettingDao dao;
	@Override
	public LCO_Setting getByID(String id) {
		// TODO Auto-generated method stub
		return dao.getByID(id);
	}

}
