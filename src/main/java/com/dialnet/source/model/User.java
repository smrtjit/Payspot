package com.dialnet.source.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="lco_user_login")
public class User {

	


	@Id
	@GeneratedValue
	private long id;
	
	
	public User() {
		super();
	}

	public User(long id, String username, String customer_name, String customer_add, String customer_mobile,
			String password, String customer_email, String customer_id_no, String customer_photo, String customer_vc_no,
			String customer_stb_no, String customer_waranty_date, String connection_status, String package_name,
			String pairing_status, String account_balance, String last_payment, String last_recharge_date,
			String connection_go_live, String timestamp, String con_expiry_date, String bill_status,
			String alternate_mobile, String package_amount, String lco_id, String cf_number, String id_proof_type) {
		super();
		this.id = id;
		this.username = username;
		this.customer_name = customer_name;
		this.customer_add = customer_add;
		this.customer_mobile = customer_mobile;
		this.password = password;
		this.customer_email = customer_email;
		this.customer_id_no = customer_id_no;
		this.customer_photo = customer_photo;
		this.customer_vc_no = customer_vc_no;
		this.customer_stb_no = customer_stb_no;
		this.customer_waranty_date = customer_waranty_date;
		this.connection_status = connection_status;
		this.package_name = package_name;
		this.pairing_status = pairing_status;
		this.account_balance = account_balance;
		this.last_payment = last_payment;
		this.last_recharge_date = last_recharge_date;
		this.connection_go_live = connection_go_live;
		this.timestamp = timestamp;
		this.con_expiry_date = con_expiry_date;
		this.bill_status = bill_status;
		this.alternate_mobile = alternate_mobile;
		this.package_amount = package_amount;
		this.lco_id = lco_id;
		this.cf_number = cf_number;
		this.id_proof_type = id_proof_type;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_add() {
		return customer_add;
	}

	public void setCustomer_add(String customer_add) {
		this.customer_add = customer_add;
	}

	public String getCustomer_mobile() {
		return customer_mobile;
	}

	public void setCustomer_mobile(String customer_mobile) {
		this.customer_mobile = customer_mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_id_no() {
		return customer_id_no;
	}

	public void setCustomer_id_no(String customer_id_no) {
		this.customer_id_no = customer_id_no;
	}

	public String getCustomer_photo() {
		return customer_photo;
	}

	public void setCustomer_photo(String customer_photo) {
		this.customer_photo = customer_photo;
	}

	public String getCustomer_vc_no() {
		return customer_vc_no;
	}

	public void setCustomer_vc_no(String customer_vc_no) {
		this.customer_vc_no = customer_vc_no;
	}

	public String getCustomer_stb_no() {
		return customer_stb_no;
	}

	public void setCustomer_stb_no(String customer_stb_no) {
		this.customer_stb_no = customer_stb_no;
	}

	public String getCustomer_waranty_date() {
		return customer_waranty_date;
	}

	public void setCustomer_waranty_date(String customer_waranty_date) {
		this.customer_waranty_date = customer_waranty_date;
	}

	public String getConnection_status() {
		return connection_status;
	}

	public void setConnection_status(String connection_status) {
		this.connection_status = connection_status;
	}

	public String getPackage_name() {
		return package_name;
	}

	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}

	public String getPairing_status() {
		return pairing_status;
	}

	public void setPairing_status(String pairing_status) {
		this.pairing_status = pairing_status;
	}

	public String getAccount_balance() {
		return account_balance;
	}

	public void setAccount_balance(String account_balance) {
		this.account_balance = account_balance;
	}

	public String getLast_payment() {
		return last_payment;
	}

	public void setLast_payment(String last_payment) {
		this.last_payment = last_payment;
	}

	public String getLast_recharge_date() {
		return last_recharge_date;
	}

	public void setLast_recharge_date(String last_recharge_date) {
		this.last_recharge_date = last_recharge_date;
	}

	public String getConnection_go_live() {
		return connection_go_live;
	}

	public void setConnection_go_live(String connection_go_live) {
		this.connection_go_live = connection_go_live;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getCon_expiry_date() {
		return con_expiry_date;
	}

	public void setCon_expiry_date(String con_expiry_date) {
		this.con_expiry_date = con_expiry_date;
	}

	public String getBill_status() {
		return bill_status;
	}

	public void setBill_status(String bill_status) {
		this.bill_status = bill_status;
	}

	public String getAlternate_mobile() {
		return alternate_mobile;
	}

	public void setAlternate_mobile(String alternate_mobile) {
		this.alternate_mobile = alternate_mobile;
	}

	public String getPackage_amount() {
		return package_amount;
	}

	public void setPackage_amount(String package_amount) {
		this.package_amount = package_amount;
	}

	public String getLco_id() {
		return lco_id;
	}

	public void setLco_id(String lco_id) {
		this.lco_id = lco_id;
	}

	public String getCf_number() {
		return cf_number;
	}

	public void setCf_number(String cf_number) {
		this.cf_number = cf_number;
	}

	public String getId_proof_type() {
		return id_proof_type;
	}

	public void setId_proof_type(String id_proof_type) {
		this.id_proof_type = id_proof_type;
	}


	@Size(min=4, max=40)
	private String username;
	
	
	@Size(min=4, max=40)
	private String customer_name;
	
	
	private String customer_add;
	

	private String customer_mobile;
	
	
	@Size(min=4, max=28)
	private String password;
	
	
	@Email
	private String customer_email;
	
	private String customer_id_no;
	
	private String customer_photo;
	

	private String customer_vc_no;
	

	private String customer_stb_no;
	private String customer_waranty_date;
	
	
	private String connection_status;
	private String package_name;
	private String pairing_status;
	

	private String account_balance;
	private String last_payment;
	private String last_recharge_date;
	private String connection_go_live;
	private String timestamp;
	private String con_expiry_date;
	private String bill_status;
	
	private String alternate_mobile;
	
	private String package_amount;
	
	private String lco_id;
	
	private String cf_number;
	
	private String id_proof_type;
	

	
		
}
