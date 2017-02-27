package com.dialnet.source.model;

public class BulkStock {
	
	private String Brand;
	private String mso;
	private String warranty;
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public String getMso() {
		return mso;
	}
	public void setMso(String mso) {
		this.mso = mso;
	}
	public String getWarranty() {
		return warranty;
	}
	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}
	@Override
	public String toString() {
		return "BulkStock [Brand=" + Brand + ", mso=" + mso + ", warranty=" + warranty + ", getBrand()=" + getBrand()
				+ ", getMso()=" + getMso() + ", getWarranty()=" + getWarranty() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
