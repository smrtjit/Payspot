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
	@GeneratedValue
	private Long id;

	

	
	public LMUser() {
		super();
	}
	public LMUser(Long id, String username, String password, String designation, String name, String email_id,
			String mobile, String landline_no, String corres_add, String permanent_add, String identity_proof,
			String add_proof, String photo, String responsibility, String timestamp, String add_proof_type,
			String add_proof_image_Name, String identity_proof_type, String identity_proof_image_name, String lco_id) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.designation = designation;
		this.name = name;
		this.email_id = email_id;
		this.mobile = mobile;
		this.landline_no = landline_no;
		this.corres_add = corres_add;
		this.permanent_add = permanent_add;
		this.identity_proof = identity_proof;
		this.add_proof = add_proof;
		this.photo = photo;
		this.responsibility = responsibility;
		this.timestamp = timestamp;
		this.add_proof_type = add_proof_type;
		this.add_proof_image_Name = add_proof_image_Name;
		this.identity_proof_type = identity_proof_type;
		this.identity_proof_image_name = identity_proof_image_name;
		this.lco_id = lco_id;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getLandline_no() {
		return landline_no;
	}
	public void setLandline_no(String landline_no) {
		this.landline_no = landline_no;
	}
	public String getCorres_add() {
		return corres_add;
	}
	public void setCorres_add(String corres_add) {
		this.corres_add = corres_add;
	}
	public String getPermanent_add() {
		return permanent_add;
	}
	public void setPermanent_add(String permanent_add) {
		this.permanent_add = permanent_add;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getResponsibility() {
		return responsibility;
	}
	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
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
	@NotEmpty
	@Size(min = 4, max = 20)
	private String username;
	
	@NotEmpty
	@Size(min = 4, max = 200)
	private String password;
	
	@NotEmpty
	@Size(min = 4, max = 20)
	private String designation;
	
	@NotEmpty
	@Size(min = 4, max = 70)
	private String name;
	
	@NotEmpty
	@Size(min = 4, max = 100)
	private String email_id;
	
	@NotEmpty
	@Size(min = 4, max = 20)
	private String mobile;
	
	
	
	private String landline_no;
	private String corres_add;
	private String permanent_add;
	private String identity_proof;
	private String add_proof;
	private String photo;
	private String responsibility;
	private String timestamp;
	
	private String add_proof_type;
	private String add_proof_image_Name;
	private String identity_proof_type;
	private String identity_proof_image_name;
	private String lco_id;
	
	
	
	
}
