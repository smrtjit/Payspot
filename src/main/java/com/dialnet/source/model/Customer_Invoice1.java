package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Invoice_Detail")
public class Customer_Invoice1 {
	
	@Id
	String Invoice_No;
	
	
	String custId;
	String custName;
	String custMobile;
	String custAdd;
	String custBasePckg;
	String custAddPckg;
	String custALPckg;
	String custPckgCost;
	String sDate;
	String eDate;
	String serviceTax;
	String cess;
	String amusementTax;
	String totalAmt;
	String openingBal;
	String lastPaid;
	String currentBill;
	String totalDues;
	String dueDate;
	String billAfterDueDate;
	String trndate;
	String billStatus;
	String dateOfPaid;
	String AgentId;
	String lcoId;
	public String getInvoice_No() {
		return Invoice_No;
	}
	public void setInvoice_No(String invoice_No) {
		Invoice_No = invoice_No;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustMobile() {
		return custMobile;
	}
	public void setCustMobile(String custMobile) {
		this.custMobile = custMobile;
	}
	public String getCustAdd() {
		return custAdd;
	}
	public void setCustAdd(String custAdd) {
		this.custAdd = custAdd;
	}
	public String getCustBasePckg() {
		return custBasePckg;
	}
	public void setCustBasePckg(String custBasePckg) {
		this.custBasePckg = custBasePckg;
	}
	public String getCustAddPckg() {
		return custAddPckg;
	}
	public void setCustAddPckg(String custAddPckg) {
		this.custAddPckg = custAddPckg;
	}
	public String getCustALPckg() {
		return custALPckg;
	}
	public void setCustALPckg(String custALPckg) {
		this.custALPckg = custALPckg;
	}
	public String getCustPckgCost() {
		return custPckgCost;
	}
	public void setCustPckgCost(String custPckgCost) {
		this.custPckgCost = custPckgCost;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public String getServiceTax() {
		return serviceTax;
	}
	public void setServiceTax(String serviceTax) {
		this.serviceTax = serviceTax;
	}
	public String getCess() {
		return cess;
	}
	public void setCess(String cess) {
		this.cess = cess;
	}
	public String getAmusementTax() {
		return amusementTax;
	}
	public void setAmusementTax(String amusementTax) {
		this.amusementTax = amusementTax;
	}
	public String getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}
	public String getOpeningBal() {
		return openingBal;
	}
	public void setOpeningBal(String openingBal) {
		this.openingBal = openingBal;
	}
	public String getLastPaid() {
		return lastPaid;
	}
	public void setLastPaid(String lastPaid) {
		this.lastPaid = lastPaid;
	}
	public String getCurrentBill() {
		return currentBill;
	}
	public void setCurrentBill(String currentBill) {
		this.currentBill = currentBill;
	}
	public String getTotalDues() {
		return totalDues;
	}
	public void setTotalDues(String totalDues) {
		this.totalDues = totalDues;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getBillAfterDueDate() {
		return billAfterDueDate;
	}
	public void setBillAfterDueDate(String billAfterDueDate) {
		this.billAfterDueDate = billAfterDueDate;
	}
	public String getTrndate() {
		return trndate;
	}
	public void setTrndate(String trndate) {
		this.trndate = trndate;
	}
	public String getBillStatus() {
		return billStatus;
	}
	public void setBillStatus(String billStatus) {
		this.billStatus = billStatus;
	}
	public String getDateOfPaid() {
		return dateOfPaid;
	}
	public void setDateOfPaid(String dateOfPaid) {
		this.dateOfPaid = dateOfPaid;
	}
	public String getAgentId() {
		return AgentId;
	}
	public void setAgentId(String agentId) {
		AgentId = agentId;
	}
	public String getLcoId() {
		return lcoId;
	}
	public void setLcoId(String lcoId) {
		this.lcoId = lcoId;
	}
	public Customer_Invoice1(String invoice_No, String custId, String custName, String custMobile, String custAdd,
			String custBasePckg, String custAddPckg, String custALPckg, String custPckgCost, String sDate, String eDate,
			String serviceTax, String cess, String amusementTax, String totalAmt, String openingBal, String lastPaid,
			String currentBill, String totalDues, String dueDate, String billAfterDueDate, String trndate,
			String billStatus, String dateOfPaid, String agentId, String lcoId) {
		super();
		Invoice_No = invoice_No;
		this.custId = custId;
		this.custName = custName;
		this.custMobile = custMobile;
		this.custAdd = custAdd;
		this.custBasePckg = custBasePckg;
		this.custAddPckg = custAddPckg;
		this.custALPckg = custALPckg;
		this.custPckgCost = custPckgCost;
		this.sDate = sDate;
		this.eDate = eDate;
		this.serviceTax = serviceTax;
		this.cess = cess;
		this.amusementTax = amusementTax;
		this.totalAmt = totalAmt;
		this.openingBal = openingBal;
		this.lastPaid = lastPaid;
		this.currentBill = currentBill;
		this.totalDues = totalDues;
		this.dueDate = dueDate;
		this.billAfterDueDate = billAfterDueDate;
		this.trndate = trndate;
		this.billStatus = billStatus;
		this.dateOfPaid = dateOfPaid;
		AgentId = agentId;
		this.lcoId = lcoId;
	}
	public Customer_Invoice1() {
		super();
	}
	
	

}
