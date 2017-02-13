package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "channels")
public class AllChannels {

	@Id
	private long channel_id;
	private String channel_name;
	private String mso_price;
	private String lco_price;
	private String lco_id;
	private String updated_on;
	public AllChannels() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AllChannels(long channel_id, String channel_name, String mso_price, String lco_price, String lco_id,
			String updated_on) {
		super();
		this.channel_id = channel_id;
		this.channel_name = channel_name;
		this.mso_price = mso_price;
		this.lco_price = lco_price;
		this.lco_id = lco_id;
		this.updated_on = updated_on;
	}
	
	public long getChannel_id() {
		return channel_id;
	}
	public void setChannel_id(long channel_id) {
		this.channel_id = channel_id;
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
	public String getLco_id() {
		return lco_id;
	}
	public void setLco_id(String lco_id) {
		this.lco_id = lco_id;
	}
	public String getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(String updated_on) {
		this.updated_on = updated_on;
	}
	
}
