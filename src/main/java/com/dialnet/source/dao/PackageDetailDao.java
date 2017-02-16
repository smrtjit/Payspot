package com.dialnet.source.dao;

import java.util.List;

import com.dialnet.source.model.PackageDetail;

public interface PackageDetailDao {
	
	public int add(PackageDetail obj);
	public int delete(String id);
	
	public List<String> getChannelByPckg(String pckg);
}
