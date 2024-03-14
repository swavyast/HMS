package com.ml.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ml.entity.Appointment;

public class AppointmentDAO {
	
	PreparedStatement ps;
	ResultSet rs;
	private Connection con;
	
	public AppointmentDAO(Connection con) {
		this.con = con;
	}
	
	public boolean scheduleAppointment(Appointment ap) {
		boolean flag = false;
		String sql = "insert into appointments (user, age, gender, disease, regDate, aptDate, doctor,  patientNumber, status, address, file) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getAge());
			ps.setString(3, ap.getGender().name());
			ps.setString(4, ap.getDisease().name());
			ps.setObject(5, ap.getDoreg());
			ps.setObject(6, ap.getDoapp());
			ps.setInt(7, ap.getDoctorId());
			ps.setInt(8, ap.getPatientNumber());
			ps.setString(9, ap.getStatus());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getHealthCard());
			int i = ps.executeUpdate();
			if(i==1)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public List<Appointment> listOfAppointments(long uid){
		
		List<Appointment> apList  = new ArrayList<Appointment>();
		String sql = "select * from appointments where uid=?";
		return apList;
		
	}

}
