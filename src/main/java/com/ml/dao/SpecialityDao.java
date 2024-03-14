package com.ml.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ml.entity.Speciality;

public class SpecialityDao {

	private Connection con;

	public SpecialityDao(Connection con) {
		this.con = con;

	}

	public boolean addSpeciality(String spname) {
		boolean flag = false;
		try {
			String sql = "insert into speciality(sp_name)values(?);";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, spname);
			int i = ps.executeUpdate();
			if (i == 1)
				flag = true;
			return flag;
		} catch (Exception e) {
			e.printStackTrace();
			return flag;
		}
	}

	public List<Speciality> listSpeciality() {

		List<Speciality> list = new ArrayList<Speciality>();
		Speciality s = null;
		String sql = "select * from speciality;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet r = ps.executeQuery();
			while (r.next()) {
				s=new Speciality();
				s.setId(r.getInt(1));
				s.setSp_name(r.getString(2));
				list.add(s);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return list;
		}
	}
	
	public Speciality fetchSpeciality(String spName) {
		
		Speciality sp = new Speciality();
		String sql = "select * from speciality where sp_name = ?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, spName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp.setId(rs.getInt(1));
				sp.setSp_name(rs.getString(2));
			}
			return sp;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return sp;
		}
		
	}
	
	public Speciality fetchSpeciality(int id) {
		
		Speciality sp = new Speciality();
		String sql = "select * from speciality where id = ?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sp.setId(rs.getInt(1));
				sp.setSp_name(rs.getString(2));
			}
			return sp;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return sp;
		}
		
	}

}
