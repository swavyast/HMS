package com.ml.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.ml.entity.Admin;

public class AdminDao {
	private Connection con = null;
	PreparedStatement ps = null;
	private ResultSet rs;

	public AdminDao(Connection con) {
		this.con = con;
	}

	// Admin Login Function

	public Admin adminLogin(String uid, String code) throws SQLException {
		Admin a = null;
		// String sql = "select * from admin where adid = '" + uid + "' and secret_code
		// = '" + code + "';";
		//String sql = "select * from user where adid = (select adid from admin where secret_code=?);";
		String sql = "select a.* , u.name, u.dob, u.phone, u.email, u.image from admin a right join user u on u.adid=? and a.secret_code=? limit 1;";	
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, uid);
			ps.setString(2, code);
			rs = ps.executeQuery();
			while (rs != null && rs.next()) {
				uid = rs.getString(1);
				code = rs.getString(2);
				int authL = rs.getInt(3);
				long id = rs.getLong(4); //admin table unique id
				String name = rs.getString(5);
				Date dob = rs.getDate(6);
				String ph = rs.getString(7);
				String em = rs.getString(8);
				String im = rs.getString(9);
				
				a = new Admin(id, name, dob, ph, em, im, uid, code);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return a;
	}

	public Admin updateAdmin(Admin a) {
		String sql = "update user set id=?, name=?, dob=?, phone=?, email=?, password=?, image=?, adid=?";
		
		return a;
	}

	public Admin adminByAdId(String adid) {
		Admin admin = null;
		// select * from user u right join admin a on u.adid = a.adid;
		//String sql = "select u.* , a.secret_code, a.auth_level from user u right join admin a on a.adid = u.adid;";
		//String sql = "select * from user where adid = (select adid from admin where secret_code=?);";
		String sql = "select a.* , u.name, u.dob, u.phone, u.email, u.image from admin a right join user u on u.adid=? and a.adid=? limit 1;";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, adid);
			ps.setString(2, adid);
			rs = ps.executeQuery();
			while (rs != null && rs.next()) {
//				id = rs.getLong(1);
//				String name = rs.getString(2);
//				Date dob = rs.getDate(3);
//				String ph = rs.getString(4);
//				String em = rs.getString(5);
//				String pw = rs.getString(6);
//				String im = rs.getString(7);
//				adid = rs.getString(8);
				//admin = new Admin(id, name, dob, ph, em, pw, im, adid);
				adid = rs.getString(1);
				String code = rs.getString(2);
				int authL = rs.getInt(3);
				long id = rs.getLong(4); //admin table unique id
				String name = rs.getString(5);
				Date dob = rs.getDate(6);
				String ph = rs.getString(7);
				String em = rs.getString(8);
				String im = rs.getString(9);
				admin = new Admin(id, name, dob, ph, em, im, adid, code, authL);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}

	// User Count Function

	// Doctor Count Function

	// Appointment Count Function

	// Specialist Count Function

}
