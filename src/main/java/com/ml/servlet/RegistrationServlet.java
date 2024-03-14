package com.ml.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import com.ml.dao.UserDao;
import com.ml.db.DatabaseConfiguration;
import com.ml.db.DatabaseUtilities;
import com.ml.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
@WebServlet("/registration")
@MultipartConfig
public class RegistrationServlet extends HttpServlet {

	private static final Logger LOG = LoggerFactory.getLogger(RegistrationServlet.class);

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String success;
			String problem;
			HttpSession session;
			Part part = req.getPart("image");
			String file = part.getSubmittedFileName();
			User u = new User();
			UserDao udao = new UserDao(DatabaseConfiguration.getMySQLConnection());
			String path = getServletContext().getRealPath("") + "images";
			File fileInstance = new File(path);

			u.setName(req.getParameter("fname") + " " + req.getParameter("lname"));
			u.setDob((Date) req.getAttribute("dob"));
			u.setPhone(req.getParameter("phone"));
			u.setEmail(req.getParameter("email"));
			u.setPassword(req.getParameter("pwd"));
			u.setImage(file);
			part.write(fileInstance + File.separator + file);
			boolean flag = udao.createUser(u);
			session = req.getSession();
			if (flag) {
				success = "Dear " + u.getName() + "<br>You are registered successfully";
				session.setAttribute("response", success);
				session.setAttribute("userObj", u);
				resp.sendRedirect("user/index.jsp");
			} else {
				problem = "Dear user, your registration could not be completed this time\n";
				problem += "<br>Please, try again after sometimes.";
				session.setAttribute("response", problem);
				resp.sendRedirect("registration.jsp");
			}

		} catch (Exception e) {
			DatabaseUtilities.getDetailedStackTrace(e);
			try {
				resp.sendRedirect("error.jsp");
			} catch (Exception nextedE) {
				LOG.info("nested exception for resp.sendRedirect()");
				DatabaseUtilities.getDetailedStackTrace(nextedE);
			}
		}
	}

}