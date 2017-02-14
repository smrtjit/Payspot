package com.dialnet.source.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "lm_login")
public class LMUser {

	@Id
	private Long username;
	
	
	private String PASSWORD;
	private String designation;
	private String firstName;
	private String middlename;
	private String lastName;
	private String email_id;
	private String mobile;
	private String Address;
	private String city;
	private String State;
	private String identity_proof;
	private String add_proof;
	private String responsibility;
	private String add_proof_type;
	private String add_proof_image_Name;
	private String identity_proof_type;
	private String identity_proof_image_name;
	private String lco_id;
	private String trnadate;
	public LMUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LMUser(Long username, String pASSWORD, String designation, String firstName, String middlename,
			String lastName, String email_id, String mobile, String address, String city, String state,
			String identity_proof, String add_proof, String responsibility, String add_proof_type,
			String add_proof_image_Name, String identity_proof_type, String identity_proof_image_name, String lco_id,
			String trnadate) {
		super();
		this.username = username;
		PASSWORD = pASSWORD;
		this.designation = designation;
		this.firstName = firstName;
		this.middlename = middlename;
		this.lastName = lastName;
		this.email_id = email_id;
		this.mobile = mobile;
		Address = address;
		this.city = city;
		State = state;
		this.identity_proof = identity_proof;
		this.add_proof = add_proof;
		this.responsibility = responsibility;
		this.add_proof_type = add_proof_type;
		this.add_proof_image_Name = add_proof_image_Name;
		this.identity_proof_type = identity_proof_type;
		this.identity_proof_image_name = identity_proof_image_name;
		this.lco_id = lco_id;
		this.trnadate = trnadate;
	}
	public Long getUsername() {
		return username;
	}
	public void setUsername(Long username) {
		this.username = username;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddlename() {
		return middlename;
	}
	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getIdentity_proof() {
		return identity_proof;
	}
	public void setIdentity_proof(String identity_proof) {
		this.identity_proof = identity_proof;
	}
	public String getAdd_proof() {
		return add_proof;
	}
	public void setAdd_proof(String add_proof) {
		this.add_proof = add_proof;
	}
	public String getResponsibility() {
		return responsibility;
	}
	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}
	public String getAdd_proof_type() {
		return add_proof_type;
	}
	public void setAdd_proof_type(String add_proof_type) {
		this.add_proof_type = add_proof_type;
	}
	public String getAdd_proof_image_Name() {
		return add_proof_image_Name;
	}
	public void setAdd_proof_image_Name(String add_proof_image_Name) {
		this.add_proof_image_Name = add_proof_image_Name;
	}
	public String getIdentity_proof_type() {
		return identity_proof_type;
	}
	public void setIdentity_proof_type(String identity_proof_type) {
		this.identity_proof_type = identity_proof_type;
	}
	public String getIdentity_proof_image_name() {
		return identity_proof_image_name;
	}
	public void setIdentity_proof_image_name(String identity_proof_image_name) {
		this.identity_proof_image_name = identity_proof_image_name;
	}
	public String getLco_id() {
		return lco_id;
	}
	public void setLco_id(String lco_id) {
		this.lco_id = lco_id;
	}
	public String getTrnadate() {
		return trnadate;
	}
	public void setTrnadate(String trnadate) {
		this.trnadate = trnadate;
	}
	
	
}
