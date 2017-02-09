package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "Cust_Invoice")
public class Cust_Invoice {
	
	@Id
	private String Invoice_No;
	
	private String bill_status;
	public Cust_Invoice() {
		super();
	}

	public String getBill_status() {
		return bill_status;
	}



	public Cust_Invoice(String invoice_No, String bill_status, String user_Id, String billing_Date, String lastDue_Date,
			String dueDate, String total_Amount, String package_Name, String package_Cost, String service_Tax,
			String entertain_Tax, String vAT, String prevoius_Bal, String advance_Amt, String lastPaid_Amt,
			String totalAmt_AftDueDate, String latePay_Charges, String diascount, String user_Name, String vc_No) {
		super();
		Invoice_No = invoice_No;
		this.bill_status = bill_status;
		User_Id = user_Id;
		Billing_Date = billing_Date;
		LastDue_Date = lastDue_Date;
		DueDate = dueDate;
		Total_Amount = total_Amount;
		Package_Name = package_Name;
		Package_Cost = package_Cost;
		Service_Tax = service_Tax;
		Entertain_Tax = entertain_Tax;
		VAT = vAT;
		Prevoius_Bal = prevoius_Bal;
		Advance_Amt = advance_Amt;
		LastPaid_Amt = lastPaid_Amt;
		TotalAmt_AftDueDate = totalAmt_AftDueDate;
		LatePay_Charges = latePay_Charges;
		Diascount = diascount;
		User_Name = user_Name;
		Vc_No = vc_No;
	}

	public void setBill_status(String bill_status) {
		this.bill_status = bill_status;
	}



	public String getUser_Name() {
		return User_Name;
	}

	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}

	public String getVc_No() {
		return Vc_No;
	}

	public void setVc_No(String vc_No) {
		Vc_No = vc_No;
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

	public String getBilling_Date() {
		return Billing_Date;
	}

	public void setBilling_Date(String billing_Date) {
		Billing_Date = billing_Date;
	}

	public String getLastDue_Date() {
		return LastDue_Date;
	}

	public void setLastDue_Date(String lastDue_Date) {
		LastDue_Date = lastDue_Date;
	}

	public String getDueDate() {
		return DueDate;
	}

	public void setDueDate(String dueDate) {
		DueDate = dueDate;
	}

	public String getTotal_Amount() {
		return Total_Amount;
	}

	public void setTotal_Amount(String total_Amount) {
		Total_Amount = total_Amount;
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

	public String getVAT() {
		return VAT;
	}

	public void setVAT(String vAT) {
		VAT = vAT;
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

	public String getDiascount() {
		return Diascount;
	}

	public void setDiascount(String diascount) {
		Diascount = diascount;
	}

	@NotEmpty
	@Size(min = 1, max = 35)
	private String User_Id;
	
	@NotEmpty
	private String Billing_Date;
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String LastDue_Date;
	
	@NotEmpty
	@Size(min = 1, max = 95)
	private String DueDate;
	
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String Total_Amount;
	
	@NotEmpty
	@Size(min = 1, max = 95)
	private String Package_Name;
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String Package_Cost;
	
	@NotEmpty
	@Size(min = 1, max = 95)
	private String Service_Tax;
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String Entertain_Tax;
	
	@NotEmpty
	@Size(min = 1, max = 95)
	private String VAT;
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String Prevoius_Bal;
	
	@NotEmpty
	@Size(min = 1, max = 95)
	private String Advance_Amt;
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String LastPaid_Amt;
	
	@NotEmpty
	@Size(min = 1, max = 95)
	private String TotalAmt_AftDueDate;
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String LatePay_Charges;
	
	
	@Size(min = 1, max = 95)
	private String Diascount;
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String User_Name;
	
	@NotEmpty
	@Size(min = 1, max = 50)
	private String Vc_No;
	
	
}
