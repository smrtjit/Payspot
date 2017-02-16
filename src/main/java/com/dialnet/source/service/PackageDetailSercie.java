package com.dialnet.source.service;

import java.util.List;

import com.dialnet.source.model.PackageDetail;

public interface PackageDetailSercie {

	public int add(PackageDetail obj);
	public int delete(String id);
	
	public List<String> getChannelByPckg(String pckg);
}
