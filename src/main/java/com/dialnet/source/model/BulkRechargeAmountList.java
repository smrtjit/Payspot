package com.dialnet.source.model;

import java.util.List;

public class BulkRechargeAmountList {

	private List<BulkRechargeAmount> bulkInfo;
	
	public List<VCStock> getVcstock() {
		return vcstock;
	}

	public void setVcstock(List<VCStock> vcstock) {
		this.vcstock = vcstock;
	}

	public List<STBStock> getStbstock() {
		return stbstock;
	}

	public void setStbstock(List<STBStock> stbstock) {
		this.stbstock = stbstock;
	}

	private List<VCStock> vcstock;

	
	

	public BulkRechargeAmountList(List<BulkRechargeAmount> bulkInfo, List<VCStock> vcstock, List<STBStock> stbstock,
			List<AllChannels> channel) {
		super();
		this.bulkInfo = bulkInfo;
		this.vcstock = vcstock;
		this.stbstock = stbstock;
		this.channel = channel;
	}

	private List<STBStock> stbstock;


	public BulkRechargeAmountList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<BulkRechargeAmount> getBulkInfo() {
		return bulkInfo;
	}

	public void setBulkInfo(List<BulkRechargeAmount> bulkInfo) {
		this.bulkInfo = bulkInfo;
	}

	private List<AllChannels> channel;

	public List<AllChannels> getChannel() {
		return channel;
	}

	public void setChannel(List<AllChannels> channel) {
		this.channel = channel;
	}
	
	
}
