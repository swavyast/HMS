package com.ml.entity;

import java.util.Date;

public class Doctor{

	private long id;
	private Date dob;
	private String name;
	private String email;
	private Speciality spclt;
	private Qualification qual;
	private String phone;
	private String password;
	private String image;

	public Doctor() {

	}

	public Doctor(Date dob, String name, String email, Speciality spclt, Qualification qual, String phone,
			String password) {
		super();
		this.dob = dob;
		this.name = name;
		this.email = email;
		this.spclt = spclt;
		this.qual = qual;
		this.phone = phone;
		this.password = password;
	}

	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Speciality getSpclt() {
		return spclt;
	}

	public void setSpclt(Speciality spclt) {
		this.spclt = spclt;
	}

	public Qualification getQual() {
		return qual;
	}

	public void setQual(Qualification qual) {
		this.qual = qual;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Doctor [id=" + id + ", dob=" + dob + ", name=" + name + ", email=" + email + ", spclt=" + spclt
				+ ", qual=" + qual + ", phone=" + phone + ", password=" + password + ", image=" + image + "]";
	}

}
