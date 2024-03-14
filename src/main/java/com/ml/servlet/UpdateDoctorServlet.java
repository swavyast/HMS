package com.ml.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ml.dao.DoctorDao;
import com.ml.dao.SpecialityDao;
import com.ml.db.DatabaseConfiguration;
import com.ml.entity.Doctor;
import com.ml.entity.Qualification;
import com.ml.entity.Speciality;

@WebServlet("/update-doctor")
public class UpdateDoctorServlet extends HttpServlet {
	
	private String success;
	private String problem;
	private HttpSession session;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id1"));
		Connection con = DatabaseConfiguration.getMySQLConnection();
		DoctorDao ddao = new DoctorDao(con);
		String ql = req.getParameter("qual");
		SpecialityDao sdao = new SpecialityDao(con);
		Speciality spclt = sdao.fetchSpeciality(req.getParameter("spclt"));
		Doctor doc = new Doctor();
		doc.setId(id);
		doc.setDob(Date.valueOf(req.getParameter("dob")));
		doc.setName(req.getParameter("name"));
		doc.setEmail(req.getParameter("email"));
		doc.setPassword(req.getParameter("password"));
		doc.setPhone(req.getParameter("phone"));
		doc.setQual(Qualification.valueOf(ql));
		doc.setSpclt(spclt);
		Part part = req.getPart("image");
		String file = part.getSubmittedFileName();
		String path = getServletContext().getRealPath("")+"images";
		File fileInstance = new File(path);
		part.write(fileInstance+File.separator+file);
		doc.setImage(file);
		session = req.getSession();
		if(!ddao.updateDoctor(doc)) {
			success = doc.getName()+"'s records have been updated successfully.";
			session.setAttribute("updateDoctor", success);
			resp.sendRedirect("admin/doctors.jsp");
		}else {
			problem = "something didn't work";
			session.setAttribute("updateDoctor", problem);
			resp.sendRedirect("admin/doctors.jsp");
		}
		
	}

}
