package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "All_Collection")
public class AllCollections {
	
	@Id
	private String Invoice;
	
	@NotEmpty
	@Size(min = 1, max = 35)
	private String Cust_Id;
	
	@NotEmpty
	private String cust_mobile;
	
	@NotEmpty
	@Size(min = 1, max = 150)
	private String Cust_Name;
	
	@NotEmpty
	@Size(min = 1, max = 95)
	private String Current_Pckg;
	
	@NotEmpty
	@Size(min = 1, max = 30)
	private String Paid_Amount;
	
	@NotEmpty
	@Size(min = 1, max = 35)
	private String Recharge_Amount;
	
	@NotEmpty
	@Size(min = 1, max = 5)
	private String Discount;
	
	@NotEmpty
	@Size(min = 1, max = 25)
	private String Payment_Mode;
	private String Approval_ID;
	private String Payment_Status;
	private String RefernceId;
	private String trndate;
	private String Collecting_Agent;
	private String Approval_Date;
	private String Remark;
	private String Payment_Type;
	private String Lco_Id;
	public AllCollections() {
		// TODO Auto-generated constructor stub
	}
	
	
	public AllCollections(String invoice, String cust_Id, String cust_mobile, String cust_Name, String current_Pckg,
			String paid_Amount, String recharge_Amount, String discount, String payment_Mode, String approval_ID,
			String payment_Status, String refernceId, String trndate, String collecting_Agent, String approval_Date,
			String remark, String payment_Type, String lco_Id) {
		super();
		Invoice = invoice;
		Cust_Id = cust_Id;
		this.cust_mobile = cust_mobile;
		Cust_Name = cust_Name;
		Current_Pckg = current_Pckg;
		Paid_Amount = paid_Amount;
		Recharge_Amount = recharge_Amount;
		Discount = discount;
		Payment_Mode = payment_Mode;
		Approval_ID = approval_ID;
		Payment_Status = payment_Status;
		RefernceId = refernceId;
		this.trndate = trndate;
		Collecting_Agent = collecting_Agent;
		Approval_Date = approval_Date;
		Remark = remark;
		Payment_Type = payment_Type;
		Lco_Id = lco_Id;
	}


	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public String getLco_Id() {
		return Lco_Id;
	}



	public void setLco_Id(String lco_Id) {
		Lco_Id = lco_Id;
	}



	public String getPayment_Type() {
		return Payment_Type;
	}

	public void setPayment_Type(String payment_Type) {
		Payment_Type = payment_Type;
	}

	public String getInvoice() {
		return Invoice;
	}
	public void setInvoice(String invoice) {
		Invoice = invoice;
	}
	
	public String getCust_Id() {
		return Cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		Cust_Id = cust_Id;
	}

	public String getCust_Name() {
		return Cust_Name;
	}
	public String getCust_mobile() {
		return cust_mobile;
	}

	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}

	public void setCust_Name(String cust_Name) {
		Cust_Name = cust_Name;
	}
	public String getCurrent_Pckg() {
		return Current_Pckg;
	}
	public void setCurrent_Pckg(String current_Pckg) {
		Current_Pckg = current_Pckg;
	}
	
	public String getPaid_Amount() {
		return Paid_Amount;
	}



	public void setPaid_Amount(String paid_Amount) {
		Paid_Amount = paid_Amount;
	}



	public String getRecharge_Amount() {
		return Recharge_Amount;
	}
	public void setRecharge_Amount(String recharge_Amount) {
		Recharge_Amount = recharge_Amount;
	}
	public String getDiscount() {
		return Discount;
	}
	public void setDiscount(String discount) {
		Discount = discount;
	}
	public String getPayment_Mode() {
		return Payment_Mode;
	}
	public void setPayment_Mode(String payment_Mode) {
		Payment_Mode = payment_Mode;
	}
	
	public String getApproval_ID() {
		return Approval_ID;
	}



	public void setApproval_ID(String approval_ID) {
		Approval_ID = approval_ID;
	}



	public String getCollecting_Agent() {
		return Collecting_Agent;
	}



	public void setCollecting_Agent(String collecting_Agent) {
		Collecting_Agent = collecting_Agent;
	}



	public String getApproval_Date() {
		return Approval_Date;
	}



	public void setApproval_Date(String approval_Date) {
		Approval_Date = approval_Date;
	}



	public String getPayment_Status() {
		return Payment_Status;
	}
	public void setPayment_Status(String payment_Status) {
		Payment_Status = payment_Status;
	}
	public String getRefernceId() {
		return RefernceId;
	}
	public void setRefernceId(String refernceId) {
		RefernceId = refernceId;
	}
	public String getTrndate() {
		return trndate;
	}
	public void setTrndate(String trndate) {
		this.trndate = trndate;
	}
	
	
}
