package com.ml.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ml.dao.SpecialityDao;
import com.ml.db.DatabaseConfiguration;

@WebServlet("/addSpeciality")
public class AddSpecialityServlet extends HttpServlet {

	private String success;
	private String problem;
	private HttpSession session;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		boolean flag = false;
		String sp1 = req.getParameter("speciality");
		SpecialityDao sdao = new SpecialityDao(DatabaseConfiguration.getMySQLConnection());
		session = req.getSession();

		flag = sdao.addSpeciality(sp1);
		if (!flag) {
			problem = "something's wrong";
			session.setAttribute("resp", problem);
			resp.sendRedirect("admin/index.jsp");
		} else {
			success = sp1 + " has been added successfully";
			session.setAttribute("resp", success);
			resp.sendRedirect("admin/index.jsp");
		}

	}

}
