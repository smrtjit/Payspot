package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "PackageDetail")
public class PackageDetail {

	@Id
	String Pckg_Id;
	String Channel_Name;
	public PackageDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PackageDetail(String pckg_Id, String channel_Name) {
		super();
		Pckg_Id = pckg_Id;
		Channel_Name = channel_Name;
	}
	public String getPckg_Id() {
		return Pckg_Id;
	}
	public void setPckg_Id(String pckg_Id) {
		Pckg_Id = pckg_Id;
	}
	public String getChannel_Name() {
		return Channel_Name;
	}
	public void setChannel_Name(String channel_Name) {
		Channel_Name = channel_Name;
	}
	
}
