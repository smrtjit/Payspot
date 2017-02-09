package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Tax_Table")
public class TaxInformation {

	@Id
	@GeneratedValue
	int id;
	
	String serviceTax;
	String VAT;
	String Ammusement_Tax;
	String Other_Tax;
	String entertainment_Tax;
	String lateFee;
	String lco_id;
	
	public TaxInformation() {
		// TODO Auto-generated constructor stub
	}
	
	

	public String getLco_id() {
		return lco_id;
	}



	public void setLco_id(String lco_id) {
		this.lco_id = lco_id;
	}



	public TaxInformation(int id, String serviceTax, String vAT, String ammusement_Tax, String other_Tax,
			String entertainment_Tax, String lateFee, String lco_id) {
		super();
		this.id = id;
		this.serviceTax = serviceTax;
		VAT = vAT;
		Ammusement_Tax = ammusement_Tax;
		Other_Tax = other_Tax;
		this.entertainment_Tax = entertainment_Tax;
		this.lateFee = lateFee;
		this.lco_id = lco_id;
	}



	public String getLateFee() {
		return lateFee;
	}



	public void setLateFee(String lateFee) {
		this.lateFee = lateFee;
	}



	public String getEntertainment_Tax() {
		return entertainment_Tax;
	}

	public void setEntertainment_Tax(String entertainment_Tax) {
		this.entertainment_Tax = entertainment_Tax;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getServiceTax() {
		return serviceTax;
	}
	public void setServiceTax(String serviceTax) {
		this.serviceTax = serviceTax;
	}
	public String getVAT() {
		return VAT;
	}
	public void setVAT(String vAT) {
		VAT = vAT;
	}
	public String getAmmusement_Tax() {
		return Ammusement_Tax;
	}
	public void setAmmusement_Tax(String ammusement_Tax) {
		Ammusement_Tax = ammusement_Tax;
	}
	public String getOther_Tax() {
		return Other_Tax;
	}
	public void setOther_Tax(String other_Tax) {
		Other_Tax = other_Tax;
	}
	
	
}
