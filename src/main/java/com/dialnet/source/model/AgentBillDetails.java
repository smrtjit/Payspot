package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Agent_Bill_Details")
public class AgentBillDetails {
	
	@Id
	private String invoice_id;
	private String fromDate;
	private String toDate;
	private String custId;
	private String totalAmt;
	private String receivedAmt;
	private String agentId;
	private String Payment_Type;
	private String referenceId;
	private String Remark;
	private String instatus;
	private String approvedBy;
	private String approvalDate;
	public AgentBillDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AgentBillDetails(String invoice_id, String fromDate, String toDate, String custId, String totalAmt,
			String receivedAmt, String agentId, String payment_Type, String referenceId, String remark, String instatus,
			String approvedBy, String approvalDate) {
		super();
		this.invoice_id = invoice_id;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.custId = custId;
		this.totalAmt = totalAmt;
		this.receivedAmt = receivedAmt;
		this.agentId = agentId;
		Payment_Type = payment_Type;
		this.referenceId = referenceId;
		Remark = remark;
		this.instatus = instatus;
		this.approvedBy = approvedBy;
		this.approvalDate = approvalDate;
	}

	public String getPayment_Type() {
		return Payment_Type;
	}

	public void setPayment_Type(String payment_Type) {
		Payment_Type = payment_Type;
	}

	public String getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(String invoice_id) {
		this.invoice_id = invoice_id;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}
	public String getReceivedAmt() {
		return receivedAmt;
	}
	public void setReceivedAmt(String receivedAmt) {
		this.receivedAmt = receivedAmt;
	}
	public String getAgentId() {
		return agentId;
	}
	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}
	public String getReferenceId() {
		return referenceId;
	}
	public void setReferenceId(String referenceId) {
		this.referenceId = referenceId;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public String getInstatus() {
		return instatus;
	}
	public void setInstatus(String instatus) {
		this.instatus = instatus;
	}
	public String getApprovedBy() {
		return approvedBy;
	}
	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}
	public String getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}
	
	

}
