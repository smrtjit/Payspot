package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.PackageInfo;

public interface PackageInfoService {


	public PackageInfo getByID(String code);
	public List<PackageInfo> getAll();
	public List<String> getAllPckgNames();
	public PackageInfo getByName(String name);
}
