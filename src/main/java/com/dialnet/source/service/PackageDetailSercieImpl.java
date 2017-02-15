package com.dialnet.source.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.PackageDetailDao;
import com.dialnet.source.model.PackageDetail;

@Service
public class PackageDetailSercieImpl implements PackageDetailSercie {

	@Autowired
	PackageDetailDao dao;
	
	@Override
	public int add(PackageDetail obj) {
		return dao.add(obj);
	}

}
