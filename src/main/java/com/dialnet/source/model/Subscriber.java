package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Subscriber")
public class Subscriber {
	
	@Id
	private long UserName;
	
	private String Password;
	private String FirstName;
	private String MiddleName;
	private String LastName;
	private String Address;
	private String LandMark;
	private String City;
	private String Pincode;
	private String State;
	private String Mobile;
	private String EmailId;
	
	private String PhotoIDType;
	private String PhotoID;
	private String PhotoIDURL;
	
	private String GSTNo;
	private String STBNo;
	private String CRFNo;
	private String BasePCKG;
	private String AddOnPCKG;
	private String A_La_Carte;
	private String PCKGPrice;
	private String AccountBalance;
	private String SubStatus;
	private String trndate;
	private String STB_IssuedOn;
	private String StandBySTBIssued;
	private String ReturnSTB;
	private String CAF_Url;
	
	private String ActivationCharge;
	private String STB_Rental_Type;
	private String STB_Full_Rental;
	private String STB_Monthly_Rental;
	private String LcoId;
	public Subscriber() {
		super();
		// TODO Auto-generated constructor stub
	}
	
		public Subscriber(long userName, String password, String firstName, String middleName, String lastName,
			String address, String landMark, String city, String pincode, String state, String mobile, String emailId,
			String photoIDType, String photoID, String photoIDURL, String gSTNo, String sTBNo, String cRFNo,
			String basePCKG, String addOnPCKG, String a_La_Carte, String pCKGPrice, String accountBalance,
			String subStatus, String trndate, String sTB_IssuedOn, String standBySTBIssued, String returnSTB,
			String cAF_Url, String activationCharge, String sTB_Rental_Type, String sTB_Full_Rental,
			String sTB_Monthly_Rental, String lcoId) {
		super();
		UserName = userName;
		Password = password;
		FirstName = firstName;
		MiddleName = middleName;
		LastName = lastName;
		Address = address;
		LandMark = landMark;
		City = city;
		Pincode = pincode;
		State = state;
		Mobile = mobile;
		EmailId = emailId;
		PhotoIDType = photoIDType;
		PhotoID = photoID;
		PhotoIDURL = photoIDURL;
		GSTNo = gSTNo;
		STBNo = sTBNo;
		CRFNo = cRFNo;
		BasePCKG = basePCKG;
		AddOnPCKG = addOnPCKG;
		A_La_Carte = a_La_Carte;
		PCKGPrice = pCKGPrice;
		AccountBalance = accountBalance;
		SubStatus = subStatus;
		this.trndate = trndate;
		STB_IssuedOn = sTB_IssuedOn;
		StandBySTBIssued = standBySTBIssued;
		ReturnSTB = returnSTB;
		CAF_Url = cAF_Url;
		ActivationCharge = activationCharge;
		STB_Rental_Type = sTB_Rental_Type;
		STB_Full_Rental = sTB_Full_Rental;
		STB_Monthly_Rental = sTB_Monthly_Rental;
		LcoId = lcoId;
	}

		public String getPhotoIDType() {
			return PhotoIDType;
		}

		public void setPhotoIDType(String photoIDType) {
			PhotoIDType = photoIDType;
		}

		public String getPhotoID() {
			return PhotoID;
		}

		public void setPhotoID(String photoID) {
			PhotoID = photoID;
		}

		public String getPhotoIDURL() {
			return PhotoIDURL;
		}

		public void setPhotoIDURL(String photoIDURL) {
			PhotoIDURL = photoIDURL;
		}

	public String getActivationCharge() {
		return ActivationCharge;
	}



	public void setActivationCharge(String activationCharge) {
		ActivationCharge = activationCharge;
	}



	public String getSTB_Rental_Type() {
		return STB_Rental_Type;
	}



	public void setSTB_Rental_Type(String sTB_Rental_Type) {
		STB_Rental_Type = sTB_Rental_Type;
	}



	public String getSTB_Full_Rental() {
		return STB_Full_Rental;
	}



	public void setSTB_Full_Rental(String sTB_Full_Rental) {
		STB_Full_Rental = sTB_Full_Rental;
	}



	public String getSTB_Monthly_Rental() {
		return STB_Monthly_Rental;
	}



	public void setSTB_Monthly_Rental(String sTB_Monthly_Rental) {
		STB_Monthly_Rental = sTB_Monthly_Rental;
	}



	public String getSubStatus() {
		return SubStatus;
	}

	public void setSubStatus(String subStatus) {
		SubStatus = subStatus;
	}

	public long getUserName() {
		return UserName;
	}
	public void setUserName(long userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getMiddleName() {
		return MiddleName;
	}
	public void setMiddleName(String middleName) {
		MiddleName = middleName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getLandMark() {
		return LandMark;
	}
	public void setLandMark(String landMark) {
		LandMark = landMark;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getPincode() {
		return Pincode;
	}
	public void setPincode(String pincode) {
		Pincode = pincode;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getEmailId() {
		return EmailId;
	}
	public void setEmailId(String emailId) {
		EmailId = emailId;
	}
	public String getGSTNo() {
		return GSTNo;
	}
	public void setGSTNo(String gSTNo) {
		GSTNo = gSTNo;
	}
	public String getSTBNo() {
		return STBNo;
	}
	public void setSTBNo(String sTBNo) {
		STBNo = sTBNo;
	}
	public String getCRFNo() {
		return CRFNo;
	}
	public void setCRFNo(String cRFNo) {
		CRFNo = cRFNo;
	}
	public String getBasePCKG() {
		return BasePCKG;
	}
	public void setBasePCKG(String basePCKG) {
		BasePCKG = basePCKG;
	}
	public String getAddOnPCKG() {
		return AddOnPCKG;
	}
	public void setAddOnPCKG(String addOnPCKG) {
		AddOnPCKG = addOnPCKG;
	}
	public String getA_La_Carte() {
		return A_La_Carte;
	}
	public void setA_La_Carte(String a_La_Carte) {
		A_La_Carte = a_La_Carte;
	}
	public String getPCKGPrice() {
		return PCKGPrice;
	}
	public void setPCKGPrice(String pCKGPrice) {
		PCKGPrice = pCKGPrice;
	}
	public String getAccountBalance() {
		return AccountBalance;
	}
	public void setAccountBalance(String accountBalance) {
		AccountBalance = accountBalance;
	}
	public String getTrndate() {
		return trndate;
	}
	public void setTrndate(String trndate) {
		this.trndate = trndate;
	}
	public String getSTB_IssuedOn() {
		return STB_IssuedOn;
	}
	public void setSTB_IssuedOn(String sTB_IssuedOn) {
		STB_IssuedOn = sTB_IssuedOn;
	}
	public String getStandBySTBIssued() {
		return StandBySTBIssued;
	}
	public void setStandBySTBIssued(String standBySTBIssued) {
		StandBySTBIssued = standBySTBIssued;
	}
	public String getReturnSTB() {
		return ReturnSTB;
	}
	public void setReturnSTB(String returnSTB) {
		ReturnSTB = returnSTB;
	}
	public String getCAF_Url() {
		return CAF_Url;
	}
	public void setCAF_Url(String cAF_Url) {
		CAF_Url = cAF_Url;
	}
	public String getLcoId() {
		return LcoId;
	}
	public void setLcoId(String lcoId) {
		LcoId = lcoId;
	}
	
	
	
	

}
