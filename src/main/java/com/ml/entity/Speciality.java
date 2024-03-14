package com.ml.entity;

public class Speciality {

	private int id;
	private String sp_name;

	public Speciality() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSp_name() {
		return sp_name;
	}

	public void setSp_name(String sp_name) {
		this.sp_name = sp_name;
	}

	@Override
	public String toString() {
		return "Speciality [id=" + id + ", sp_name=" + sp_name + "]";
	}

}
