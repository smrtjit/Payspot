package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "channels")
public class AllChannels {
	
	
	@Id
	private int id;
	private String channel_name;
	private String mso_price;
	private String lco_price;
	private String updated_on;
	private String lco_id;
	public AllChannels() {
		// TODO Auto-generated constructor stub
	}
	public AllChannels(int id, String channel_name, String mso_price, String lco_price, String updated_on,
			String lco_id) {
		super();
		this.id = id;
		this.channel_name = channel_name;
		this.mso_price = mso_price;
		this.lco_price = lco_price;
		this.updated_on = updated_on;
		this.lco_id = lco_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getChannel_name() {
		return channel_name;
	}
	public void setChannel_name(String channel_name) {
		this.channel_name = channel_name;
	}
	public String getMso_price() {
		return mso_price;
	}
	public void setMso_price(String mso_price) {
		this.mso_price = mso_price;
	}
	public String getLco_price() {
		return lco_price;
	}
	public void setLco_price(String lco_price) {
		this.lco_price = lco_price;
	}
	public String getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(String updated_on) {
		this.updated_on = updated_on;
	}
	public String getLco_id() {
		return lco_id;
	}
	public void setLco_id(String lco_id) {
		this.lco_id = lco_id;
	}
	
}
