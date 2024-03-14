package com.ml.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ml.entity.Doctor;
import com.ml.entity.Qualification;

public class DoctorDao {
	private Connection con;

	public DoctorDao(Connection conn) {
//    	this.con = conn; or
		con = conn;
	}

	/*
	 * private static Connection con; private static Connection initCon() {
	 * 
	 * return con = DatabaseConfiguration.getMySQLConnection(); }
	 * 
	 */
	public boolean addDoctor(Doctor d) {
		boolean flag = false;
		/* SpecialityDao sdao = new SpecialityDao(con); */
		String sql = "insert into doctor(dob, name, email, spclt, qual, phone, password)values(?,?,?,?,?,?,?);";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setDate(1, (Date) d.getDob());
			ps.setString(2, d.getName());
			ps.setString(3, d.getEmail());
			ps.setInt(4, d.getSpclt().getId());
			ps.setObject(5, d.getQual().name());
			ps.setString(6, d.getPhone());
			ps.setString(7, d.getPassword());
			ps.setString(8, d.getImage());
			flag = ps.execute();
			return flag;
		} catch (SQLException e) {
			e.printStackTrace();
			return flag;
		}
	}

	// Doctor Login Function
	public Doctor doctorLogin(String em, String pw) {
		Doctor doc = null;
		SpecialityDao sdao = new SpecialityDao(con);
		String sql = "select * from doctor where email = ? and password = ?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, pw);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				doc = new Doctor();
				int id = rs.getInt(1);
				doc.setDob(rs.getDate(2));
				doc.setName(rs.getString(3));
				doc.setEmail(rs.getString(4));
				int i = rs.getInt(5);
				doc.setSpclt(sdao.fetchSpeciality(i));
				doc.setQual(Qualification.valueOf(rs.getString(6)));
				doc.setPhone(rs.getString(7));
				doc.setPassword(rs.getString(8));
				doc.setImage(rs.getString(9));
			}
			return doc;

		} catch (SQLException e) {
			e.printStackTrace();

			return doc;
		}
	}

	public List<Doctor> fetchDoctorList() {
		List<Doctor> dlist = new ArrayList<Doctor>();
		Doctor doc = null;
		String sql = "select * from doctor";
		SpecialityDao sdao = new SpecialityDao(con);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				doc = new Doctor();
				doc.setId(rs.getInt(1));
				doc.setDob(rs.getDate(2));
				doc.setName(rs.getString(3));
				doc.setEmail(rs.getString(4));
				doc.setSpclt(sdao.fetchSpeciality(rs.getInt(5)));
				doc.setQual(Qualification.valueOf(rs.getString(6)));
				doc.setPhone(rs.getString(7));
				doc.setPassword(rs.getString(8));
				doc.setImage(rs.getString(9));
				dlist.add(doc);
			}
			return dlist;
		} catch (SQLException e) {
			e.printStackTrace();

			return dlist;
		}
	}

	public List<Doctor> searchDoctor() {

		List<Doctor> dlist = new ArrayList<Doctor>();
		Doctor doc = null;
		SpecialityDao sdao = new SpecialityDao(con);
		String sql = "select * from doctor;";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

//			FIXME

			return dlist;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public Doctor fetchDoctorById(int id) {

		Doctor doc = null;
		String sql = "select * from doctor where id=?";
		SpecialityDao sdao = new SpecialityDao(con);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				doc = new Doctor();
				doc.setId(rs.getInt(1));
				doc.setDob(rs.getDate(2));
				doc.setName(rs.getString(3));
				doc.setEmail(rs.getString(4));
				doc.setSpclt(sdao.fetchSpeciality(rs.getInt(5)));
				doc.setQual(Qualification.valueOf(rs.getString(6)));
				doc.setPhone(rs.getString(7));
				doc.setPassword(rs.getString(8));
				doc.setImage(rs.getString(9));
			}
			return doc;
		} catch (SQLException e) {
			e.printStackTrace();

			return doc;
		}

	}
	public Doctor fetchDoctorByName(String name) {

		Doctor doc = null;
		String sql = "select * from doctor where name=?";
		SpecialityDao sdao = new SpecialityDao(con);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				doc = new Doctor();
				doc.setId(rs.getInt(1));
				doc.setDob(rs.getDate(2));
				doc.setName(rs.getString(3));
				doc.setEmail(rs.getString(4));
				doc.setSpclt(sdao.fetchSpeciality(rs.getInt(5)));
				doc.setQual(Qualification.valueOf(rs.getString(6)));
				doc.setPhone(rs.getString(7));
				doc.setPassword(rs.getString(8));
				doc.setImage(rs.getString(9));
			}
			return doc;
		} catch (SQLException e) {
			e.printStackTrace();

			return doc;
		}

	}

	public boolean updateDoctor(Doctor d) {
		boolean flag = true;
		String sql = "update doctor set dob=?, name=?, email=?, spclt=?, qual=?, phone=?, password=? where id=?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setDate(1, (Date) d.getDob());
			ps.setString(2, d.getName());
			ps.setString(3, d.getEmail());
			ps.setInt(4, d.getSpclt().getId());
			ps.setObject(5, d.getQual().name());
			ps.setString(6, d.getPhone());
			ps.setString(7, d.getPassword());
			ps.setInt(8, (int) d.getId());
			ps.setString(9, d.getImage());
			flag = ps.execute();
			return flag; // false if update was successful
		} catch (SQLException e) {
			e.printStackTrace();
			return flag;
		}
	}
	
	public boolean deleteDoctor(int id) {
		boolean flag = false;
		try {
			String sql = "delete from doctor where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1)
				flag = true;
			return flag;
		} catch (Exception e) {
			e.printStackTrace();
			return flag;
		}
	}
}
