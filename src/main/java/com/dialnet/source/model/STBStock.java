package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "STBOutDetail")
public class STBStock {

	@Id
	private long StbNo;

	private String RecievedOn;
	private String StbFrom;
	private String Brand;
	private String MSO;
	private String SubscriberId;
	private String IssuedDate;
	private String StbType;
	private String StbStatus;
	private String Warranty;
	private String LcoId;
	private String trndate;

	public STBStock() {
		super();
		// TODO Auto-generated constructor stub
	}

	public STBStock(long stbNo, String recievedOn, String stbFrom, String brand, String mSO, String subscriberId,
			String issuedDate, String stbType, String stbStatus, String warranty, String lcoId, String trndate) {
		super();
		StbNo = stbNo;
		RecievedOn = recievedOn;
		StbFrom = stbFrom;
		Brand = brand;
		MSO = mSO;
		SubscriberId = subscriberId;
		IssuedDate = issuedDate;
		StbType = stbType;
		StbStatus = stbStatus;
		Warranty = warranty;
		LcoId = lcoId;
		this.trndate = trndate;
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

	public long getStbNo() {
		return StbNo;
	}

	public void setStbNo(long stbNo) {
		StbNo = stbNo;
	}

	public String getRecievedOn() {
		return RecievedOn;
	}

	public void setRecievedOn(String recievedOn) {
		RecievedOn = recievedOn;
	}

	public String getStbFrom() {
		return StbFrom;
	}

	public void setStbFrom(String stbFrom) {
		StbFrom = stbFrom;
	}

	public String getSubscriberId() {
		return SubscriberId;
	}

	public void setSubscriberId(String subscriberId) {
		SubscriberId = subscriberId;
	}

	public String getIssuedDate() {
		return IssuedDate;
	}

	public void setIssuedDate(String issuedDate) {
		IssuedDate = issuedDate;
	}

	public String getStbType() {
		return StbType;
	}

	public void setStbType(String stbType) {
		StbType = stbType;
	}

	public String getStbStatus() {
		return StbStatus;
	}

	public void setStbStatus(String stbStatus) {
		StbStatus = stbStatus;
	}

	public String getWarranty() {
		return Warranty;
	}

	public void setWarranty(String warranty) {
		Warranty = warranty;
	}

	public String getLcoId() {
		return LcoId;
	}

	public void setLcoId(String lcoId) {
		LcoId = lcoId;
	}

	public String getTrndate() {
		return trndate;
	}

	public void setTrndate(String trndate) {
		this.trndate = trndate;
	}

}
