package com.dialnet.source.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "PackageInfo")
public class PackageInfo {

	@Id
	private String  PckgID;
	
	
	private String  PckgName;
	private String  PckgType;
	private long  Price;
	private String  NoOfChannels;
	private String  NoOfUser;
	private String  LcoID;
	private String  trnadte;
	
	public PackageInfo(String pckgID, String pckgName, String pckgType, long price, String noOfChannels,
			String noOfUser, String lcoID, String trnadte) {
		super();
		PckgID = pckgID;
		PckgName = pckgName;
		PckgType = pckgType;
		Price = price;
		NoOfChannels = noOfChannels;
		NoOfUser = noOfUser;
		LcoID = lcoID;
		this.trnadte = trnadte;
	}
	public PackageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPckgID() {
		return PckgID;
	}
	public void setPckgID(String pckgID) {
		PckgID = pckgID;
	}
	public String getPckgName() {
		return PckgName;
	}
	public void setPckgName(String pckgName) {
		PckgName = pckgName;
	}
	public String getPckgType() {
		return PckgType;
	}
	public void setPckgType(String pckgType) {
		PckgType = pckgType;
	}
	
	public long getPrice() {
		return Price;
	}
	public void setPrice(long price) {
		Price = price;
	}
	public String getNoOfChannels() {
		return NoOfChannels;
	}
	public void setNoOfChannels(String noOfChannels) {
		NoOfChannels = noOfChannels;
	}
	public String getNoOfUser() {
		return NoOfUser;
	}
	public void setNoOfUser(String noOfUser) {
		NoOfUser = noOfUser;
	}
	public String getLcoID() {
		return LcoID;
	}
	public void setLcoID(String lcoID) {
		LcoID = lcoID;
	}
	public String getTrnadte() {
		return trnadte;
	}
	public void setTrnadte(String trnadte) {
		this.trnadte = trnadte;
	}
	
}
