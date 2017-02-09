package com.dialnet.source.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Package_Info")
public class PackageInfo {

	@Id
	@GeneratedValue
	@Column(name = "code")
	private long code;
	

	@Size(min = 1, max = 25)
	private String name;
	
	private String price;
	
	private String duration;
	
	private String type;
	
	private String trndate;
	public PackageInfo() {
		super();
	}

	public PackageInfo(long code, String name, String price, String duration, String type, String trndate) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.duration = duration;
		this.type = type;
		this.trndate = trndate;
	}

	public long getCode() {
		return code;
	}

	public void setCode(long code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTrndate() {
		return trndate;
	}

	public void setTrndate(String trndate) {
		this.trndate = trndate;
	}

	
}
