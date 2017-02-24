
package com.dialnet.source.model;

public class BulkRechargeAmount {

	private String invoiceid;
	private int customerid;

	public String getInvoiceid() {
		return invoiceid;
	}





	public void setInvoiceid(String invoiceid) {
		this.invoiceid = invoiceid;
	}





	public int getCustomerid() {
		return customerid;
	}

	

	

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getCustomeraddress() {
		return customeraddress;
	}

	public void setCustomeraddress(String customeraddress) {
		this.customeraddress = customeraddress;
	}

	public String getCustomerpackagename() {
		return customerpackagename;
	}

	public void setCustomerpackagename(String customerpackagename) {
		this.customerpackagename = customerpackagename;
	}

	public String getCustomermobileno() {
		return customermobileno;
	}

	public void setCustomermobileno(String customermobileno) {
		this.customermobileno = customermobileno;
	}

	public String getCustomeremailid() {
		return customeremailid;
	}

	public void setCustomeremailid(String customeremailid) {
		this.customeremailid = customeremailid;
	}

	public float getCustomeramountofrecharge() {
		return customeramountofrecharge;
	}

	public void setCustomeramountofrecharge(float customeramountofrecharge) {
		this.customeramountofrecharge = customeramountofrecharge;
	}



	private String customername;
	private String customeraddress;
	private String customerpackagename;
	private String customermobileno;
	private String customeremailid;
	private float customeramountofrecharge;

	

	@Override
	public String toString() {
		return "BulkRechargeAmount [invoiceid=" + invoiceid + ", customerid=" + customerid + ", customername="
				+ customername + ", customeraddress=" + customeraddress + ", customerpackagename=" + customerpackagename
				+ ", customermobileno=" + customermobileno + ", customeremailid=" + customeremailid
				+ ", customeramountofrecharge=" + customeramountofrecharge + "]";
	}


}