package com.ml.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ml.entity.Address;

public class AddressDao {
	
	private Connection con;
	
	public AddressDao(Connection con) {
		this.con = con;
	}

	public boolean addAddress(Address a) {
		boolean flag = false;
		String sql = "insert into address (street, city, state, country, pin) values (?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, a.getStreet());
			ps.setString(2, a.getCity());
			ps.setString(3, a.getState());
			ps.setString(4, a.getCountry());
			ps.setInt(5, a.getPin());
			int i = ps.executeUpdate();
			if(i==1)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
}
