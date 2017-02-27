package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "STB_Stock")
public class STBStock {

	@Id
	private long Stb_Id;
	private String Brand;
	private String MSO;
	private String trndate_Of_MSO;
	private String STB_Type;
	private String Warranty;
	private String SubscriberId;
	private String trndate_Of_Subs;
	private String STB_Status;
	private String STB_Returned_trndate_Sub;
	private String LCO_Id;
	public STBStock() {
		super();
		// TODO Auto-generated constructor stub
	}
	public STBStock(long stb_Id, String brand, String mSO, String trndate_Of_MSO, String sTB_Type, String warranty,
			String subscriberId, String trndate_Of_Subs, String sTB_Status, String sTB_Returned_trndate_Sub,
			String lCO_Id) {
		super();
		Stb_Id = stb_Id;
		Brand = brand;
		MSO = mSO;
		this.trndate_Of_MSO = trndate_Of_MSO;
		STB_Type = sTB_Type;
		Warranty = warranty;
		SubscriberId = subscriberId;
		this.trndate_Of_Subs = trndate_Of_Subs;
		STB_Status = sTB_Status;
		STB_Returned_trndate_Sub = sTB_Returned_trndate_Sub;
		LCO_Id = lCO_Id;
	}
	public long getStb_Id() {
		return Stb_Id;
	}
	public void setStb_Id(long stb_Id) {
		Stb_Id = stb_Id;
	}
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public String getMSO() {
		return MSO;
	}
	public void setMSO(String mSO) {
		MSO = mSO;
	}
	public String getTrndate_Of_MSO() {
		return trndate_Of_MSO;
	}
	public void setTrndate_Of_MSO(String trndate_Of_MSO) {
		this.trndate_Of_MSO = trndate_Of_MSO;
	}
	public String getSTB_Type() {
		return STB_Type;
	}
	public void setSTB_Type(String sTB_Type) {
		STB_Type = sTB_Type;
	}
	public String getWarranty() {
		return Warranty;
	}
	public void setWarranty(String warranty) {
		Warranty = warranty;
	}
	public String getSubscriberId() {
		return SubscriberId;
	}
	public void setSubscriberId(String subscriberId) {
		SubscriberId = subscriberId;
	}
	public String getTrndate_Of_Subs() {
		return trndate_Of_Subs;
	}
	public void setTrndate_Of_Subs(String trndate_Of_Subs) {
		this.trndate_Of_Subs = trndate_Of_Subs;
	}
	public String getSTB_Status() {
		return STB_Status;
	}
	public void setSTB_Status(String sTB_Status) {
		STB_Status = sTB_Status;
	}
	public String getSTB_Returned_trndate_Sub() {
		return STB_Returned_trndate_Sub;
	}
	public void setSTB_Returned_trndate_Sub(String sTB_Returned_trndate_Sub) {
		STB_Returned_trndate_Sub = sTB_Returned_trndate_Sub;
	}
	public String getLCO_Id() {
		return LCO_Id;
	}
	public void setLCO_Id(String lCO_Id) {
		LCO_Id = lCO_Id;
	}
	

}
