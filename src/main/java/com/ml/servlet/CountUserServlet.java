package com.ml.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ml.dao.UserDao;
import com.ml.db.DatabaseConfiguration;

@WebServlet("/countUsers")
public class CountUserServlet extends HttpServlet {
	
	private HttpSession session;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao udao = new UserDao(DatabaseConfiguration.getMySQLConnection());
		session=req.getSession();
		int result = udao.countNonNullUsers();
		if(result>0) {
		session.setAttribute("countResult", result);
		resp.sendRedirect("admin/index.jsp");
		}else {
			session.setAttribute("countResult", "oops!");
			resp.sendRedirect("admin/index.jsp");
		}
	}
	
	
}
