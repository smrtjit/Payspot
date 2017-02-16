package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cities")
public class Citys {
	
	@Id
	private int city_id;
	public Citys() {
		super();
	}
	public Citys(int city_id, String city_name, String city_state) {
		super();
		this.city_id = city_id;
		this.city_name = city_name;
		this.city_state = city_state;
	}
	
	public int getCity_id() {
		return city_id;
	}
	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public String getCity_state() {
		return city_state;
	}
	public void setCity_state(String city_state) {
		this.city_state = city_state;
	}
	private String city_name;
	private String city_state;

}
