/**
 * 
 */
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
@Table(name = "lco_login")
/**
 * @author Jitesh
 *
 */
public class LCOUser {
	
	public LCOUser(){
		
	}
	public LCOUser(Long id, String loc_code, String loc_name, String login_id, String password, String f_name,
			String m_name, String l_name, String jv_no, String direct_no, String brm_po_id, String account_no,
			String address, String state, String city, String mobile, String emaiil, String role, String timestamp) {
		super();
		this.id = id;
		this.loc_code = loc_code;
		this.loc_name = loc_name;
		this.login_id = login_id;
		this.password = password;
		this.f_name = f_name;
		this.m_name = m_name;
		this.l_name = l_name;
		this.jv_no = jv_no;
		this.direct_no = direct_no;
		this.brm_po_id = brm_po_id;
		this.account_no = account_no;
		this.address = address;
		this.state = state;
		this.city = city;
		this.mobile = mobile;
		this.emaiil = emaiil;
		this.role = role;
		this.timestamp = timestamp;
	}

	@Id
	@GeneratedValue
	private Long id;

	@NotEmpty
	@Size(min = 4, max = 20)
	private String loc_code;

	@NotEmpty
	private String loc_name;

	@NotEmpty
	private String login_id;

	@NotEmpty
	private String password;

	@NotEmpty
	private String f_name;

	@NotEmpty
	private String m_name;

	@NotEmpty
	private String l_name;

	@NotEmpty
	private String jv_no;

	@Email
	@NotEmpty
	private String direct_no;

	@NotEmpty
	private String brm_po_id;

	@NotEmpty
	private String account_no;

	@NotEmpty
	private String address;

	@NotEmpty
	private String state;

	@NotEmpty
	private String city;

	@NotEmpty
	private String mobile;

	@NotEmpty
	private String emaiil;

	@NotEmpty
	private String role;

	@NotEmpty
	private String timestamp;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLoc_code() {
		return loc_code;
	}

	public void setLoc_code(String loc_code) {
		this.loc_code = loc_code;
	}

	public String getLoc_name() {
		return loc_name;
	}

	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getJv_no() {
		return jv_no;
	}

	public void setJv_no(String jv_no) {
		this.jv_no = jv_no;
	}

	public String getDirect_no() {
		return direct_no;
	}

	public void setDirect_no(String direct_no) {
		this.direct_no = direct_no;
	}

	public String getBrm_po_id() {
		return brm_po_id;
	}

	public void setBrm_po_id(String brm_po_id) {
		this.brm_po_id = brm_po_id;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmaiil() {
		return emaiil;
	}

	public void setEmaiil(String emaiil) {
		this.emaiil = emaiil;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

}