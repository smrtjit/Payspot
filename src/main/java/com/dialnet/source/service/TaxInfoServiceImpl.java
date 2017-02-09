package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.TaxInfoDao;
import com.dialnet.source.model.TaxInformation;


@Service
public class TaxInfoServiceImpl implements TaxInfoService {

	
	@Autowired
	TaxInfoDao dao;
	@Override
	public TaxInformation getInfo(String id) {
		// TODO Auto-generated method stub
		return dao.getInfo(id);
	}

}
