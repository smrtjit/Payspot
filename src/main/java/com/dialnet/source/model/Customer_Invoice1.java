package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Cust_Invoice1")
public class Customer_Invoice1 {
	
	@Id
	String Invoice_No;
	
	
	String User_Id;
	String User_Name;
	String mobile_no;
	String email;
	String address;
	String Vc_No;
	String Billing_Date;
	String DueDate;
	String Package_Name;
	String Package_Cost;
	String Service_Tax;
	String Entertain_Tax;
	String Other_Tax;
	String Prevoius_Bal;
	String Advance_Amt;
	String LastPaid_Amt;
	String Total_Amount;
	String TotalAmt_AftDueDate;
	String LatePay_Charges;
	String Discount;
	String Paid_Amt;
	String Agent_Id;
	String date_of_paid;
	String bill_status;
	String trndate;
	String lco_id;
	
	public String getUser_Name() {
		return User_Name;
	}
	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}
	

	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Customer_Invoice1(String invoice_No, String user_Id, String user_Name, String mobile_no, String email,
			String address, String vc_No, String billing_Date, String dueDate, String package_Name, String package_Cost,
			String service_Tax, String entertain_Tax, String other_Tax, String prevoius_Bal, String advance_Amt,
			String lastPaid_Amt, String total_Amount, String totalAmt_AftDueDate, String latePay_Charges,
			String discount, String paid_Amt, String agent_Id, String date_of_paid, String bill_status, String trndate,
			String lco_id) {
		super();
		Invoice_No = invoice_No;
		User_Id = user_Id;
		User_Name = user_Name;
		this.mobile_no = mobile_no;
		this.email = email;
		this.address = address;
		Vc_No = vc_No;
		Billing_Date = billing_Date;
		DueDate = dueDate;
		Package_Name = package_Name;
		Package_Cost = package_Cost;
		Service_Tax = service_Tax;
		Entertain_Tax = entertain_Tax;
		Other_Tax = other_Tax;
		Prevoius_Bal = prevoius_Bal;
		Advance_Amt = advance_Amt;
		LastPaid_Amt = lastPaid_Amt;
		Total_Amount = total_Amount;
		TotalAmt_AftDueDate = totalAmt_AftDueDate;
		LatePay_Charges = latePay_Charges;
		Discount = discount;
		Paid_Amt = paid_Amt;
		Agent_Id = agent_Id;
		this.date_of_paid = date_of_paid;
		this.bill_status = bill_status;
		this.trndate = trndate;
		this.lco_id = lco_id;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public Customer_Invoice1() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getOther_Tax() {
		return Other_Tax;
	}
	public void setOther_Tax(String other_Tax) {
		Other_Tax = other_Tax;
	}
	public String getLco_id() {
		return lco_id;
	}
	public void setLco_id(String lco_id) {
		this.lco_id = lco_id;
	}
	public String getTrndate() {
		return trndate;
	}
	public void setTrndate(String trndate) {
		this.trndate = trndate;
	}
	public String getInvoice_No() {
		return Invoice_No;
	}
	public void setInvoice_No(String invoice_No) {
		Invoice_No = invoice_No;
	}
	public String getUser_Id() {
		return User_Id;
	}
	public void setUser_Id(String user_Id) {
		User_Id = user_Id;
	}
	public String getVc_No() {
		return Vc_No;
	}
	public void setVc_No(String vc_No) {
		Vc_No = vc_No;
	}
	public String getBilling_Date() {
		return Billing_Date;
	}
	public void setBilling_Date(String billing_Date) {
		Billing_Date = billing_Date;
	}
	public String getDueDate() {
		return DueDate;
	}
	public void setDueDate(String dueDate) {
		DueDate = dueDate;
	}
	public String getPackage_Name() {
		return Package_Name;
	}
	public void setPackage_Name(String package_Name) {
		Package_Name = package_Name;
	}
	public String getPackage_Cost() {
		return Package_Cost;
	}
	public void setPackage_Cost(String package_Cost) {
		Package_Cost = package_Cost;
	}
	public String getService_Tax() {
		return Service_Tax;
	}
	public void setService_Tax(String service_Tax) {
		Service_Tax = service_Tax;
	}
	public String getEntertain_Tax() {
		return Entertain_Tax;
	}
	public void setEntertain_Tax(String entertain_Tax) {
		Entertain_Tax = entertain_Tax;
	}
	public String getPrevoius_Bal() {
		return Prevoius_Bal;
	}
	public void setPrevoius_Bal(String prevoius_Bal) {
		Prevoius_Bal = prevoius_Bal;
	}
	public String getAdvance_Amt() {
		return Advance_Amt;
	}
	public void setAdvance_Amt(String advance_Amt) {
		Advance_Amt = advance_Amt;
	}
	public String getLastPaid_Amt() {
		return LastPaid_Amt;
	}
	public void setLastPaid_Amt(String lastPaid_Amt) {
		LastPaid_Amt = lastPaid_Amt;
	}
	public String getTotal_Amount() {
		return Total_Amount;
	}
	public void setTotal_Amount(String total_Amount) {
		Total_Amount = total_Amount;
	}
	public String getTotalAmt_AftDueDate() {
		return TotalAmt_AftDueDate;
	}
	public void setTotalAmt_AftDueDate(String totalAmt_AftDueDate) {
		TotalAmt_AftDueDate = totalAmt_AftDueDate;
	}
	public String getLatePay_Charges() {
		return LatePay_Charges;
	}
	public void setLatePay_Charges(String latePay_Charges) {
		LatePay_Charges = latePay_Charges;
	}
	public String getDiscount() {
		return Discount;
	}
	public void setDiscount(String discount) {
		Discount = discount;
	}
	public String getPaid_Amt() {
		return Paid_Amt;
	}
	public void setPaid_Amt(String paid_Amt) {
		Paid_Amt = paid_Amt;
	}
	public String getAgent_Id() {
		return Agent_Id;
	}
	public void setAgent_Id(String agent_Id) {
		Agent_Id = agent_Id;
	}
	public String getDate_of_paid() {
		return date_of_paid;
	}
	public void setDate_of_paid(String date_of_paid) {
		this.date_of_paid = date_of_paid;
	}
	public String getBill_status() {
		return bill_status;
	}
	public void setBill_status(String bill_status) {
		this.bill_status = bill_status;
	}
	
	
	

}
