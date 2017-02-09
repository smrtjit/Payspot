package com.dialnet.source.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dialnet.source.dao.PackageInfoDao;
import com.dialnet.source.model.PackageInfo;


@Service
public class PackageInfoServiceImpl implements PackageInfoService {

	@Autowired
	PackageInfoDao packageinfodao;
	public PackageInfo getByID(String code) {
		
		return packageinfodao.getByID(code);
	}

	public List<PackageInfo> getAll() {
		return packageinfodao.getAll();
	}

	@Override
	public List<String> getAllPckgNames() {
		
		return packageinfodao.getAllPckgNames();
	}

	@Override
	public PackageInfo getByName(String name) {
		// TODO Auto-generated method stub
		return packageinfodao.getByName(name);
	}


}
