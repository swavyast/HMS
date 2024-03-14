package com.ml.servlet;

import java.sql.SQLException;

import com.ml.dao.AdminDao;
import com.ml.db.DatabaseConfiguration;
import com.ml.entity.Admin;

public class ADAO_Test {
	
	public static void main(String[] args) {
		AdminDao a = new AdminDao(DatabaseConfiguration.getMySQLConnection());
		try {
			Admin adm = a.adminLogin("delphic", "n0Trespass!ng");
			System.out.println(adm.getAdid()+ adm.getId()+adm.getAuth_level());
			Admin a2 = a.adminByAdId("delphic");
			System.out.println(a2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
