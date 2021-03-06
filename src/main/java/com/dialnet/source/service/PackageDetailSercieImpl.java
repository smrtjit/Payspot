package com.dialnet.source.service;

import java.util.List;

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

	@Override
	public int delete(String id) {
		return dao.delete(id);
	}

	@Override
	public List<String> getChannelByPckg(String pckg) {
		return dao.getChannelByPckg(pckg);
	}

}
