package com.dialnet.source.model;

import java.util.List;

public class BulkRechargeAmountList {

	private List<BulkRechargeAmount> bulkInfo;
	
	private List<BulkStock> bulkstock;
	

	public List<STBStock> getStbstock() {
		return stbstock;
	}

	public void setStbstock(List<STBStock> stbstock) {
		this.stbstock = stbstock;
	}




	public BulkRechargeAmountList(List<BulkRechargeAmount> bulkInfo, List<BulkStock> bulkstock, List<STBStock> stbstock,
			List<AllChannels> channel) {
		super();
		this.bulkInfo = bulkInfo;
		this.bulkstock = bulkstock;
		this.stbstock = stbstock;
		this.channel = channel;
	}

	public List<BulkStock> getBulkstock() {
		return bulkstock;
	}

	public void setBulkstock(List<BulkStock> bulkstock) {
		this.bulkstock = bulkstock;
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
