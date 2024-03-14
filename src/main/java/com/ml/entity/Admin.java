package com.ml.entity;

import java.util.Date;

public class Admin extends User {

	private long _id;
	private String adid;
	private String secret_code;
	private int auth_level;

	public Admin() {

	}

	public Admin(long _id, String adid, String secret_code, int auth_level) {
		this._id = _id;
		this.adid = adid;
		this.secret_code = secret_code;
		this.auth_level = auth_level;
	}

	public Admin(String name, Date dob, String phone, String email, String image) {
		super(name, dob, phone, email, image);

	}
	
	public Admin(long id, String name, Date dob, String phone, String email, String image, String adid, String scode) {
		super(name, dob, phone, email, image);
		this._id = id;
		this.adid = adid;
		this.secret_code = scode;
	}

	public Admin(long id, String name, Date dob, String ph, String em, String im, String adid2, String code,
			int authL) {
		// TODO Auto-generated constructor stub
	}

	public String getAdid() {
		return adid;
	}

	public void setAdid(String adid) {
		this.adid = adid;
	}

	public String getSecret_code() {
		return secret_code;
	}

	public void setSecret_code(String secret_code) {
		this.secret_code = secret_code;
	}

	public int getAuth_level() {
		return auth_level;
	}

	public void setAuth_level(int auth_level) {
		this.auth_level = auth_level;
	}

	@Override
	public String toString() {
		return "Admin [_id=" + _id + ", adid=" + adid + ", secret_code=" + secret_code + ", auth_level=" + auth_level
				+ "]";
	}
}
