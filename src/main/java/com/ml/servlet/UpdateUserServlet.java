package com.ml.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ml.dao.UserDao;
import com.ml.db.DatabaseConfiguration;
import com.ml.entity.User;

public class UpdateUserServlet extends HttpServlet{

	private String success;
	private String problem;
	private HttpSession session;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User u = new User();
			u.setName(req.getParameter("fname") + " " + req.getParameter("lname"));
			u.setDob((Date) req.getAttribute("dob"));
			u.setPhone(req.getParameter("phone"));
			u.setEmail(req.getParameter("email"));
			u.setPassword(req.getParameter("pwd"));
			u.setImage(req.getParameter("image"));
			
			UserDao udao = new UserDao(DatabaseConfiguration.getMySQLConnection());
			boolean flag = udao.updateUser(u);
			System.out.println(flag);
			session = req.getSession();
			if (flag) {
				success = "User " + u.getName() + "'s records have been updated successfully";
				session.setAttribute("response", success);
				session.setAttribute("userObj", u);
				resp.sendRedirect("index.jsp");
			} else {
				problem = "Dear user, your registration could not be completed this time\n";
				problem += "<br>Please, try again after sometimes.";
				session.setAttribute("response", problem);
				resp.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error.jsp");
		}
	}
}
