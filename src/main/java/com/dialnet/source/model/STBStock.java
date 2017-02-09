package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "lco_stb_box")
public class STBStock {

	@Id
	@GeneratedValue
	private int id;
	
	public STBStock(int id, String stb_box_no, String manufacture_date, String exp_date, String company, String mso,
			String current_status, String time_stamp, String lco_id) {
		super();
		this.id = id;
		this.stb_box_no = stb_box_no;
		this.manufacture_date = manufacture_date;
		this.exp_date = exp_date;
		this.company = company;
		this.mso = mso;
		this.current_status = current_status;
		this.time_stamp = time_stamp;
		this.lco_id = lco_id;
	}
	public String getLco_id() {
		return lco_id;
	}
	
	public void setLco_id(String lco_id) {
		this.lco_id = lco_id;
	}
	@NotEmpty
	@Size(min = 1, max = 35)
	private String stb_box_no;
	
	
	@NotEmpty
	@Size(min = 1, max = 35)
	private String manufacture_date;
	private String exp_date;
	
	@NotEmpty
	@Size(min = 1, max = 75)
	private String company;
	private String mso;
	private String current_status;
	private String time_stamp;
	
	private String lco_id;
	public STBStock() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStb_box_no() {
		return stb_box_no;
	}
	public void setStb_box_no(String stb_box_no) {
		this.stb_box_no = stb_box_no;
	}
	public String getManufacture_date() {
		return manufacture_date;
	}
	public void setManufacture_date(String manufacture_date) {
		this.manufacture_date = manufacture_date;
	}
	public String getExp_date() {
		return exp_date;
	}
	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getMso() {
		return mso;
	}
	public void setMso(String mso) {
		this.mso = mso;
	}
	public String getCurrent_status() {
		return current_status;
	}
	public void setCurrent_status(String current_status) {
		this.current_status = current_status;
	}
	public String getTime_stamp() {
		return time_stamp;
	}
	public void setTime_stamp(String time_stamp) {
		this.time_stamp = time_stamp;
	}
	
}
