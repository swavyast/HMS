package com.ml.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ml.dao.DoctorDao;
import com.ml.db.DatabaseConfiguration;
import com.ml.entity.Doctor;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	
	private HttpSession session;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		session = req.getSession();
		String s = req.getParameter("query");
		DoctorDao ddao = new DoctorDao(DatabaseConfiguration.getMySQLConnection());
		
		resp.sendRedirect("wip.jsp");
	}
}
