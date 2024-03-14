package com.ml.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ml.dao.DoctorDao;
import com.ml.db.DatabaseConfiguration;

@WebServlet("/delete-doctor")
public class DeleteDoctorServlet extends HttpServlet {
	private HttpSession session;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		session = req.getSession();
		DoctorDao ddao = new DoctorDao(DatabaseConfiguration.getMySQLConnection());
		if(ddao.deleteDoctor(id)) {
			session.setAttribute("deleteSuccess", "Deleted Successfully");
			resp.sendRedirect("admin/doctors.jsp");
		}else {
			session.setAttribute("deleteFailed", "Oops! Seems like it didn't go well.<br>");
			resp.sendRedirect("admin/doctors.jsp");
		}
	}
}
